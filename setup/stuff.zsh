#!/usr/bin/env zsh

BREW_LIST="$VROOM/stuff/brew.list"
CASK_LIST="$VROOM/stuff/cask.list"
MAS_LIST="$VROOM/stuff/mas.list"
TAP_LIST="$VROOM/stuff/tap.list"
VSC_LIST="$VROOM/stuff/vsc.list"

function stuff:brew () {
  while read FORMULAE
  do
    if [ "$(brew list -- | grep -E "(^|\s)$FORMULAE($|\s)")" ]
    then
      echo -e "\e[1;32m✓\e[0m \e[1m$FORMULAE:\e[0m \e[37malready done!\e[0m"
    else
      brew install $FORMULAE &> /dev/null
      if [ "$(brew list -- | grep -E "(^|\s)$FORMULAE($|\s)")" ]
      then
        echo -e "\e[1;32m✓\e[0m \e[1m$FORMULAE:\e[0m \e[37minstalled!\e[0m"
      else
        echo -e "\e[1;31m✗\e[0m \e[1m$FORMULAE:\e[0m \e[37mfailed!\e[0m"
      fi
    fi
  done < $BREW_LIST
}

function stuff:cask () {
  while read CASK
  do
    if [ "$(brew cask list -- | grep -E "(^|\s)$CASK($|\s)")" ]
    then
      echo -e "\e[1;32m✓\e[0m \e[1m$CASK:\e[0m \e[37malready done!\e[0m"
    else
      brew cask install $CASK &> /dev/null
      if [ "$(brew cask list -- | grep -E "(^|\s)$CASK($|\s)")" ]
      then
        echo -e "\e[1;32m✓\e[0m \e[1m$CASK:\e[0m \e[37minstalled!\e[0m"
      else
        echo -e "\e[1;31m✗\e[0m \e[1m$CASK:\e[0m \e[37mfailed!\e[0m"
      fi
    fi
  done < $CASK_LIST
}

function stuff:mas () {
  while read APP
  do
    APP_ID=$(echo $APP | awk '{ print $1 }')
    APP_NAME=$(echo $APP | awk '{ print $2 }')
    if [ "$(mas list -- | grep -E "(^|\s)$APP_ID($|\s)")" ]
    then
      echo -e "\e[1;32m✓\e[0m \e[1m$APP_NAME:\e[0m \e[37malready done!\e[0m"
    else
      mas install $APP_ID &> /dev/null
      if [ "$(mas list -- | grep -E "(^|\s)$APP_ID($|\s)")" ]
      then
        echo -e "\e[1;32m✓\e[0m \e[1m$APP_NAME:\e[0m \e[37minstalled!\e[0m"
      else
        echo -e "\e[1;31m✗\e[0m \e[1m$APP_NAME:\e[0m \e[37mfailed!\e[0m"
      fi
    fi
  done < $MAS_LIST
}

function stuff:tap () {
  while read TAP
  do
    if [ "$(brew tap -- | grep -E "(^|\s)$TAP($|\s)")" ]
    then
      echo -e "\e[1;32m✓\e[0m \e[1m$TAP:\e[0m \e[37malready done!\e[0m"
    else
      brew tap $TAP &> /dev/null
      if [ "$(brew tap -- | grep -E "(^|\s)$TAP($|\s)")" ]
      then
        echo -e "\e[1;32m✓\e[0m \e[1m$TAP:\e[0m \e[37mtapped!\e[0m"
      else
        echo -e "\e[1;31m✗\e[0m \e[1m$TAP:\e[0m \e[37mfailed!\e[0m"
      fi
    fi
  done < $TAP_LIST
}

function stuff:vsc () {
  while read EXTENSION
  do
    if [ "$(code --list-extensions -- | grep -E "(^|\s)$EXTENSION($|\s)")" ]
    then
      echo -e "\e[1;32m✓\e[0m \e[1m$EXTENSION:\e[0m \e[37malready done!\e[0m"
    else
      code --install-extension $EXTENSION &> /dev/null
      if [ "$(code --list-extensions -- | grep -E "(^|\s)$EXTENSION($|\s)")" ]
      then
        echo -e "\e[1;32m✓\e[0m \e[1m$EXTENSION:\e[0m \e[37minstalled!\e[0m"
      else
        echo -e "\e[1;31m✗\e[0m \e[1m$EXTENSION:\e[0m \e[37mfailed!\e[0m"
      fi
    fi
  done < $VSC_LIST
}

function stuff:all ()
{
  stuff:tap
  stuff:brew
  stuff:cask
  stuff:mas
  stuff:vsc
}
