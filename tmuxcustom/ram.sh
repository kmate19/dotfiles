show_ram() { # This function name must match the module name!
  local index icon color text module

  index=$1 # This variable is used internally by the module loader in order to know the position of this module

  icon="$(  get_tmux_option "@catppuccin_ram_icon"  "ram"           )"
  color="$( get_tmux_option "@catppuccin_ram_color" "$thm_orange" )"
  text="$(  get_tmux_option "@catppuccin_ram_text"  "#(~/dotfiles/.scripts/tmux/get_ram.sh)" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
