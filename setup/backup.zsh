#!/usr/bin/env zsh

BREW_LIST="$VROOM/stuff/brew.list"
CASK_LIST="$VROOM/stuff/cask.list"
CODE_LIST="$VROOM/stuff/code.list"
MAS_LIST="$VROOM/stuff/mas.list"
TAP_LIST="$VROOM/stuff/tap.list"

function backup:brew ()
{
  : > $BREW_LIST
  brew cask list >> $BREW_LIST
  echo -e "\e[1;32m✓\e[0m \e[1mHomebrew formulaes:\e[0m \e[37msaved in brew.list\e[0m"
}

function backup:cask ()
{
  : > $CASK_LIST
  brew cask list >> $CASK_LIST
  echo -e "\e[1;32m✓\e[0m \e[1mHomebrew casks:\e[0m \e[37msaved in cask.list\e[0m"
}

function backup:code ()
{
  : > $CODE_LIST
  code --list-extensions >> $CODE_LIST
  echo -e "\e[1;32m✓\e[0m \e[1mVS Code extensions:\e[0m \e[37msaved in code.list\e[0m"
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

function backup:all ()
{
  backup:brew
  backup:cask
  backup:code
  backup:mas
  backup:tap
}
