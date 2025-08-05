#!/bin/bash

# Rofi Catppuccin Theme Switcher for i3

THEME_DIR="$HOME/.config/i3/themes"
ACTIVE_THEME="$THEME_DIR/active-theme"

# Theme options with icons
declare -A themes=(
    ["☀️  Latte (Light)"]="catppuccin-latte"
    ["🍵  Frappé (Light-medium)"]="catppuccin-frappe"
    ["☕  Macchiato (Medium-dark)"]="catppuccin-macchiato"
    ["🌙  Mocha (Dark)"]="catppuccin-mocha"
)

# Get current theme
current_theme=$(readlink "$ACTIVE_THEME" | xargs basename)

# Generate menu options
options=""
for key in "☀️  Latte (Light)" "🍵  Frappé (Light-medium)" "☕  Macchiato (Medium-dark)" "🌙  Mocha (Dark)"; do
    if [[ "${themes[$key]}" == "$current_theme" ]]; then
        options+="$key ✓\n"
    else
        options+="$key\n"
    fi
done

# Show rofi menu
selected=$(echo -e "${options%\\n}" | rofi -config ~/.config/i3/rofi/config.rasi -dmenu -p "Select Theme")

# Remove checkmark if present
selected="${selected% ✓}"

# Switch theme if selection was made
if [[ -n "$selected" && -n "${themes[$selected]}" ]]; then
    # Update i3 theme
    ln -sf "$THEME_DIR/${themes[$selected]}" "$ACTIVE_THEME"
    
    # Update rofi theme
    ROFI_THEME_DIR="$HOME/.config/i3/rofi"
    ln -sf "$ROFI_THEME_DIR/${themes[$selected]}.rasi" "$ROFI_THEME_DIR/active-theme.rasi"
    
    # Reload i3
    i3-msg reload
    
    # Show notification if available
    if command -v notify-send &> /dev/null; then
        notify-send "Theme Switched" "Now using ${selected#* }" -i preferences-desktop-theme
    fi
fi