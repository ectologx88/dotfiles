# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Chezmoi-managed dotfiles for a Fedora 43 Hyprland rice with Ghostbusters/LCARS theming. Hardware-agnostic via templating for deployment across multiple machines.

## Common Commands

```bash
chezmoi apply              # Apply changes to home directory
chezmoi diff               # Preview changes before applying
chezmoi add ~/.config/X    # Add new config to chezmoi management
chezmoi edit ~/.zshrc      # Edit managed file (opens dot_zshrc.tmpl)
chezmoi cd                 # cd into chezmoi source directory
```

After editing source files directly, run `chezmoi apply` to deploy changes.

## Templating

Machine-specific values are stored in `.chezmoidata.yaml`:
```yaml
name: "Your Name"
email: "your@email.com"
monitor: "eDP-1"  # Find with 'hyprctl monitors'
```

Files ending in `.tmpl` are Go templates that reference these values (e.g., `{{ .name }}`).

## Directory Structure

| Source Path | Deploys To | Purpose |
|-------------|------------|---------|
| `dot_config/hypr/` | `~/.config/hypr/` | Hyprland compositor (keybinds, animations, window rules) |
| `dot_config/waybar/` | `~/.config/waybar/` | Status bar (LCARS-styled modules, scripts) |
| `dot_config/kitty/` | `~/.config/kitty/` | Terminal emulator |
| `dot_config/nvim/` | `~/.config/nvim/` | Neovim configuration |
| `dot_config/swaync/` | `~/.config/swaync/` | Notification center |
| `dot_zshrc.tmpl` | `~/.zshrc` | Shell config (oh-my-zsh, aliases, prompt) |
| `dot_gitconfig.tmpl` | `~/.gitconfig` | Git user config (uses templated name/email) |

## Key Files

- `.chezmoidata.yaml` - Machine-specific variables (gitignored)
- `.chezmoidata.yaml.example` - Template for new machines
- `.chezmoiignore` - Files chezmoi won't manage
- `run_onchange_install-packages.sh.tmpl` - Auto-runs on change to install Fedora packages

## Hyprland Config Architecture

```
dot_config/hypr/
├── hyprland.conf          # Main entry point (sources other configs)
├── configs/
│   ├── Keybinds.conf      # All keyboard shortcuts
│   ├── WindowRules.conf   # Per-app window behavior
│   ├── Startup_Apps.conf  # Autostart applications
│   └── ENVariables.conf   # Environment variables
├── animations/            # Switchable animation presets
├── scripts/               # Helper scripts (brightness, screenshots, etc.)
└── UserScripts/           # Custom user scripts
```

## Local Overrides (Not Tracked)

- `~/.zshrc.local` - Machine-specific shell config, aliases
- `~/.env` - API keys, secrets, environment variables

These are sourced by `dot_zshrc.tmpl` but excluded from chezmoi via `.chezmoiignore`.

## Theme Colors

Primary accent: `#FF4500` (Ghostbusters Orange-Red)

Edit colors in:
- `dot_zshrc.tmpl` - Shell prompt (`PROMPT` variable)
- `dot_config/waybar/style.css` - Waybar theming
- `dot_config/waybar/recursive-style-tokens.css` - CSS custom properties
