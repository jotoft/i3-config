# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an i3 window manager configuration directory containing:

- `config` - Main i3 configuration file with keybindings, window rules, and appearance settings

## Architecture

The i3 configuration uses a modular approach:

- **Modifier keys**: `$mod` (Mod4/Super) and `$mod2` (Mod5) for different keybinding contexts
- **Modes**: Multiple operational modes including "Size" (resize), "launch" (application launcher), "pull" (move windows to current workspace), and "scratch" (scratchpad management)
- **Workspaces**: Named workspaces with emoji assignments for specific applications (📡 for communication apps, 🛠️ for CLion, 🐍 for PyCharm, ℰ for Emacs/Zim)
- **Gap management**: i3-gaps integration with customizable horizontal/vertical gaps
- **Application-specific rules**: Window behavior defined per application class

## Key Configuration Elements

### Modifier Keys
- `$mod` (Super/Windows key): Primary modifier for window management
- `$mod2` (Mod5): Secondary modifier for application focus and system controls

### Critical Keybindings
- `$mod+Return` or `$mod+t`: Launch terminal (alacritty)
- `$mod+space`: Launch rofi application launcher
- `$mod+r`: Enter resize mode
- `$mod+c`: Enter scratchpad mode
- `$mod+Tab`: Switch between workspaces (back_and_forth)

### Window Management
- Focus: hjkl or arrow keys with `$mod`
- Move: hjkl or arrow keys with `$mod+Shift`
- Layout toggles: `$mod+s` (tabbed/stacking), `$mod+e` (split modes)
- Floating: `$mod+Shift+f` or middle mouse with `$mod`

## Common Tasks

### Testing Configuration Changes
```bash
# Reload i3 configuration
i3-msg reload

# Restart i3 (preserves session)  
i3-msg restart

# Check configuration syntax
i3 -C -c ~/.config/i3/config
```

### Managing Configuration Files
- Primary config: `~/.config/i3/config`
- The config includes `i3.autostart` file for startup applications
- Configuration uses include statements for modular organization

### Display Management
- Screen layout script: `~/.screenlayout/latest.sh` (executed on startup)
- Display switching: `$mod+$mod2+r` runs `~/.screenlayout/offon.sh`
- Workspace 1 assigned to output DP-0

### Application Integration
- Applications are assigned to specific workspaces using their window class
- Floating window rules defined for dialogs and specific applications
- Scratchpad functionality for quick access to hidden windows