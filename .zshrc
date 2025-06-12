HISTFILE=~/.local/share/zsh/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
plugins=(git)
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh

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
alias gl='git log --pretty=format:"%h %ad   %s" --date=short | grep -Ev "modified:|deleted:|new file:" | less -S'
alias ga="git add"
alias gc="git commit"
alias q="exit"
tmux_source() {
  tmux source-file ~/.home/dotfiles/.config/tmux/tmux.conf
}
tmux_dark() {
  tmux source-file ~/.home/dotfiles/.config/tmux/.tmux-dark.conf
}
tmux_light() {
  tmux source-file ~/.home/dotfiles/.config/tmux/.tmux-light.conf
}

autoload -Uz compinit
zmodload zsh/complist
compinit -d ~/.local/share/zsh/.zcompdump
_comp_options+=(globdots)
# End of lines added by compinstall
PROMPT+='%% '

setopt globdots
