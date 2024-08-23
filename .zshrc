source ~/.zplug/init.zsh

autoload -U compinit; compinit

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

XDG_CONFIG_HOME=$HOME/.config

[[ ! -f $XDG_CONFIG_HOME/.p10k.zsh ]] || source $XDG_CONFIG_HOME/.p10k.zsh
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/Users/matekiss/.bun/_bun" ] && source "/Users/matekiss/.bun/_bun"

# api keys
export GROQ_API_KEY_1=$(<$HOME/.apikeys/groq_api.api)

# brew
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

zplug zsh-users/zsh-syntax-highlighting, defer:2
zplug zsh-users/zsh-autosuggestions
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug "zsh-users/zsh-history-substring-search"
# source ~/powerlevel10k/powerlevel10k.zsh-theme

HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=1000
HISTDUP=erase
setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_verify
setopt autocd

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' verbose yes 
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' file-list all
zstyle ':completion:*' file-sort date
zstyle ':completion:*' menu select 

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "§" autosuggest-accept

alias cd=z
alias v=nvim
alias g=git
alias c=clear
alias cat=bat
alias rm=trash
alias "yabaidog"="rm -rf /tmp/yabai* & yabai --restart-service"
alias l='ls -lht --color=auto'
alias ll='ls -lAht --color=auto'
alias ls='ls -t --color=auto'

eval "$(zoxide init zsh)"
source <(fzf --zsh)

if ! zplug check --verbose; then
        echo; zplug install
fi

zplug load 

# To customize prompt, run `p10k configure` or edit ~/dotfiles/.p10k.zsh.
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh
