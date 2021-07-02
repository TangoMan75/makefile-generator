#!/bin/sh
set -e

#/*
# * This script is based on TangoMan Shoe Shell Microframework version 0.1.0-xs
# *
# * This file is distributed under to the MIT license.
# *
# * Copyright (c) 2021 "Matthias Morin" <mat@tangoman.io>
# *
# * Permission is hereby granted, free of charge, to any person obtaining a copy
# * of this software and associated documentation files (the "Software"), to deal
# * in the Software without restriction, including without limitation the rights
# * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# * copies of the Software, and to permit persons to whom the Software is
# * furnished to do so, subject to the following conditions:
# *
# * The above copyright notice and this permission notice shall be included in all
# * copies or substantial portions of the Software.
# *
# * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# * SOFTWARE.
# *
# * Source code is available here: https://github.com/TangoMan75/shoe
# */

#/**
# * TangoMan CI Manager
# *
# * Run Continuous Integration
# *
# * @author  "Matthias Morin" <mat@tangoman.io>
# * @version 0.1.0
# * @link    https://github.com/TangoMan75/makefile-generator
# */

## Return staged bash files
get_staged_bash_files() {
    if [ ! -x "$(command -v git)" ]; then
        echo_error "\"$(basename "${0}")\" requires git, try: 'sudo apt-get install -y git'\n"
        exit 1
    fi

    if git rev-parse --verify HEAD >/dev/null 2>&1; then
        against=HEAD
    else
        # Initial commit: diff against an empty tree object
        against=$(git hash-object -t tree /dev/null)
    fi

    # --diff-filter
    # A Added
    # C Copied
    # M Modified
    # R Renamed
    git diff-index --cached --name-only --diff-filter=ACMR "${against}" | grep \
        -e '\.bashrc' \
        -e '\.zshrc' \
        -e '\.bash_profile' \
        -e '\.sh$' || true
}

## Return staged php files
get_staged_php_files() {
    if [ ! -x "$(command -v git)" ]; then
        echo_error "\"$(basename "${0}")\" requires git, try: 'sudo apt-get install -y git'\n"
        exit 1
    fi

    if git rev-parse --verify HEAD >/dev/null 2>&1; then
        against=HEAD
    else
        # Initial commit: diff against an empty tree object
        against=$(git hash-object -t tree /dev/null)
    fi

    # --diff-filter
    # A Added
    # C Copied
    # M Modified
    # R Renamed
    git diff-index --cached --name-only --diff-filter=ACMR "${against}" | grep -e '\.php$'
}

## Install git hooks
hooks() {
    echo_info 'rm -fr .git/hooks\n'
    rm -fr .git/hooks

    echo_info 'cp -r .githooks .git/hooks\n'
    cp -r .githooks .git/hooks

    echo_info 'chmod +x .git/hooks/*\n'
    chmod +x .git/hooks/*
}

## Install bash_unit framework
install() {
    if [ ! -d ./tests ]; then
        mkdir -p ./tests

    cat > "./tests/test_sample.sh" <<EOF
#!/bin/bash

# https://github.com/pgrange/bash_unit
#
#     assert "test -e /tmp/the_file"
#     assert_fails "grep this /tmp/the_file" "should not write 'this' in /tmp/the_file"
#     assert_status_code 25 code
#     assert_equals "a string" "another string" "a string should be another string"
#     assert_not_equals "a string" "a string" "a string should be different from another string"
#     fake ps echo hello world

test_can_fail() {
    fail "You need to write some tests"
}
EOF
    fi

    if [ ! -f "./tests/bash_unit" ]; then
        if [ -x "$(command -v wget)" ]; then
            echo_info "wget -qO \"./tests/bash_unit\" https://raw.githubusercontent.com/pgrange/bash_unit/master/bash_unit\n"
            wget -qO "./tests/bash_unit" https://raw.githubusercontent.com/pgrange/bash_unit/master/bash_unit

        elif [ -x "$(command -v curl)" ]; then
            echo_info "curl -sSL -o \"./tests/bash_unit\" https://raw.githubusercontent.com/pgrange/bash_unit/master/bash_unit\n"
            curl -sSL -o "./tests/bash_unit" https://raw.githubusercontent.com/pgrange/bash_unit/master/bash_unit

        else
            echo_error "could not find \"bash_unit\" executable, please install manually\n"
            exit 1
        fi
    fi

    if [ ! -x "./tests/bash_unit" ]; then
        echo_info "chmod +x \"./tests\"/bash_unit\n"
        chmod +x ./tests/bash_unit
    fi
}

## Sniff errors with linter
lint() {
    if [ ! -x "$(command -v shellcheck)" ]; then
        echo_error "\"$(basename "${0}")\" requires shellcheck, try: 'sudo apt-get install -y shellcheck'\n"
        exit 1
    fi

    find . -maxdepth 3 -type f -name '*.sh' | sort -t '\0' -n | while read -r FILE
    do
        echo_info "shellcheck \"${FILE}\"\n"
        shellcheck "${FILE}"
    done
}

## Run tests
tests() {
    find ./tests -maxdepth 3 -type f -name 'test_*.sh' | sort -t '\0' -n | while read -r FILE
    do
        echo_info "./tests/bash_unit -f tap \"${FILE}\"\n"
        ./tests/bash_unit -f tap "${FILE}"
    done
}

## Run script in Alpine Linux Docker container
alpine() {
    if [ ! -x "$(command -v docker)" ]; then
        echo_error "\"$(basename "${0}")\" requires docker, try 'sudo apt-get install -y docker.io'\n"
        return 1
    fi

    echo_info "docker run -it --rm --volume=\"$(pwd):/home:ro\" --workdir=\"/home\" alpine sh entrypoint.sh\n"
    docker run -it --rm --volume="$(pwd):/home:ro" --workdir="/home" alpine sh entrypoint.sh
}

## Run script in Busybox Linux Docker container
busybox() {
    if [ ! -x "$(command -v docker)" ]; then
        echo_error "\"$(basename "${0}")\" requires docker, try 'sudo apt-get install -y docker.io'\n"
        return 1
    fi

    echo_info "docker run -it --rm --volume=\"$(pwd):/home:ro\" --workdir=\"/home\" busybox sh entrypoint.sh\n"
    docker run -it --rm --volume="$(pwd):/home:ro" --workdir="/home" busybox sh entrypoint.sh
}

## Run script in Ubuntu Linux Docker container
ubuntu() {
    if [ ! -x "$(command -v docker)" ]; then
        echo_error "\"$(basename "${0}")\" requires docker, try 'sudo apt-get install -y docker.io'\n"
        return 1
    fi

    echo_info "docker run -it --rm --volume=\"$(pwd):/home:ro\" --workdir=\"/home\" ubuntu sh entrypoint.sh\n"
    docker run -it --rm --volume="$(pwd):/home:ro" --workdir="/home" ubuntu sh entrypoint.sh
}

#--------------------------------------------------
# copy/paste here TangoMan helper functions
# (like a nice set of semantic colors)
#--------------------------------------------------

# shellcheck disable=SC2034
{
    PRIMARY='\033[97m'; SECONDARY='\033[94m'; SUCCESS='\033[32m'; DANGER='\033[31m'; WARNING='\033[33m'; INFO='\033[95m'; LIGHT='\033[47;90m'; DARK='\033[40;37m'; DEFAULT='\033[0m'; NL='\033[0m\n';
    ALERT_PRIMARY='\033[1;104;97m'; ALERT_SECONDARY='\033[1;45;97m'; ALERT_SUCCESS='\033[1;42;97m'; ALERT_DANGER='\033[1;41;97m'; ALERT_WARNING='\033[1;43;97m'; ALERT_INFO='\033[1;44;97m'; ALERT_LIGHT='\033[1;47;90m'; ALERT_DARK='\033[1;40;37m';
}

echo_primary()   { printf "%b%b${DEFAULT}" "${PRIMARY}"   "${*}"; }
echo_secondary() { printf "%b%b${DEFAULT}" "${SECONDARY}" "${*}"; }
echo_success()   { printf "%b%b${DEFAULT}" "${SUCCESS}"   "${*}"; }
echo_danger()    { printf "%b%b${DEFAULT}" "${DANGER}"    "${*}"; }
echo_warning()   { printf "%b%b${DEFAULT}" "${WARNING}"   "${*}"; }
echo_info()      { printf "%b%b${DEFAULT}" "${INFO}"      "${*}"; }
echo_light()     { printf "%b%b${DEFAULT}" "${LIGHT}"     "${*}"; }
echo_dark()      { printf "%b%b${DEFAULT}" "${DARK}"      "${*}"; }

echo_label()     { if [ $# -eq 2 ]; then printf "%b%-${1}s ${DEFAULT}" "${SUCCESS}" "$2"; else printf "%b%b ${DEFAULT}" "${SUCCESS}" "${*}"; fi }
echo_error()     { printf "%berror: %b${DEFAULT}" "${DANGER}"  "${*}"; }

alert_primary()   { printf "${NL}%b%64s${NL}%b %-63s${NL}%b%64s${NL}\n" "${ALERT_PRIMARY}"   '' "${ALERT_PRIMARY}"   "${*}" "${ALERT_PRIMARY}"   ''; }
alert_secondary() { printf "${NL}%b%64s${NL}%b %-63s${NL}%b%64s${NL}\n" "${ALERT_SECONDARY}" '' "${ALERT_SECONDARY}" "${*}" "${ALERT_SECONDARY}" ''; }
alert_success()   { printf "${NL}%b%64s${NL}%b %-63s${NL}%b%64s${NL}\n" "${ALERT_SUCCESS}"   '' "${ALERT_SUCCESS}"   "${*}" "${ALERT_SUCCESS}"   ''; }
alert_danger()    { printf "${NL}%b%64s${NL}%b %-63s${NL}%b%64s${NL}\n" "${ALERT_DANGER}"    '' "${ALERT_DANGER}"    "${*}" "${ALERT_DANGER}"    ''; }
alert_warning()   { printf "${NL}%b%64s${NL}%b %-63s${NL}%b%64s${NL}\n" "${ALERT_WARNING}"   '' "${ALERT_WARNING}"   "${*}" "${ALERT_WARNING}"   ''; }
alert_info()      { printf "${NL}%b%64s${NL}%b %-63s${NL}%b%64s${NL}\n" "${ALERT_INFO}"      '' "${ALERT_INFO}"      "${*}" "${ALERT_INFO}"      ''; }
alert_light()     { printf "${NL}%b%64s${NL}%b %-63s${NL}%b%64s${NL}\n" "${ALERT_LIGHT}"     '' "${ALERT_LIGHT}"     "${*}" "${ALERT_LIGHT}"     ''; }
alert_dark()      { printf "${NL}%b%64s${NL}%b %-63s${NL}%b%64s${NL}\n" "${ALERT_DARK}"      '' "${ALERT_DARK}"      "${*}" "${ALERT_DARK}"      ''; }

#--------------------------------------------------
# You do not need to worry about anything that's
# placed after this line. ;-)
#--------------------------------------------------

## Print this help (default)
help() {
    _padding=$(_get_padding)

    _print_title       "$(_get_docbloc_title)"
    _print_infos       "${_padding}"
    _print_description "$(_get_docbloc_description)"
    _print_usage
    _print_commands    "${_padding}"
}

#--------------------------------------------------

_print_title() {
    printf "${NL}${ALERT_PRIMARY}%64s${NL}${ALERT_PRIMARY} %-63s${NL}${ALERT_PRIMARY}%64s${NL}\n" '' "$1" '';
}

_print_infos() {
    _padding="$1"
    if [ -z "$1" ]; then _padding=12; fi
    printf "%bInfos:%b\n" "${WARNING}" "${DEFAULT}"
    printf "${SUCCESS}  %-${_padding}s ${DEFAULT}%s\n" 'author'  "$(_get_docbloc 'author')"
    printf "${SUCCESS}  %-${_padding}s ${DEFAULT}%s\n" 'version' "$(_get_docbloc 'version')"
    printf "${SUCCESS}  %-${_padding}s ${DEFAULT}%s\n" 'link'    "$(_get_docbloc 'link')"
    printf '\n'
}

_print_description() {
    printf "%bDescription:%b\n" "${WARNING}" "${DEFAULT}"
    printf "\033[97m  %s${NL}\n" "$(echo "$1" | fold -w 64 -s)"
}

_print_usage() {
    printf "%bUsage:%b\n" "${WARNING}" "${DEFAULT}"
    printf "${INFO}  sh %s${INFO} [${SUCCESS}command${INFO}]${DEFAULT} " "$(basename "$0")"
    awk -F '=' "/^[a-zA-Z0-9_]+=.+\$/ {
        if (substr(PREV, 1, 3) == \"## \" && \$1 != toupper(\$1) && substr(\$0, 1, 1) != \"_\")
        printf \"${INFO}(${SUCCESS}--%s=${WARNING}%s${INFO})${DEFAULT} \", \$1, \$2
    } { PREV = \$0 }" "$0"
    printf '\n\n'
}

_print_commands() {
    _padding="$1"
    if [ -z "$1" ]; then _padding=12; fi
    printf "%bCommands:%b\n" "${WARNING}" "${DEFAULT}"
    awk "/^### /{printf\"\n${WARNING}%s:${NL}\",substr(\$0,5)}
        /^(function )? *[a-zA-Z0-9_]+ *\(\) *\{/ {
        sub(\"^function \",\"\"); gsub(\"[ ()]\",\"\");
        FUNCTION = substr(\$0, 1, index(\$0, \"{\"));
        sub(\"{\$\", \"\", FUNCTION);
        if (substr(PREV, 1, 3) == \"## \" && substr(\$0, 1, 1) != \"_\")
        printf \"${SUCCESS}  %-${_padding}s ${DEFAULT}%s\n\", FUNCTION, substr(PREV, 4)
    } { PREV = \$0 }" "$0"
    printf '\n'
}

#--------------------------------------------------

_get_docbloc_title() {
    awk '/^#\/\*\*$/,/^# \*\/$/{i+=1; if (i==2) print substr($0, 5)}' "$0"
}

_get_docbloc_description() {
    awk '/^# \* @/ {i=2} /^#\/\*\*$/,/^# \*\/$/{i+=1; if (i>3) printf "%s ", substr($0, 5)}' "$0"
}

_get_docbloc() {
    awk -v TAG="$1" '/^#\/\*\*$/,/^# \*\/$/{if($3=="@"TAG){for(i=4;i<=NF;++i){printf "%s ",$i}}}' "$0"
}

_get_padding() {
    awk -F '=' '/^[a-zA-Z0-9_]+=.+$/ { MATCH = $1 }
    /^(function )? *[a-zA-Z0-9_]+ *\(\) *\{/ {
        sub("^function ",""); gsub("[ ()]","");
        MATCH = substr($0, 1, index($0, "{"));
        sub("{$", "", MATCH);
    } { if (substr(PREV, 1, 3) == "## " && substr(MATCH, 1, 1) != "_" && length(MATCH) > LENGTH) LENGTH = length(MATCH) }
    { PREV = $0 } END { print LENGTH+1 }' "$0"
}

#--------------------------------------------------

_get_functions() {
    # this regular expression matches functions with either bash or sh syntax
    awk '/^(function )? *[a-zA-Z0-9_]+ *\(\) *\{/ {
        sub("^function ",""); gsub("[ ()]","");   # remove leading "function ", round brackets and extra spaces
        FUNCTION = substr($0, 1, index($0, "{")); # truncate string after opening curly brace
        sub("{$", "", FUNCTION);                  # remove trailing curly brace
        if (substr(PREV, 1, 3) == "## " && substr($0, 1, 1) != "_") print FUNCTION
    } { PREV = $0 }' "$0"
}

#--------------------------------------------------

_main() {
    if [ $# -lt 1 ]; then
        help
        exit 0
    fi

    _execute=''
    for _argument in "$@"; do
        _is_valid=false
        for _function in $(_get_functions); do
            # get shorthand character
            _shorthand="$(echo "${_function}" | awk '{$0=substr($0, 1, 1); print}')"
            if [ "${_argument}" = "${_function}" ] || [ "${_argument}" = "${_shorthand}" ]; then
                # append argument to the execute stack
                _execute="${_execute} ${_function}"
                _is_valid=true
                break
            fi
        done
        # unknown parameters will raise errors
        if [ "${_is_valid}" = false ]; then
            printf "${DANGER}error: \"%s\" is not a valid command${NL}" "${_argument}"
            help
            exit 1
        fi
    done

    for _function in ${_execute}; do
        eval "${_function}"
    done
}

_main "$@"
