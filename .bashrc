export PATH="/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/games"
export PATH="$PATH:/usr/local/games"
export PATH="$PATH:$HOME/.scripts"

export MANPAGER="nvim"

alias t="todo.sh"
alias la="ls -al"
alias vim="nvim"
alias vf="fzf --print0 | xargs -0 -o nvim"
alias path="echo $PATH | tr ':' '\n'"
alias bashrc=". $HOME/.bashrc"
alias docf="search-pdfs.sh"
# alias manf="man-fzf.sh"
# alias cht="cheat.sh"

export EDITOR="nvim"
export BROWSER="thorium.exe"
export MANPAGER="nvim +Man!"
export XDG_CONFIG_HOME="$HOME/.config"

. ~/.scripts/git-prompt.sh
PS1='\[\e[0;36m\][\[\e[0;32m\]\u \[\e[0;33m\]\W\[\e[0;36m\]$(__git_ps1 " (%s)")]\[\e[0m\]\$ '

export XDG_RUNTIME_DIR="/tmp/runtime-$USER"
mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"

# For WSL
alias ii="explorer.exe"
export PATH="$PATH:/mnt/c/Windows"
export PATH="$PATH:/mnt/c/Users/JC/Main/files/win32yank"
export PATH="$PATH:/mnt/c/Users/JC/Main/files/thorium/BIN"
export PATH="$PATH:/mnt/c/Users/JC/AppData/Local/SumatraPDF"
export PATH="$PATH:/mnt/c/Program Files/Mozilla Firefox"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

bind '"\C-f": "tmux-sessionizer.sh\n"'
