if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -n "$SSH_CONNECTION"
        set -Ux EDITOR vim
    else
        set -Ux EDITOR nvim
    end

    set -Ux XDG_CONFIG_HOME $HOME/.config/
    set -U fish_history_max 1000
    set -U fish_color_ls $LS_COLORS

    alias cd=z
    alias g=git
    alias cat=bat
    alias c=code
    alias l="eza -lah --icons"
    alias ls="eza --icons"
    alias nvim_invalidate="rm -rf $HOME/.local/share/nvim && rm -rf $HOME/.local/state/nvim/lazy"
    alias yabaidog="rm -rf /tmp/yabai* & yabai --restart-service"
    alias v=nvim
    alias vimconf="nvim ~/.config/nvim/"

    # Zoxide initialization
    zoxide init fish | source

    # Starship prompt initialization
    starship init fish | source
end
