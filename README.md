# dotfiles

My `dotfiles` are intended to support installation on both macOS and Linux (and WSL).

## macOS

Update macOS and Install Xcode Command-Line Tools

```shell
sudo softwareupdate -i -a
xcode-select --install
```

## Ubuntu Linux (including WSL)

Update Ubuntu and Install necessary tools

```shell
sudo apt update && sudo apt upgrade
sudo apt install build-essential gnupg
```

Install [homebrew](https://brew.sh)

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install [chezmoi](https://www.chezmoi.io).

```shell
brew install chezmoi
```

Init chezmoi

```shell
chezmoi --source ~/Projects/rkage/dotfiles init git@github.com:rkage/dotfiles.git
```
