# 🚫👻 ECTOLOGIX88 SYSTEM CONFIGURATION 👻🚫

> **LCARS SYSTEM 47656** // **USER:** `ectologx88` // **STATUS:** `ONLINE`

Welcome to the **Ecto-Containment Unit**. This repository houses the configuration files for a Fedora 43 Hyprland setup, heavily influenced by PKE Meters, Proton Packs, and 24th-century Starfleet interfaces.

---

## 🟢 SYSTEM DIAGNOSTICS (SPECS)

| COMPONENT | SPECIFICATION | STATUS |
| :--- | :--- | :--- |
| **CPU** | Intel Core i5-11400H | ⚡ OPERATIONAL |
| **UNIT** | ASUS TUF Gaming | 🛡️ ARMORED |
| **OS** | Fedora 43 | 🐧 STABLE |
| **WM** | Hyprland | 🌀 FLUID |
| **THEME** | Ghostbusters x LCARS | 🟢 ECTOPLASMIC |

---

## 📦 REQUIRED PACKAGES

Before activating the containment grid, ensure your system has the following components installed:

*   **Window Manager:** `hyprland`, `hyprpaper`, `hyprlock`, `hypridle`
*   **Interface:** `waybar`, `rofi-wayland`, `swaync`, `wlogout`
*   **Terminal:** `kitty`, `zsh`, `oh-my-zsh`
*   **Tools:** `chezmoi`, `fastfetch`, `lsd`, `fzf`, `jq`, `wallust`
*   **Aesthetics:** `nwg-look`, `qt5ct`, `qt6ct`

---

## 🔧 PRE-INSTALLATION (CALIBRATION)

Follow these steps to avoid **cross-stream contamination** before running the main deployment:

1.  **Clone the Data Template:**
    ```bash
    cp .chezmoidata.yaml.example .chezmoidata.yaml
    ```
2.  **Calibrate Identity:** Edit `.chezmoidata.yaml` and insert your own `name`, `email`, and `monitor` ID.
3.  **Find Monitor ID:** Run `hyprctl monitors` to identify your primary output (e.g., `eDP-1`, `HDMI-A-1`).

---

## ⚡ DEPLOYMENT PROTOCOL

To initialize this containment unit on a fresh Fedora system, execute the following command sequence. 

```bash
# Install chezmoi to local bin
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin

# Initialize and apply configurations (replace <your-github-username> if forked)
~/.local/bin/chezmoi init --apply <your-github-username>
```

**WARNING:** Do not cross the streams unless absolutely necessary.

---

## 🎨 AESTHETIC SIGNATURE

*   **Prompt:** ECTO-LCARS (Orange-Red `#FF4500` accents)
*   **Wallpaper:** Ghostbusters/LCARS Hybrid
*   **Bar:** Waybar with Ghostbusters-LCARS profile
*   **Terminal:** Kitty with custom LCARS color scheme

---

## 🔐 SECURITY PROTOCOLS

**ATTENTION:** All Class-5 Full Roaming Vapors (Private Keys, API Tokens, SSH Secrets) have been **SCRUBBED** from this repository.

*   **Secret Management:** Sensitive data is replaced with local includes or 1Password templates.
*   **Containment:** The `.chezmoiignore` and `.gitignore` protocols ensure no ectoplasmic leakage of private data to the public grid.

---

## 🚀 TERMINAL DIAGNOSTICS

To view the system status in full LCARS/Ghostbusters ANSI color, run:

```bash
fastfetch -c ~/.config/fastfetch/config-compact.jsonc
```

---

## ⚡ CALIBRATION (FORKING & CUSTOMIZATION)

To ensure your **Proton Pack** is properly calibrated for your specific theater of operations, follow these re-alignment protocols. Avoid **cross-contamination** of identity data by utilizing our decoupling system.

### 🧪 The `.chezmoidata.yaml` Protocol

This containment unit uses a centralized data file to isolate your biological and hardware signatures from the core logic. Before deployment, calibrate your `.chezmoidata.yaml` file in the source root:

```yaml
name: "Egon Spengler"
email: "egon@ghostbusters.com"
monitor: "eDP-1" # Your primary monitor ID
```

### 📡 Hardware Containment Parameters

The Waybar and Hyprland configurations are now **Hardware Agnostic**. They will automatically synchronize with the `monitor` variable defined in your calibration data, ensuring a stable LCARS interface regardless of your specific hardware model.

### 🔐 Classified Ecto-Data (Secrets)

For Class-5 Full Roaming Vapors (Private API Keys, SSH Secrets), utilize the **Local Isolation** protocol. Create a `~/.zshrc.local` file on your host machine:

*   **Automatic Sourcing:** The system will automatically detect and source this file during shell initialization.
*   **Anti-Leakage:** This file is strictly governed by the `.chezmoiignore` protocol, ensuring your secrets never enter the public grid.

---

> *"I collect spores, molds, and fungus."* - Egon Spengler
