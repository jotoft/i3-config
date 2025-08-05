# Changelog

All notable changes to this i3 configuration will be documented in this file.

## [2025-08-05]

### Added

#### Notification System
- Created `i3.autostart` file for autostart applications
- Added `systemctl --user start xfce4-notifyd.service` to start the XFCE notification daemon on login

#### Catppuccin Theme System
- Implemented a complete theme switching system with all four Catppuccin variants:
  - Latte (Light theme)
  - Frappé (Light-medium theme)
  - Macchiato (Medium-dark theme)
  - Mocha (Dark theme)
- Created individual theme files in `themes/` directory
- Added `themes/active-theme` symlink to track the currently active theme
- Created two theme switcher scripts:
  - `theme-switcher.sh` - Command-line theme switcher
  - `rofi-theme-switcher.sh` - Rofi-based visual theme switcher with current theme indicator
- Added keybinding `$mod+Shift+t` to launch the rofi theme switcher

#### Visual Enhancements
- Added picom configuration (`~/.config/picom/picom.conf`) with:
  - Rounded corners (10px radius)
  - Window transparency (90% for inactive windows)
  - Blur effects using dual_kawase method
  - Smooth fade animations
- Updated picom launch command to use the configuration file

### Changed

#### Bar Configuration
- Moved i3bar configuration to separate `bar.conf` file to work around i3's variable expansion limitations
- Bar now properly uses theme colors for:
  - Background (with transparency)
  - Workspace indicators
  - Status text
  - Separator lines

### Fixed

#### Variable Expansion Issue
- **Problem**: i3 has a limitation where variables defined in included files cannot be used in certain contexts within the main config file
- **Symptom**: Bar appeared gray with no theme colors applied, showing variable names like `$base` instead of actual color values
- **Solution**: Moved bar configuration to a separate included file (`bar.conf`) that's loaded after the theme variables, creating a new scope where variables can be properly expanded

#### Configuration Order Issue
- **Problem**: Theme was initially included at the end of the config (line 327) while the bar was defined in the middle (line 261)
- **Solution**: Reorganized includes so theme is loaded first, followed by the bar configuration

### Technical Notes

- i3's configuration parser processes includes differently than inline configurations
- Variables from included files exist in a different scope and cannot be directly used in the main config file
- The workaround of using a separate bar configuration file is the recommended approach by the i3 community and the Catppuccin theme maintainers