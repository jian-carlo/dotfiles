# source aliases and variables files
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs select # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

setopt append_history inc_append_history share_history # better history
setopt auto_menu menu_complete # autcmp first menu match
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
setopt prompt_subst
# unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

# fzf setup
source <(fzf --zsh)

# binds
bindkey -v
bindkey "^N" history-search-forward
bindkey "^P" history-search-backward
bindkey "^R" fzf-history-widget
bindkey -s "^f" "tmux-sessionizer.sh\n"

# prompt with git info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:git:*' formats 'git:(%b)%u%c '
zstyle ':vcs_info:git:*' actionformats 'git:(%b)%u%c '
precmd() { vcs_info }
setopt prompt_subst
PROMPT='%F{blue}jian%f %F{cyan}%~%f %F{yellow}${vcs_info_msg_0_}%f%f%# '


source ~/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
