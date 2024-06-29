if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Start Hyprland
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec /usr/bin/Hyprland
fi
