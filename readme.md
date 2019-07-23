# 💻 macOS.env

> My own environment for macOS. Apps, dotfiles, scripts, everything.

*__Use at your own risk!__*

## Can I make this mine ?

Yes, sure ! You must even do it, these settings are mine.

### Dotfiles

- [dotfiles/git/*](./dotfiles/git) - Git configuration
- [dotfiles/vsc/*](./dotfiles/vsc) - VS Code settings
- [dotfiles/zsh/*](./dotfiles/zsh) - ZSH configuration

### Stuff

- [stuff/brew.list](./stuff/brew.list) - Homebrew formulaes
- [stuff/cask.list](./stuff/cask.list) - Homebrew casks
- [stuff/mas.list](./stuff/mas.list) - Mas applications
- [stuff/tap.list](./stuff/tap.list) - Homebrew taps
- [stuff/vsc.list](./stuff/vsc.list) - VS Code extensions

### Extras

- [extras/*](./extras) - Everything you want, iTerm2 presets for example.

## For the first run

First of all, log in to the App Store and download Xcode.
<br>
Now, follow these few lines:

```bash
export VROOM="$HOME/Vroom"

# Zsh
chsh -s /bin/zsh $USER

# Xcode
sudo xcodebuild -license
xcode-select --install

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Vroom
git clone https://github.com/jobdr/macos.env.git $VROOM
for FILE in $VROOM/setup/*; do . $FILE; done

# Install stuff
install:all
# or by topic
install:tap
install:brew
install:cask
install:mas
install:vsc

# Link dotfiles
dotfiles:all
# or by topic
dotfiles:git
dotfiles:vsc
dotfiles:zsh

# Directories
mkdir $HOME/{Projects,Sandbox}

. $HOME/.zshrc

# Reload shell
exec $SHELL -l

# SSH key
ssh-keygen -t rsa -b 4096 -C YOUR_EMAIL
cat $HOME/.ssh/YOUR_KEY.pub | pbcopy
# Paste it on GitHub

# GPG key
gpg --default-new-key-algo rsa4096 --gen-key
gpg --list-secret-keys --keyid-format LONG
echo -e "[user]\n  signingkey = GPG_KEY_ID\n" >> $HOME/.git_local
gpg --armor --export GPG_KEY_ID | pbcopy
# Paste it on GitHub
```

After that, configure iTerm2.

- Import presets from [extras](./extras) and set your favorite.
- Set font to `MesloLGL Nerd Font > RegularForPowerLine` at `13pt`.

You need now to configure macOS preferences and your apps.

## From time to time

Here are the commands to perform from time to time on your machine.

```bash
# Homebrew
brew update
brew upgrade
brew cask upgrade
brew doctor
brew cleanup -s
rm -rf "$(brew --cache)"

# Mas
mas upgrade

# Backup your stuff
backup:all
# or by topic
backup:tap
backup:brew
backup:cask
backup:mas
backup:vsc

# Link your new dotfiles
dotfiles:all
# or by topic
dotfiles:git
dotfiles:vsc
dotfiles:zsh

# Zsh
antigen update
antigen cleanup
```

## 🚧 Todolist

- Neovim settings
- Node version manager
- macOS preferences

## 🙌 Contribute

### 🐛 Bug Reports

Something doesn't work as expected ?
<br>
Please open an issue [here](https://github.com/jobdr/macos.env/issues).

### 🤝 Pull Requests

You want to suggest something ?
<br>
[Fork it](https://github.com/jobdr/macos.env/fork), do your stuff and open a PR !

## 📖 License

The project is available as open source under the terms of the [MIT license](./license).

## 🎉 Credits

Inspired by [GitHub ❤ ~/](https://dotfiles.github.io).
