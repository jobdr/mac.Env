#!/usr/bin/env zsh

setopt NO_BEEP

DISABLE_AUTO_UPDATE="true"

CASE_SENSITIVE="true"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=SAVEHIST="10000"
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt NO_BG_NICE

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export EDITOR="code"

export GPG_TTY=$(tty)

export DESKTOP="$HOME/Desktop"
export DOWNLOADS="$HOME/Downloads"
export PROJECTS="$HOME/Projects"
export SANDBOX="$HOME/Sandbox"
export VROOM="$HOME/Vroom"

for FILE in $VROOM/setup/*
do
  . $FILE
done

. $HOME/.zsh_aliases
. $HOME/.zsh_utils
. $HOME/.zsh_theme
