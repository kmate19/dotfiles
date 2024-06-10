source ~/.zplug/init.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

XDG_CONFIG_HOME=$HOME/.config

alias l='ls -lh --color=auto'
alias ll='ls -lAh --color=auto'
alias ls='ls --color=auto'

[[ ! -f $XDG_CONFIG_HOME/.p10k.zsh ]] || source $XDG_CONFIG_HOME/.p10k.zsh
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/Users/matekiss/.bun/_bun" ] && source "/Users/matekiss/.bun/_bun"

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
zstyle ':completion:*' menu no
bindkey "^[[A" history-search-backward

bindkey "^[[B" history-search-forward

alias cd=z
alias v=nvim
alias g=git
alias c=clear
alias cat=bat
alias rm=trash
alias "yabaidog"="rm -rf /tmp/yabai* & yabai --restart-service"

eval "$(zoxide init zsh)"
# eval "$(fzf)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if ! zplug check --verbose; then
        echo; zplug install
fi

zplug load --verbose
