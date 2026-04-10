# dotfiles

Personal configuration files. (for MacOS)

## Requirements

```bash
brew install stow neovim ghostty
```

## Setup

```bash
git clone https://github.com/jakkoble/dotfiles ~/dotfiles
cd ~/dotfiles
stow .
```

This symlinks all configurations to their correct locations under `~/.config/`.

