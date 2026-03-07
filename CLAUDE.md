# Dotfiles — Chezmoi

Fedora 43 Hyprland rice with Ghostbusters/LCARS theming. Hardware-agnostic via Go
templating for deployment across multiple machines.

## Commands

```bash
chezmoi apply              # Apply changes to home directory
chezmoi diff               # Preview changes before applying
chezmoi add ~/.config/X    # Add new config to chezmoi management
chezmoi edit ~/.zshrc      # Edit managed file (opens dot_zshrc.tmpl)
chezmoi cd                 # cd into chezmoi source directory
```

After editing source files directly, run `chezmoi apply` to deploy.

## Templating

Machine-specific values live in `.chezmoidata.yaml` (gitignored):
```yaml
name: "Your Name"
email: "your@email.com"
monitor: "eDP-1"  # Find with 'hyprctl monitors'
```

Files ending in `.tmpl` are Go templates referencing these values (`{{ .name }}`).

## Directory Structure

| Source Path | Deploys To | Purpose |
|-------------|------------|---------|
| `dot_config/hypr/` | `~/.config/hypr/` | Hyprland compositor |
| `dot_config/waybar/` | `~/.config/waybar/` | Status bar (LCARS-styled) |
| `dot_config/kitty/` | `~/.config/kitty/` | Terminal emulator |
| `dot_config/nvim/` | `~/.config/nvim/` | Neovim |
| `dot_config/swaync/` | `~/.config/swaync/` | Notification center |
| `dot_zshrc.tmpl` | `~/.zshrc` | Shell config (oh-my-zsh, aliases, prompt) |
| `dot_gitconfig.tmpl` | `~/.gitconfig` | Git user config |

## Hyprland Config Architecture

```
dot_config/hypr/
├── hyprland.conf          # Main entry point (sources all others)
├── configs/
│   ├── Keybinds.conf      # All keyboard shortcuts
│   ├── WindowRules.conf   # Per-app window behavior
│   ├── Startup_Apps.conf  # Autostart applications
│   └── ENVariables.conf   # Environment variables
├── Monitor_Profiles/      # Switchable monitor layout presets
├── animations/            # Switchable animation presets
├── scripts/               # Helper scripts (brightness, screenshots, etc.)
└── UserScripts/           # Custom user scripts
```

## Dynamic Theming (Wallust)

`wallust` generates color palettes from wallpapers and writes them to:
- `dot_config/hypr/wallust/` — Hyprland color overrides
- `dot_config/waybar/wallust/` — Waybar color overrides

When changing wallpapers, run wallust to regenerate and then `chezmoi apply`.

## Package Installation

`run_onchange_install-packages.sh.tmpl` auto-runs when its content changes. Installs
DNF packages (Hyprland, Waybar, Kitty, Neovim, fonts, CLI tools) and the Neovim npm
provider. Edit this file to add new system dependencies.

## Local Overrides (Not Tracked)

- `~/.zshrc.local` — Machine-specific shell config and aliases
- `~/.env` — API keys and secrets

Both are sourced by `dot_zshrc.tmpl` but excluded via `.chezmoiignore`.

## Theme

Primary accent: `#ff6600`

Edit colors in:
- `dot_config/waybar/style.css` — Waybar theming
- `dot_config/waybar/recursive-style-tokens.css` — CSS custom properties
