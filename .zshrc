export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

HISTFILE=~/.local/share/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v
bindkey -s ^f "tmux-sessionizer.sh\n"

zstyle :compinstall filename '/data/data/com.termux/files/home/.zshrc'

export PATH="$PATH:$HOME/.local/scripts"
export PATH="$PATH:$HOME/.cargo/bin"
export EDITOR=nvim
export FZF_DEFAULT_OPTS="--margin 10% --color=bw"

alias v="nvim"
alias c="clear"
alias py="python"
alias xfce="startxfce4.sh"
alias gp="git push"
alias gu="git pull"
alias gs="git status"
alias gl="git log --pretty=format:"%H %an %ad" --date=short"
alias ga="git add"
alias gc="git commit"


autoload -Uz compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall
PROMPT+='%% '

setopt globdots
