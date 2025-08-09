# Initialize path

```bash
# ~/.zshenv
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export ZDOTDIR=${ZDOTDIR:=${XDG_CONFIG_HOME}/zsh}
source $ZDOTDIR/.zshrc
```

# Stow

```bash
mkdir $HOME/.config
stow --target="$HOME/.config"
```

# Used Tools

- [neovim](https://github.com/neovim/neovim)
- [tmux](https://github.com/tmux/tmux)
- [zsh](https://www.zsh.org/)
