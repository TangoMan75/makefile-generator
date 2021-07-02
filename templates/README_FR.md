![GH language](https://img.shields.io/github/languages/top/{{ GIT_USER }}/{{ REPOSITORY }})
[![GH tag](https://img.shields.io/github/v/tag/{{ GIT_USER }}/{{ REPOSITORY }})](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/tags)
[![GH release](https://img.shields.io/github/v/release/{{ GIT_USER }}/{{ REPOSITORY }})](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/releases)
[![GH license](https://img.shields.io/github/license/{{ GIT_USER }}/{{ REPOSITORY }})]((https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/blob/master/LICENSE))
[![GH stars](https://img.shields.io/github/stars/{{ GIT_USER }}/{{ REPOSITORY }})](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/stargazers)
[![Bash CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/bash_unit%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/bash_unit.yml)
[![Make CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/Make%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/make.yml)
[![Node CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/Node%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/node.yml)
[![PHP CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/PHP%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/php.yml)
[![ShellCheck CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/ShellCheck%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/shellcheck.yml)
[![Symfony CI](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/workflows/Symfony%20CI/badge.svg)](https://github.com/{{ GIT_USER }}/{{ REPOSITORY }}/actions/workflows/symfony.yml)
![visiteurs](https://visitor-badge.glitch.me/badge?page_id={{ GIT_USER }}.{{ REPOSITORY }})

{{ PROJECT }}
===

{{ DESCRIPTION }}

⏳ TL;DR
--------

[décrivez brièvement ici comment installer et utiliser votre projet]

📑 Documentation
----------------

La documentation de ce projet est disponible ici : [./docs/{{ REPOSITORY }}.md](./docs/{{ REPOSITORY }}.md)

🎯 Fonctionalités
-----------------

**{{ PROJECT }}** permet d'utiliser ces fonctionalités :

- ⚡ Fonctionalité 1
- ⚡ Fonctionalité 2
- ⚡ Fonctionalité 3
- ⚡ Fonctionalité 4

🚀 Installation
---------------

### ⚡ Étape 1: Entrez simplement la commande suivante dans votre terminal

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

🤖 Commandes
------------

{{ MARKDOWN }}

💻 Dépendances
--------------

**{{ PROJECT }}** repose sur les dépendances suivantes :

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

#### 🐧 Installer bash_unit (Linux)

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

#### 🐧 Installer Composer (Linux)

Sur une machine Linux, installez _composer_ globalement avec les commandes suivantes (nécessite php):

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

#### 🐧 Installer Docker (Linux)

Sur une machine sous Linux, entrez la commande suivante

```bash
$ sudo apt-get install --assume-yes docker.io
```

#### 🔧 Configurer Docker (Linux)

Ajouter l'utilisateur courant au groupe _"Docker"_

```bash
$ sudo usermod -a -G docker ${USER}
```

> Vous devrez vous déconnecter et vous reconnecter à l'utilisateur courant pour utiliser docker

> Si vous n'avez pas été correctement inclu dans le groupe, entrez la commande suivante

```bash
$ newgrp docker
```

#### 🏁 Installer Docker (Windows)

Téléchargez le programme d'installation de _Docker Community Edition_ à partir de _Docker Hub_ :

- [https://hub.docker.com/editions/community/docker-ce-desktop-windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)

#### 🍎 Installer Docker (OSX)

Téléchargez le programme d'installation de _Docker Community Edition_ à partir de _Docker Hub_ :

- [https://hub.docker.com/editions/community/docker-ce-desktop-mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)

---

### 🐳 Docker Compose

#### 🐧 Installer Docker Compose (Linux)

Sur une machine sous Linux, vous aurez besoin de _curl_ pour installer _docker-compose_ avec les commandes suivantes

```bash
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m`" -o /usr/bin/docker-compose
$ sudo chmod uga+x /usr/bin/docker-compose
$ sync
```

---

### 🔖 git

#### 🐧 Installer git (Linux)

```bash
$ sudo apt-get install --assume-yes git
```

#### 🏁 Installer git (Windows)

Téléchargez et installez la dernière version à partir de [git-scm.com](https://git-scm.com/download/win)

#### 🍎 Installer git (OSX)

```bash
$ brew install git
```

#### 🔧 Configuration de git

Pousser la branche actuelle uniquement si l'amont existe

```bash
$ git config --global push.default simple
```

Définir vim comme éditeur par défaut de git

```bash
$ git config --global core.editor 'vim'
```

### ⚡ Initialiser les sous-modules

Afin de télécharger des sous-modules de projet, entrez la commande suivante

```bash
$ git submodule update --init --recursive
```

---

### 🛠 Gawk

#### 🐧 Installer Gawk (Linux)

Sur une machine sous Linux, entrez la commande suivante

```bash
$ sudo apt-get install --assume-yes gawk
```

#### 🏁 Installer Gawk (Windows)

Sur Windows, vous devrez d'abord installer [cygwin](http://www.cygwin.com/) ou [Gawk for Windows](http://gnuwin32.sourceforge.net/packages/gawk.htm) pour exécuter le script.

#### 🍎 Install Gawk (OSX)

Gawk devrait être disponible par défaut sur OSX, mais vous pouvez le mettre à jour avec la commande suivante

```bash
$ brew install gawk
```

---

### 🛠 Make

#### 🐧 Installer Make (Linux)

Sur une machine sous Linux, entrez la commande suivante

```bash
$ sudo apt-get install --assume-yes make
```

#### 🏁 Installer Make (Windows)

Sur Windows, vous devrez d'abord installer [cygwin](http://www.cygwin.com/) ou [GnuWin make](http://gnuwin32.sourceforge.net/packages/make.htm) pour exécuter le script.

#### 🍎 Install Make (OSX)

Make devrait être disponible par défaut sur OSX, mais vous pouvez le mettre à jour avec la commande suivante

```bash
$ brew install make
```

---

### 🦖 Node.js

#### 🐧 Installer Node.js (Linux)

Sur une machine sous Linux, installez _Node_ globalement avec les commandes suivantes (nécessite _curl_):

```bash
$ curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
$ sudo apt-get install --assume-yes nodejs
```

#### 🏁 Installer Node.js (Windows)

Téléchargez et installez la version LTS à partir de [Node.js](https://nodejs.org/en/download)

#### 🍎 Installer Node.js (OSX)

Téléchargez et installez la version LTS à partir de [Node.js](https://nodejs.org/en/download)

---

### 🐘 PHP

#### 🐧 Installer PHP (Linux)

Sur une machine sous Linux, entrez les commandes suivante

```bash
$ sudo add-apt-repository --assume-yes ppa:ondrej/php
$ sudo apt-get update
$ sudo apt-get install --assume-yes php7.2
```

---

### 🐍 Python3

#### 🐧 Installer Python3 (Linux)

Sur une machine sous Linux, entrez la commande suivante

```bash
$ sudo apt-get install --assume-yes python3
```

#### 🏁 Installer Python3 (Windows)

Téléchargez et installez la dernière version à partir de [python.org](https://python.org)

#### 🍎 Installer Python3 (OSX)

Vous pouvez installer _python_ via le gestionnaire de paquets _"Homebrew"_. _"Homebrew"_ installera également _python-pip_.

```bash
$ brew install python
```

---

### 🐍 Python3-pip

#### 🐧 Installer Python3-pip (Linux)

Sur une machine sous Linux, entrez la commande suivante

```bash
$ sudo apt-get install --assume-yes python3-pip
```

---

### 🦄 Sass

#### 🐧 Installer Sass (Linux)

Sur une machine sous Linux, installez _sass_ globalement avec les commandes suivantes

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

#### 🐧 Installer Sed (Linux)

Sur une machine sous Linux, entrez la commande suivante

```bash
$ sudo apt-get install --assume-yes sed
```

#### 🏁 Installer Sed (Windows)

Sur Windows, vous devrez d'abord installer [cygwin](http://www.cygwin.com/) ou [Sed for Windows](http://gnuwin32.sourceforge.net/packages/sed.htm) pour exécuter le script.

#### 🍎 Install Sed (OSX)

Sed devrait être disponible par défaut sur OSX, mais vous pouvez le mettre à jour avec la commande suivante

```bash
$ brew install sed
```

---

### 🧶 Yarn

#### 🐧 Installer Yarn (Linux)

Sur une machine sous Linux, installez _yarn_ globalement avec les commandes suivantes (nécessite _curl_):

```bash
$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
$ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
$ sudo apt-get update
$ sudo apt-get install --assume-yes yarn
```

#### 🏁 Installer Yarn (Windows)

Téléchargez et installez la dernière version à partir de: [yarnpkg.com](https://classic.yarnpkg.com/en/docs/install/#windows-stable)

#### 🍎 Installer Yarn (OSX)

Vous pouvez installer Yarn via le gestionnaire de paquets _"Homebrew"_. Cela installera également Node.js s'il n'est pas déjà installé.

```bash
$ brew install yarn
```

---

### 🕶 Vue-Cli

#### 🧶 Installer avec Yarn

Installez _vue-cli_ globalement avec la commande suivante

```bash
$ sudo yarn global add @vue/cli
```

#### 📦 Installer avec npm

Installez _vue-cli_ globalement avec la commande suivante

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

🗓 À faire
----------

- Tâche 1
- Tâche 2
- Tâche 3
- Tâche 4

🔮 Feuille de route
-------------------

- Release 0.1.0

🤝 Contribuer
-------------

Merci pour votre intérêt à apporter votre contribution à **{{ PROJECT }}**.

Veuillez consulter le [code de conduite](./CODE_OF_CONDUCT.md) et les [directives de contribution](./CONTRIBUTING.md) avant de commencer à travailler sur des fonctionnalités.

Si vous souhaitez ouvrir un rapport de bug, veuillez d'abord vérifier qu'il n'a pas [déjà été signalé](https://{{GIT_SERVER}}/{{GIT_USER}}/{{REPOSITORY}}/issues) avant d'en créer un nouveau.

📜 License
----------

Copyrights (c) {{ YEAR }} &quot;{{ AUTHOR }}&quot; &lt;{{ EMAIL }}&gt;

[![License](https://img.shields.io/badge/Licence-{{ LICENSE }}-green.svg)](LICENSE)
Distribué sous la licence {{ LICENSE }}.

Si vous aimez **{{ PROJECT }}**, mettez une étoile, suivez-moi ou publiez un tweet.

[![GitHub stars](https://img.shields.io/github/stars/{{ GIT_USER }}/{{ REPOSITORY }}?style=social)](https://{{ GIT_SERVER }}/{{ GIT_USER }}/{{ REPOSITORY }}/stargazers)
[![GitHub followers](https://img.shields.io/github/followers/{{ GIT_USER }}?style=social)](https://{{ GIT_SERVER }}/{{ GIT_USER }})
[![Twitter](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2F{{ GIT_SERVER }}%2F{{ GIT_USER }}%2F{{ REPOSITORY }})](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2F{{ GIT_SERVER }}%2F{{ GIT_USER }}%2F{{ REPOSITORY }})

... Et jetez un oeil à mes autres projets.

🙏 Remerciements
----------------

Ce script a été généré avec [makefile-generator](https://github.com/TangoMan75/makefile-generator)
