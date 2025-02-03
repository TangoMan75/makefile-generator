![GH language](https://img.shields.io/github/languages/top/{{ GIT_USER }}/{{ REPOSITORY }})
[![GH tag](https://img.shields.io/github/v/tag/{{ GIT_USER }}/{{ REPOSITORY }})](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/tags)
[![GH release](https://img.shields.io/github/v/release/{{ GIT_USER }}/{{ REPOSITORY }})](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/releases)
[![GH license](https://img.shields.io/github/license/{{ GIT_USER }}/{{ REPOSITORY }})]((https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/blob/main/LICENSE))
[![GH stars](https://img.shields.io/github/stars/{{ GIT_USER }}/{{ REPOSITORY }})](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/stargazers)
[![Bash CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/bash_unit%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/bash_unit.yml)
[![Make CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/Make%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/make.yml)
[![Node CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/Node%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/node.yml)
[![PHP CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/PHP%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/php.yml)
[![ShellCheck CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/ShellCheck%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/shellcheck.yml)
[![Symfony CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/Symfony%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/symfony.yml)
![visitors](https://visitor-badge.glitch.me/badge?page_id={{ GIT_USER }}.{{ REPOSITORY }})

{{ PROJECT }}
===

{{ DESCRIPTION }}

⏳ TL;DR
--------

[place here a short description of how to install and use your project]

📑 Documentation
----------------

Documentation available here: [./docs/{{ REPOSITORY }}.md](./docs/{{ REPOSITORY }}.md)

🎯 Features
-----------

**{{ PROJECT }}** provides the following features:

- ⚡ Feature 1
- ⚡ Feature 2
- ⚡ Feature 3
- ⚡ Feature 4

🚀 Installation
---------------

### ⚡ Step 1: Simply enter following command in your terminal

```bash
$ make [command]
```

🔥 Usage
--------

Run `make` to print help

```bash
$ make [command] {{ USAGE }}
```

Available commands are: `{{ PHONY }}`

🤖 Commands
-----------

{{ MARKDOWN }}

💻 Dependencies
---------------

**{{ PROJECT }}** requires the following dependencies:

- bash_unit
- Composer
- Docker
- Docker-compose
- Gawk
- git
- Make
- Node.js
- npm
- PHP
- Python3
- Python3-pip
- Sass
- Sed
- Yarn

---

### 🔎 bash_unit

#### 🐧 Install bash_unit (Linux)

```bash
# download binary with wget
wget -qO "./tests/bash_unit" https://raw.githubusercontent.com/pgrange/bash_unit/master/bash_unit
# download binary with curl
curl -sSL -o "./tests/bash_unit" https://raw.githubusercontent.com/pgrange/bash_unit/master/bash_unit
# download binary with git
git clone https://github.com/pgrange/bash_unit
```

---

### 📦 Composer

Learn how to install Composer from official documentation [here](https://getcomposer.org/download/)

#### 🐧 Install Composer (Linux)

On linux machine install composer globally with the following commands (requires php):

```bash
# download binary
$ php -r "copy('https://getcomposer.org/composer-stable.phar', 'composer.phar');"
# install composer globally
$ sudo mv composer.phar /usr/local/bin/composer
# fix permissions
$ sudo chmod uga+x /usr/local/bin/composer
$ sync
# install symfony flex globally to speed up download of composer packages (parallelized prefetching)
$ composer global require 'symfony/flex' --prefer-dist --no-progress --no-suggest --classmap-authoritative
$ composer clear-cache
```

---

### 🐋 Docker

#### 🐧 Install Docker (Linux)

On linux machine enter following command

```bash
$ sudo apt-get install --assume-yes docker.io
```

#### 🔧 Configure Docker (Linux)

Add current user to docker group

```bash
$ sudo usermod -a -G docker ${USER}
```

> You will need to log out and log back in current user to use docker

> If your group membership is not properly re-evaluated, enter following command

```bash
$ newgrp docker
```

#### 🏁 Install Docker (Windows)

Download docker community edition installer from docker hub:

- [https://hub.docker.com/editions/community/docker-ce-desktop-windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)

#### 🍎 Install Docker (OSX)

Download docker community edition installer from docker hub:

- [https://hub.docker.com/editions/community/docker-ce-desktop-mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)

---

### 🐳 Docker Compose

#### 🐧 Install Docker Compose (Linux)

On linux machine you will need curl to install docker-compose with the following commands

```bash
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m`" -o /usr/bin/docker-compose
$ sudo chmod uga+x /usr/bin/docker-compose
$ sync
```

---

### 🔖 git

#### 🐧 Install git (Linux)

```bash
$ sudo apt-get install --assume-yes git
```

#### 🏁 Install git (Windows)

Download and install latest version from here [git-scm.com](https://git-scm.com/download/win)

#### 🍎 Install git (OSX)

```bash
$ brew install git
```

#### 🔧 git configuration

Push current branch only if upstream exists

```bash
$ git config --global push.default simple
```

Set vim as git default editor

```bash
$ git config --global core.editor 'vim'
```

### ⚡ Initialize git submodules

In order to download project submodules, enter the following command

```bash
$ git submodule update --init --recursive
```

---

### 🛠 Gawk

#### 🐧 Install Gawk (Linux)

On linux machine enter following command

```bash
$ sudo apt-get install --assume-yes gawk
```

#### 🏁 Install Gawk (Windows)

On windows machine you will need to install [cygwin](http://www.cygwin.com/) or Gawk for Windows](http://gnuwin32.sourceforge.net/packages/gawk.htm) first to execute script.

#### 🍎 Install Gawk (OSX)

Gawk should be available by default on OSX system, but you can upgrade Gawk version with following command

```bash
$ brew install gawk
```

---

### 🛠 Make

#### 🐧 Install Make (Linux)

On linux machine enter following command

```bash
$ sudo apt-get install --assume-yes make
```

#### 🏁 Install Make (Windows)

On windows machine you will need to install [cygwin](http://www.cygwin.com/) or [GnuWin make](http://gnuwin32.sourceforge.net/packages/make.htm) first to execute make script.

#### 🍎 Install Make (OSX)

Make should be available by default on OSX system, but you can upgrade make version with following command

```bash
$ brew install make
```

---

### 🦖 Node.js

#### 🐧 Install Node.js (Linux)

On linux machine install node globally with the following commands (requires curl):

```bash
$ curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
$ sudo apt-get install --assume-yes nodejs
```

#### 🏁 Install Node.js (Windows)

Download and install recommended LTS version from here: [Node.js](https://nodejs.org/en/download)

#### 🍎 Install Node.js (OSX)

Download and install recommended LTS version from here: [Node.js](https://nodejs.org/en/download)

---

### 🐘 PHP

Learn how to install PHP from official documentation [here](https://www.php.net/manual/en/install.php)

#### 🐧 Install PHP (Linux)

On linux machine enter following commands

```bash
$ sudo add-apt-repository --assume-yes ppa:ondrej/php
$ sudo apt-get update
$ sudo apt-get install --assume-yes php7.2
```

---

### 🐍 Python3

#### 🐧 Install Python3 (Linux)

On linux machine enter following command

```bash
$ sudo apt-get install --assume-yes python3
```

#### 🏁 Install Python3 (Windows)

Download and install latest version from here [python.org](https://python.org)

#### 🍎 Install Python3 (OSX)

You can install python through the Homebrew package manager. Homebrew will install python-pip as well.

```bash
$ brew install python
```

---

### 🐍 Python3-pip

#### 🐧 Install Python3-pip (Linux)

On linux machine enter following command

```bash
$ sudo apt-get install --assume-yes python3-pip
```

---

### 🦄 Sass

#### 🐧 Install Sass (Linux)

On linux machine install sass globally with the following commands.

With yarn:
```bash
$ sudo yarn global add sass
```

With npm:
```bash
$ sudo npm install sass -g
```

---

### 🛠 Sed

#### 🐧 Install Sed (Linux)

On linux machine enter following command

```bash
$ sudo apt-get install --assume-yes sed
```

#### 🏁 Install Sed (Windows)

On windows machine you will need to install [cygwin](http://www.cygwin.com/) or [Sed for Windows](http://gnuwin32.sourceforge.net/packages/sed.htm) first to execute script.

#### 🍎 Install Sed (OSX)

Sed should be available by default on OSX system, but you can upgrade Sed version with following command

```bash
$ brew install sed
```

---

### 🧶 Yarn

#### 🐧 Install Yarn (Linux)

On linux machine install yarn globally with the following commands (requires curl):

```bash
$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
$ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
$ sudo apt-get update
$ sudo apt-get install --assume-yes yarn
```

#### 🏁 Install Yarn (Windows)

Download and install latest version from here: [yarnpkg.com](https://classic.yarnpkg.com/en/docs/install/#windows-stable)

#### 🍎 Install Yarn (OSX)

You can install Yarn through the Homebrew package manager. This will also install Node.js if it is not already installed.

```bash
$ brew install yarn
```

---

### 🕶 Vue-Cli

#### 🧶 Install With Yarn

```bash
$ sudo yarn global add @vue/cli
```

#### 📦 Install With npm

```bash
$ sudo npm install -g @vue/cli-service-global
```

---

📝 Notes
--------

- Note 1
- Note 2
- Note 3
- Note 4

🗓 Todo
-------

- Task 1
- Task 2
- Task 3
- Task 4

🔮 Roadmap
----------

- Release 0.1.0

🤝 Contributing
---------------

Thank you for your interest in contributing to **{{ PROJECT }}**.

Please review the [code of conduct](./CODE_OF_CONDUCT.md) and [contribution guidelines](./CONTRIBUTING.md) before starting to work on any features.

If you want to open an issue, please check first if it was not [reported already](https://{{ GIT_SERVER }}/{{ GIT_USER }}/{{ REPOSITORY }}/issues) before creating a new one.

📜 License
----------

Copyrights (c) {{ YEAR }} &quot;{{ AUTHOR }}&quot; &lt;{{ EMAIL }}&gt;

[![License](https://img.shields.io/badge/Licence-{{ LICENSE }}-green.svg)](LICENSE)
Distributed under the {{ LICENSE }} license.

If you like **{{ PROJECT }}** please star, follow or tweet about it:

[![GitHub stars](https://img.shields.io/github/stars/{{ GIT_USER }}/{{ REPOSITORY }}?style=social)](https://{{ GIT_SERVER }}/{{ GIT_USER }}/{{ REPOSITORY }}/stargazers)
[![GitHub followers](https://img.shields.io/github/followers/{{ GIT_USER }}?style=social)](https://{{ GIT_SERVER }}/{{ GIT_USER }})
[![Twitter](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2F{{ GIT_SERVER }}%2F{{ GIT_USER }}%2F{{ REPOSITORY }})](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2F{{ GIT_SERVER }}%2F{{ GIT_USER }}%2F{{ REPOSITORY }})

... And check my other cool projects.

🙏 Acknowledgements
-------------------

Script created with [makefile-generator](https://github.com/TangoMan75/makefile-generator)
