# My dotfiles templates

## Description

This is a collection of configuration file templates. The files are located in a directory 
structure that allows the use of configuration management tools (e.g. [Stow]).

```sh
$ tree -na ./src
./src
├── X
│   ├── .Xresources
│   ├── .Xresources.d
│   │   └── xterm
│   └── .xsession
├── bash
│   ├── .bashrc
│   └── .git-prompt.sh
├── bspwm
│   └── .config
│       └── bspwm
│           └── bspwmrc
├── clog
│   └── .clogrc
├── ctpv
│   └── .config
│       └── ctpv
│           └── config
├── lf
│   └── .config
│       └── lf
│           ├── lfrc
│           └── lfrc.local.example
├── nftables
│   └── etc
│       └── nftables.conf
├── readline
│   └── .inputrc
├── sxhkd
│   └── .config
│       └── sxhkd
│           └── sxhkdrc
├── tmux
│   └── .tmux.conf
└── vim
    └── .vimrc

22 directories, 15 files
```

The files in `src` can be used directly for the initial configuration of the programs. 
`make` is only for sanitize files (removes empty lines and comments).

## Usage

### Clone repo

```sh
$ mkdir ~/src \
&& cd ~/src \
&& git clone https://gitlab.com/tskr/dotfiles \
&& cd dotfiles
```

```sh
$ ls -1A
.git
.gitignore
Makefile
README.md
config.def.mk
src
```

### Build

Linux:
```sh
$ make install
```

BSD:
```sh
$ gmake install
```

```sh
$ ls -1A
.dotfiles
.git
.gitignore
Makefile
README.md
build
config.def.mk
config.mk
src
```

#### Change target directory

The default target directory is set in the `PREFIX` variable (see `config.def.mk`). 
To change it set `PREFIX`, e.g.:

```sh
$ make install PREFIX=~/.dotfiles
```
or create `config.mk`, e.g.:

```sh
$ echo 'PREFIX = ~/.dotfiles' >config.mk
```

### Install

#### Simple

```sh
$ install -m 644 build/bash/.bashrc ~/
```

#### `stow`

## What I use?


## lf

- Readme: https://godoc.org/github.com/gokcehan/lf
- Documentation: https://godoc.org/github.com/gokcehan/lf
- Releases: https://github.com/gokcehan/lf/releases/latest


### Instalation

Example:

```sh
$ wget https://github.com/gokcehan/lf/releases/download/r25/lf-linux-amd64.tar.gz
tar zxf lf-linux-amd64.tar.gz \
&& rm lf-linux-amd64.tar.gz \
&& mkdir -p ~/.local/bin \
&& mv ./lf ~/.local/bin/
```

[Stow]: <https://www.gnu.org/software/stow/>

