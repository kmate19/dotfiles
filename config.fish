if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -n "$SSH_CONNECTION"
        set -Ux EDITOR vim
    else
        set -Ux EDITOR nvim
    end

    set -U XDG_CONFIG_HOME $HOME/.config/
    set -U BUN_INSTALL "$HOME/.bun"

    set -gx PATH "$HOME/neovim/bin:$PATH"
    set -gx PATH "/home/linuxbrew/.linuxbrew/bin:$PATH"
    set -gx PATH "/opt/homebrew/bin:$PATH"
    set -gx PATH "$BUN_INSTALL/bin:$PATH"
    set -gx PATH "~/.cargo/bin:$PATH"

    set -U fish_history_max 1000
    set -U fish_color_ls $LS_COLORS
    set -U fish_cursor_default block
    set -U repeat_delay = 170 # delay in ms
    set -U repeat_rate = 45 # repeat_rate in repeats per second

    alias cd=z
    alias g=git
    alias cat=bat
    alias c=code
    alias pn=pnpm
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
