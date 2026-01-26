# 🚫👻 ECTOLOGIX88 HYPRLAND RICE 👻🚫

> **LCARS SYSTEM 47656** // **STATUS:** `OPERATIONAL`

A Fedora 43 Hyprland configuration merging Ghostbusters aesthetics with Star Trek LCARS interfaces. Features hardware-agnostic setup using chezmoi for easy deployment across systems.

---

![desktop](image.png)

![app launcher](image.png)

![control center](image.png)

*Ghostbusters/LCARS themed Hyprland setup with custom Waybar, rofi, and kitty configurations*

---

## ⚡ QUICK START

```bash
# Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin

# Deploy (replace with your fork if customized)
~/.local/bin/chezmoi init --apply ectologx88
```

**First time?** See the [Setup Guide](#-setup-guide) below.

---

## 🎨 FEATURES

- **🌀 Hyprland:** Smooth Wayland compositor with custom animations
- **📊 Waybar:** LCARS-styled status bar with Ghostbusters color scheme
- **🎯 Rofi:** Custom launcher matching the theme
- **💻 Kitty:** Terminal with LCARS color palette
- **🔧 Hardware Agnostic:** One config, multiple machines via templating
- **🔐 Secret Management:** Safe credential handling with local overrides

---

## 📦 DEPENDENCIES

```bash
# Core (Wayland/Hyprland)
sudo dnf install hyprland hyprpaper hyprlock hypridle

# Interface
sudo dnf install waybar rofi-wayland swaync wlogout

# Terminal & Shell
sudo dnf install kitty zsh

# Tools
sudo dnf install fastfetch lsd fzf jq

# Theming
sudo dnf install nwg-look qt5ct qt6ct
```

**Post-install:**
- [oh-my-zsh](https://ohmyz.sh/)
- [chezmoi](https://www.chezmoi.io/)

---

## 🔧 SETUP GUIDE

### 1. Configure Your System

Copy the example data file and customize it:

```bash
cd ~/.local/share/chezmoi
cp .chezmoidata.yaml.example .chezmoidata.yaml
nano .chezmoidata.yaml
```

**Required values:**
```yaml
name: "Your Name"
email: "your@email.com"
monitor: "eDP-1"  # Run 'hyprctl monitors' to find yours
```

### 2. Apply Configuration

```bash
chezmoi apply
```

### 3. Optional: Local Overrides

For machine-specific settings or secrets:

```bash
# Shell customizations
nano ~/.zshrc.local

# Environment variables & API keys
nano ~/.env
```

These files are ignored by chezmoi and won't sync across systems.

---

## 🎨 CUSTOMIZATION

### Color Scheme

Main accent: `#FF4500` (Ghostbusters Orange-Red)

Edit in:
- `dot_zshrc.tmpl` - Shell prompt colors
- `dot_config/waybar/style/` - Waybar themes
- `dot_config/kitty/` - Terminal colors

### Monitor Configuration

Hyprland and Waybar automatically use the `monitor` value from `.chezmoidata.yaml`. No hardcoded display names!

---

## 🗂️ STRUCTURE

```
~/.config/
├── hypr/          # Hyprland compositor config
├── waybar/        # Status bar themes & configs
├── kitty/         # Terminal emulator
├── rofi/          # Application launcher
├── swaync/        # Notification center
└── fastfetch/     # System info display
```

---

## 🔬 TODO

### 🟡 Medium Priority
- [ ] Add screenshots/demo video
- [ ] Create `install.sh` for dependencies
- [ ] Write `CONTRIBUTING.md`

### 🟢 Low Priority
- [ ] CI/CD for config validation
- [ ] Interactive setup wizard
- [ ] GitHub Actions badges

---

## 🤝 FORKING

1. Fork this repo
2. Update `.chezmoidata.yaml` with your info (gitignored)
3. Customize colors/configs to taste
4. Deploy: `chezmoi init --apply YOUR_USERNAME`

**Tip:** Keep personal data in `.chezmoidata.yaml` and `~/.zshrc.local` - these never get committed.

---

## 📝 CREDITS

- Hyprland config inspired by [JaKooLit's dots](https://github.com/JaKooLit)
- LCARS design: Star Trek TNG interfaces
- Theme: Ghostbusters (1984)

---

## 📄 LICENSE

MIT - Use it, modify it, share it.

---

> *"Back off, man. I'm a scientist."* - Dr. Peter Venkman
