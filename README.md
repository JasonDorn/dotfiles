# Jason's Dotfiles

Complete development environment setup for macOS. One command to set up any new machine exactly like your current setup.

## 🚀 Quick Setup (New Machine)

### Personal Machine (Full Setup)
```bash
# Clone the repo
git clone git@github.com:JasonDorn/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run the installer - it handles everything!
./install.sh
```

### Work Machine (Dev Tools Only)
```bash
# Clone the repo
git clone git@github.com:JasonDorn/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run with --work flag to exclude personal apps
./install.sh --work
```

The installer automatically:
- ✅ Installs Homebrew (if missing)
- ✅ Installs **all packages from Brewfile** (100+ packages including GUI apps)
- ✅ Installs Oh My Zsh + Powerlevel10k theme with your custom configuration
- ✅ Sets up rbenv, pyenv, nvm, direnv
- ✅ Creates all necessary symlinks for configs
- ✅ Backs up existing configs safely (timestamped)
- ✅ Creates work config template for secrets
- ✅ Installs FZF key bindings
- ✅ Work mode excludes personal apps (music, chat, VPN)

## 📦 What's Included

### Core Development Environment
- **Shell**: Zsh with Oh My Zsh + Powerlevel10k theme (custom config included)
- **Terminal**: Kitty terminal with Kanagawa color scheme
- **Editor**: Neovim with LazyVim (Python/Django optimized)
- **Multiplexer**: Tmux configuration
- **Window Manager**: Hammerspoon (Cmd+` hotkey for Kitty)
- **Git**: Global git configuration
- **Alfred**: Productivity launcher (see [ALFRED.md](ALFRED.md) for sync setup)

### Development Tools (via Brewfile)
- **Languages**: Python, Ruby, Node.js (via pyenv, rbenv, nvm)
- **Databases**: PostgreSQL 12 & 17, Redis, pgcli, pgvector
- **CLI Tools**: ripgrep, fd, fzf, lazygit, bat, eza, tree, zoxide, htop, tmux
- **Build Tools**: cmake, pandoc, gnupg, direnv
- **Package Managers**: pnpm, pipx, uv (fast Python installer)

### GUI Applications (Personal Machine)
- **Browsers**: Chrome, Firefox, Brave
- **Development**: Claude Code
- **Productivity**: Alfred, Obsidian, Slack, 1Password
- **Communication**: Discord, Signal, WhatsApp, Messenger
- **Utilities**: Stats, DaisyDisk, Rectangle, Hammerspoon
- **Media**: VLC, Loom
- **Music Production**: Rekordbox, Mixed In Key, Tidal
- **VPN**: NordVPN, Twingate

### Work Machine (--work flag)
Excludes: Music production tools, personal chat apps (Discord, Signal, WhatsApp, Messenger, 1Password), VPN tools (NordVPN, Twingate), LibreOffice

## 📁 Structure

```
dotfiles/
├── .zshrc                          # Zsh configuration with aliases
├── .zprofile                       # Zsh profile
├── .p10k.zsh                       # Powerlevel10k theme configuration
├── .gitconfig                      # Git global config
├── .tmux.conf                      # Tmux configuration
├── .work_zshrc.zsh.template        # Template for work-specific secrets
├── Brewfile                        # All Homebrew packages (100+)
├── install.sh                      # Automated installer (supports --work flag)
├── README.md                       # This file
├── ALFRED.md                       # Alfred sync setup guide
├── config/
│   ├── kitty/                      # Kitty terminal config
│   ├── hammerspoon/                # Hammerspoon window manager
│   ├── nvim/                       # Neovim LazyVim config
│   ├── nvim-nvchad-backup/         # Old NvChad config (backup)
│   ├── nvim-lazyvim-backup/        # Old LazyVim experiments (backup)
│   └── alfred/                     # Alfred preferences (set via Alfred sync)
├── iterm.json                      # iTerm2 profile (legacy)
└── com.googlecode.iterm2.plist     # iTerm2 preferences
```

## 🛠️ Post-Installation

After running `./install.sh`:

1. **Restart your terminal** or run `source ~/.zshrc`

2. **Open Neovim** (plugins auto-install on first launch):
   ```bash
   nvim
   ```
   Wait for LazyVim to install all plugins automatically.

3. **Install Nerd Font** (for proper terminal icons):
   ```bash
   brew install --cask font-jetbrains-mono-nerd-font
   ```
   Then set Kitty to use "JetBrainsMono Nerd Font" in the Kitty settings.

4. **Set up Alfred** (see [ALFRED.md](ALFRED.md)):
   - Launch Alfred
   - Go to Preferences > Advanced > Set preferences folder
   - Select `~/dotfiles/config/alfred` (if you've already set up sync)
   - Enter your Powerpack license

5. **Enable Hammerspoon**:
   - Launch Hammerspoon
   - Grant accessibility permissions in System Settings > Privacy & Security
   - Test with Cmd+` to toggle Kitty terminal

6. **Configure Git with your personal info**:
   ```bash
   # Update your git user info
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

7. **Set up work-specific configs**:
   ```bash
   # Edit the work config file created from template
   nvim ~/.work_zshrc.zsh
   ```
   Add your work-specific environment variables, API keys, database credentials, etc.

8. **Install language runtimes** (as needed):
   ```bash
   # Ruby
   rbenv install 3.2.0
   rbenv global 3.2.0

   # Python
   pyenv install 3.12.0
   pyenv global 3.12.0

   # Node.js
   nvm install --lts
   nvm use --lts
   ```

9. **Optional**: If p10k theme doesn't look right (only if you want to reconfigure):
   ```bash
   p10k configure
   ```

## 🎨 Neovim Configuration

The Neovim setup uses **LazyVim** with:
- Python/Django support (Pyright LSP, Ruff formatter)
- Git integration (GitSigns, LazyGit, Diffview)
- Modern UI (Tokyo Night theme, which-key, telescope)
- Optimized keymaps and productivity plugins
- Motion enhancements (hop.nvim, flash.nvim)
- Testing support (neotest)

First launch will automatically install all plugins via Lazy.nvim.

## 🔐 Security & Work Configs

**Sensitive data is NOT tracked in git!**

Work-specific configurations (API keys, database credentials, etc.) should be placed in:
```bash
~/.work_zshrc.zsh
```

This file is:
- Created from `.work_zshrc.zsh.template` during installation
- Automatically sourced by `.zshrc`
- Excluded by `.gitignore`
- **NEVER** committed to version control

### Example work config:
```bash
# ~/.work_zshrc.zsh
export CLONE_DB="staging_db"
export CLONE_USER="db_user"
export CLONE_PGPASSWORD="db_password"
export CLONE_HOST="staging.example.com"
export WORK_API_KEY="your_api_key_here"
export AWS_ACCESS_KEY_ID="your_aws_key"
```

## 🔄 Updating Your Dotfiles

When you make changes to your configs, sync them back to the repo:

```bash
cd ~/dotfiles

# Copy updated configs from home
cp ~/.zshrc .
cp ~/.zprofile .
cp ~/.p10k.zsh .
cp ~/.gitconfig .
cp ~/.tmux.conf .

# Update Brewfile with current packages
brew bundle dump --file=Brewfile --force

# Sync config directories
rsync -av --exclude='.git' --exclude='lazy-lock.json' ~/.config/nvim/ config/nvim/
rsync -av ~/.config/kitty/ config/kitty/
rsync -av ~/.hammerspoon/ config/hammerspoon/

# Alfred syncs automatically if you set up the sync folder (see ALFRED.md)

# Commit and push
git add -A
git commit -m "Update configurations"
git push
```

**Pro Tip**: The Brewfile tracks ALL your installed Homebrew packages. When you install new tools via `brew install`, regenerate the Brewfile to keep it in sync.

## 🎯 Key Aliases & Commands

### Git
```bash
g          # git
gst        # git status
gco        # git checkout
gA         # git add -A
gc         # git commit -v
gp         # git push
gpu        # git push -u origin HEAD
```

### Navigation
```bash
v          # nvim
dotfiles   # cd ~/dotfiles
developer  # cd ~/Developer
```

### Python/Django
```bash
pcloneshell   # Django shell with clone DB (uses CLONE_* env vars)
pcloneserver  # Django runserver with clone DB
ruff-staged   # Format staged Python files with Ruff
```

## 📱 Hammerspoon Hotkey

Cmd+` toggles Kitty terminal (like iTerm2's hotkey window)

The Hammerspoon config is automatically linked by the installer.

## 🆘 Troubleshooting

**Zsh theme not showing:**
```bash
p10k configure
```

**Neovim plugins not loading:**
```bash
nvim
:Lazy sync
```

**Command not found after install:**
```bash
source ~/.zshrc
# or restart terminal
```

**NVM not working:**
```bash
# Make sure NVM directory exists
mkdir -p ~/.nvm
source ~/.zshrc
```

## 🎯 Key Features

### Why This Setup Rocks

1. **One Command Setup**: Clone + run install.sh = fully configured machine
2. **Work/Personal Modes**: `--work` flag excludes personal apps automatically
3. **100+ Packages Managed**: Brewfile tracks everything - no manual installs
4. **Alfred Included**: Easy sync setup for all your workflows and shortcuts
5. **Custom P10k Theme**: Your exact terminal theme configuration preserved
6. **Safe Backups**: All existing configs are backed up with timestamps
7. **Version Controlled**: Everything in git except secrets (via .gitignore)
8. **LazyVim Ready**: Neovim plugins auto-install on first launch
9. **Language Managers**: rbenv, pyenv, nvm all configured and ready
10. **Work Secrets Safe**: Template-based approach keeps credentials out of git

### What's New vs Basic Dotfiles

- ✅ **Brewfile**: Manages ALL packages, not just a few core tools
- ✅ **Work Mode**: `--work` flag for locked-down work machines
- ✅ **Alfred Guide**: Complete sync setup documentation
- ✅ **P10k Config**: Your custom theme included (not just generic)
- ✅ **Smarter Installer**: Detects existing configs, offers help flags
- ✅ **GUI Apps**: Browsers, productivity tools, everything installed automatically
- ✅ **No Manual Steps**: Font installation, FZF bindings, all automated

## 📄 License

Personal configuration files - use at your own risk!
