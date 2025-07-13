# Install
```bash
yes | pacman -S neovim tmux fzf ripgrep stow git openssh rust python3 ipython sudo pandoc zsh make zsh-syntax-highlighting
```
# Stow
```bash
mkdir $HOME/.config
# cd to this repo
stow --target="$HOME/.config" .
```
# Initialize path
```bash
# ~/.zshenv
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export ZDOTDIR=${ZDOTDIR:=${XDG_CONFIG_HOME}/zsh}
source $ZDOTDIR/.zshrc
```
