# 💻 macOS.setup

> My own environment for macOS. Use at your own risk!

## First run

Download on the `App Store` and get your apps.

```bash
export SETUP="$HOME/Setup"

# Ask for admin password
sudo -v

# Name your Mac
scutil --set ComputerName "xxx"
scutil --set HostName "xxx"
scutil --set LocalHostName "xxx"
defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "xxx"

# ZSH as default shell
chsh -s /bin/zsh $USER

# CLT for Xcode
xcode-select --install
sudo xcodebuild -license

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Setup
git clone https://github.com/jobdr/macos.setup.git $SETUP
for FILE in $SETUP/_functions/*; do source $FILE; done

# Stuff
stuff:tap
stuff:brew
stuff:cask
stuff:mas
stuff:vsc
# or
stuff:all
# I suggest you check each step went correctly.

# Dotfiles
dotfiles:git
dotfiles:vsc
dotfiles:zsh
# or
dotfiles:all
# I suggest you check each step went correctly.

# ZSH configuration
. $HOME/.zshrc

# Shell reload
exec $SHELL -l

# SSH key
ssh-keygen -t rsa -b 4096 -C YOUR_EMAIL
cat $HOME/.ssh/YOUR_KEY.pub | pbcopy
# Paste it on GitHub

# GPG key
gpg --default-new-key-algo rsa4096 --gen-key
gpg --list-secret-keys --keyid-format LONG
echo -e "[user]\n  signingkey = GPG_KEY_ID\n" >> $HOME/.git_perso
gpg --armor --export GPG_KEY_ID | pbcopy
# Paste it on GitHub
```

## Sometimes

```bash
# Homebrew
brew update
brew upgrade
brew cask upgrade # (--greedy if you want to force updates)
brew doctor
brew cleanup -s
rm -rf "$(brew --cache)"

# Mas
mas upgrade

# Backup
backup:all

# Dotfiles
dotfiles:all

# Antigen
antigen update
antigen cleanup
```

## 🙌 Contribute

### 🐛 Bug Reports

Something doesn't work as expected ?
<br>
Please open an issue [here](https://github.com/jobdr/macos.setup/issues).

### 🤝 Pull Requests

You want to suggest something ?
<br>
[Fork it](https://github.com/jobdr/macos.setup/fork), do your stuff and open a PR !

## 📖 License

The project is available as open source under the terms of the [MIT license](./license).

## 🎉 Credits

Inspired by [GitHub ❤ ~/](https://dotfiles.github.io).
