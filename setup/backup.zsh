#!/usr/bin/env zsh

BREW_LIST="$VROOM/stuff/brew.list"
CASK_LIST="$VROOM/stuff/cask.list"
MAS_LIST="$VROOM/stuff/mas.list"
TAP_LIST="$VROOM/stuff/tap.list"
VSC_LIST="$VROOM/stuff/vsc.list"

function backup:brew ()
{
  : > $BREW_LIST
  brew list >> $BREW_LIST
  echo -e "\e[1;32m✓\e[0m \e[1mHomebrew formulaes:\e[0m \e[37msaved in brew.list\e[0m"
}

function backup:cask ()
{
  : > $CASK_LIST
  brew cask list >> $CASK_LIST
  echo -e "\e[1;32m✓\e[0m \e[1mHomebrew casks:\e[0m \e[37msaved in cask.list\e[0m"
}

function backup:mas ()
{
  : > $MAS_LIST
  mas list >> $MAS_LIST
  echo -e "\e[1;32m✓\e[0m \e[1mMas applications:\e[0m \e[37msaved in mas.list\e[0m"
}

function backup:tap ()
{
  : > $TAP_LIST
  brew tap > $TAP_LIST
  echo -e "\e[1;32m✓\e[0m \e[1mHomebrew taps:\e[0m \e[37msaved in tap.list\e[0m"
}

function backup:vsc ()
{
  : > $VSC_LIST
  code --list-extensions >> $VSC_LIST
  echo -e "\e[1;32m✓\e[0m \e[1mVS VSC extensions:\e[0m \e[37msaved in vsc.list\e[0m"
}

function backup:all ()
{
  backup:tap
  backup:brew
  backup:cask
  backup:mas
  backup:vsc
}
