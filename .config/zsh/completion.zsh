autoload -U compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
zstyle ':completion:*' list-colors ''

