# Install
```bash
yes | pkg install neovim tmux fzf ripgrep stow git openssh rust python
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
