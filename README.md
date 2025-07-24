# Dependencies

```bash
yes | sudo pacman -S neovim tmux ripgrep fzf npm gcc clang bat fd stow openssh
stow .
```

When using neovim, just do `:checkhealth` to see the dependencies.

For todo.sh, just create the `~/todo` directory and create different
txt files. Make sure to modify the functions and/or scripts new categories
inside `~/.config/nvim/snippets/text.lua` and inside `~/.scripts/todo.sh`.

# TODO
- [ ] Make todo.sh more readable.
