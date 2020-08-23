#!/usr/bin/env zsh

GIT_DOTFILES=$SETUP/dotfiles/git
VSC_DOTFILES=$SETUP/dotfiles/vsc
ZSH_DOTFILES=$SETUP/dotfiles/zsh

function symlink () {
  SRC=$1
  DST=$2
  FILE=$3

  if [[ -L $DST ]] ||  [[ -f $DST ]]
  then
    echo -e "\e[1;36m?\e[0m \e[1m$FILE already exists for $FILE.\e[0m \e[37m[o]verwrite ? any other key to skip.\e[0m"
    read -ks REPLY
    if [[ $REPLY == "o" || $REPLY == "O" ]]
    then
      rm -rf $DST
      ln -s $SRC $DST
      echo -e "\e[1;32m✓\e[0m \e[1mSymlink overwritten for $FILE\e[0m"
    else
      echo -e "\e[1;32m✓\e[0m \e[1mSkipped for $FILE\e[0m"
    fi
  else
    echo -e "\e[1;36m?\e[0m \e[1m$FILE doesn't exists for $FILE.\e[0m \e[37m[c]reate ? any other key to skip.\e[0m"
    read -ks REPLY
    if [[ $REPLY == "c" || $REPLY == "C" ]]
    then
      ln -s $SRC $DST
      echo -e "\e[1;32m✓\e[0m \e[1mSymlink created for $FILE\e[0m"
    else
      echo -e "\e[1;32m✓\e[0m \e[1mSkipped for $FILE\e[0m"
    fi
  fi
}

function dotfiles:git ()
{
  for FILE in $(ls -A1 $GIT_DOTFILES)
  do
    SRC="$GIT_DOTFILES/$FILE"
    DST="$HOME/$FILE"
    symlink $SRC $DST $FILE
  done
}

function dotfiles:vsc ()
{
  for FILE in $(ls -A1 $VSC_DOTFILES)
  do
    SRC=$VSC_DOTFILES/$FILE
    DST=$HOME/Library/Application Support/Code/User/$FILE
    symlink $SRC $DST $FILE
  done
}

function dotfiles:zsh ()
{
  for FILE in $(ls -A1 $ZSH_DOTFILES)
  do
    SRC=$ZSH_DOTFILES/$FILE
    DST=$HOME/$FILE
    symlink $SRC $DST $FILE
  done
}

function dotfiles:all () {
  dotfiles:git
  dotfiles:vsc
  dotfiles:zsh
}
