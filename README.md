# Jason's Dotfiles

Complete development environment setup for macOS. One command to set up any new machine exactly like your current setup.

## 🚀 Quick Setup (New Machine)

```bash
# Clone the repo
git clone git@github.com:JasonDorn/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run the installer - it handles everything!
./install.sh
```

The installer automatically:
- ✅ Installs Homebrew (if missing)
- ✅ Installs Oh My Zsh + Powerlevel10k theme
- ✅ Installs all essential CLI tools (ripgrep, fzf, lazygit, neovim, etc.)
- ✅ Sets up rbenv, pyenv, nvm, direnv
- ✅ Creates all necessary symlinks
- ✅ Backs up existing configs safely
- ✅ Creates work config template

## 📦 What's Included

- **Shell**: Zsh with Oh My Zsh + Powerlevel10k theme
- **Terminal**: Kitty terminal with Tokyo Night theme
- **Editor**: Neovim with LazyVim (Python/Django optimized)
- **Multiplexer**: Tmux configuration
- **Window Manager**: Hammerspoon (Cmd+` hotkey for Kitty)
- **Git**: Global git configuration
- **Tools**: ripgrep, fzf, lazygit, bat, eza, fd, zoxide

## 📁 Structure

```
dotfiles/
├── .zshrc                          # Zsh configuration with aliases
├── .zprofile                       # Zsh profile
├── .gitconfig                      # Git global config
├── .tmux.conf                      # Tmux configuration
├── .work_zshrc.zsh.template        # Template for work-specific secrets
├── install.sh                      # Automated installer
├── config/
│   ├── kitty/                      # Kitty terminal config
│   ├── hammerspoon/                # Hammerspoon window manager
│   ├── nvim/                       # Neovim LazyVim config
│   ├── nvim-nvchad-backup/         # Old NvChad config (backup)
│   └── nvim-lazyvim-backup/        # Old LazyVim experiments (backup)
├── iterm.json                      # iTerm2 profile (legacy)
└── README.md                       # This file
```

## 🛠️ Post-Installation

After running `./install.sh`, do the following:

1. **Restart your terminal** or run `source ~/.zshrc`

2. **Configure Powerlevel10k** (first time only):
   ```bash
   p10k configure
   ```

3. **Open Neovim** (plugins auto-install on first launch):
   ```bash
   nvim
   ```

4. **Install GUI apps** (optional):
   ```bash
   # Kitty terminal
   brew install --cask kitty

   # Hammerspoon window manager
   brew install --cask hammerspoon

   # Font for terminal
   brew install --cask font-jetbrains-mono-nerd-font
   ```

5. **Set up work-specific configs**:
   ```bash
   # Edit the work config file created from template
   nvim ~/.work_zshrc.zsh
   ```
   Add your work-specific environment variables, API keys, database credentials, etc.

6. **Install language runtimes** (as needed):
   ```bash
   # Ruby
   rbenv install 3.2.0
   rbenv global 3.2.0

   # Python
   pyenv install 3.11.0
   pyenv global 3.11.0

   # Node.js
   nvm install --lts
   nvm use --lts
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
export WORK_DB="production_db"
export WORK_API_KEY="secret_key_here"
export AWS_ACCESS_KEY_ID="your_key"
```

## 🔄 Updating Your Dotfiles

When you make changes to your configs, sync them back to the repo:

```bash
cd ~/dotfiles

# Copy updated configs from home
cp ~/.zshrc .
cp ~/.zprofile .
cp ~/.p10k.zsh .  # if you customized it
cp ~/.config/kitty/kitty.conf config/kitty/

# Sync Neovim config (excluding git metadata)
rsync -av --exclude='.git' --exclude='lazy-lock.json' ~/.config/nvim/ config/nvim/

# Commit and push
git add -A
git commit -m "Update configurations"
git push
```

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
pcloneshell   # Django shell with production DB clone
pcloneserver  # Django runserver with production DB clone
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

## 📄 License

Personal configuration files - use at your own risk!
