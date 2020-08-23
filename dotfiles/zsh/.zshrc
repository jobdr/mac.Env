#!/usr/bin/env zsh

clear

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export GPG_TTY=$(tty)

setopt NO_BEEP

DISABLE_AUTO_UPDATE="true"

CASE_SENSITIVE="true"

HISTFILE=$HOME/.zsh_history
HISTSIZE="10000"
SAVEHIST="10000"

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY

export DESKTOP=$HOME/Desktop
export DOWNLOADS=$HOME/Downloads
export PROJECTS=$HOME/Projects
export SANDBOX=$HOME/Sandbox
export SETUP=$HOME/Setup

export EDITOR="code"

eval "`fnm env --multi --use-on-cd`"

. $SETUP/_functions/backup.zsh
. $SETUP/_functions/dotfiles.zsh
. $SETUP/_functions/stuff.zsh

. $HOME/.zsh_plugins
. $HOME/.zsh_aliases
. $HOME/.zsh_utils
