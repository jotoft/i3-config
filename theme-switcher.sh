#!/bin/bash

# i3 Catppuccin Theme Switcher

THEME_DIR="$HOME/.config/i3/themes"
ACTIVE_THEME="$THEME_DIR/active-theme"

# Function to list available themes
list_themes() {
    echo "Available Catppuccin themes:"
    echo "1) Latte (Light)"
    echo "2) Frappé (Light-medium)" 
    echo "3) Macchiato (Medium-dark)"
    echo "4) Mocha (Dark)"
}

# Function to switch theme
switch_theme() {
    case $1 in
        1|latte)
            ln -sf "$THEME_DIR/catppuccin-latte" "$ACTIVE_THEME"
            echo "Switched to Catppuccin Latte"
            ;;
        2|frappe)
            ln -sf "$THEME_DIR/catppuccin-frappe" "$ACTIVE_THEME"
            echo "Switched to Catppuccin Frappé"
            ;;
        3|macchiato)
            ln -sf "$THEME_DIR/catppuccin-macchiato" "$ACTIVE_THEME"
            echo "Switched to Catppuccin Macchiato"
            ;;
        4|mocha)
            ln -sf "$THEME_DIR/catppuccin-mocha" "$ACTIVE_THEME"
            echo "Switched to Catppuccin Mocha"
            ;;
        *)
            echo "Invalid theme selection"
            exit 1
            ;;
    esac
}

# Main script
if [ $# -eq 0 ]; then
    list_themes
    echo ""
    read -p "Select theme (1-4): " choice
    switch_theme $choice
else
    switch_theme $1
fi

# Reload i3 to apply the new theme
i3-msg reload
echo "Theme applied. i3 has been reloaded."