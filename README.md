# Jason's Dotfiles

Personal development environment configuration files.

## Contents

- **Shell**: Zsh configuration (.zshrc, .zprofile)
- **Terminal**: Kitty terminal config, iTerm2 settings
- **Editor**: Neovim with NvChad and LazyVim configurations
- **Multiplexer**: Tmux configuration
- **Git**: Global git configuration

## Setup

### Quick Setup (New Machine)

```bash
git clone git@github.com:JasonDorn/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

### Manual Setup

1. Clone this repository:
   ```bash
   git clone git@github.com:JasonDorn/dotfiles.git ~/dotfiles
   ```

2. Create symlinks:
   ```bash
   ln -sf ~/dotfiles/.zshrc ~/.zshrc
   ln -sf ~/dotfiles/.zprofile ~/.zprofile
   ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
   ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
   ln -sf ~/dotfiles/config/kitty ~/.config/kitty
   ```

3. Choose Neovim config:
   ```bash
   # For NvChad
   ln -sf ~/dotfiles/config/nvim ~/.config/nvim
   
   # For LazyVim
   ln -sf ~/dotfiles/config/nvim-lazyvim ~/.config/nvim
   ```

## Neovim Configurations

This repo includes two Neovim configurations:

### NvChad (config/nvim)
Current active configuration with custom plugins and settings.

### LazyVim (config/nvim-lazyvim)
Alternative configuration for testing.

### Switching Between Configs

```bash
# Use NvChad
NVIM_APPNAME=nvim nvim

# Use LazyVim
NVIM_APPNAME=nvim-lazyvim nvim

# Or create aliases in .zshrc:
alias nvim-chad="NVIM_APPNAME=nvim nvim"
alias nvim-lazy="NVIM_APPNAME=nvim-lazyvim nvim"
```

## iTerm2 Configuration

Import the iTerm2 profile:
1. Open iTerm2
2. Go to Preferences > Profiles
3. Click "Other Actions" > "Import JSON Profiles"
4. Select `iterm.json` or import `com.googlecode.iterm2.plist`

## Required Tools

- [Neovim](https://neovim.io/) >= 0.9.0
- [Kitty](https://sw.kovidgoyal.net/kitty/) terminal
- [Homebrew](https://brew.sh/) (macOS)
- Zsh shell

### Essential CLI Tools

```bash
brew install \
  ripgrep \
  fd \
  fzf \
  lazygit \
  tree \
  bat \
  eza \
  zoxide \
  starship
```

## Structure

```
dotfiles/
├── .zshrc              # Zsh configuration
├── .zprofile           # Zsh profile
├── .gitconfig          # Git global config
├── .tmux.conf          # Tmux configuration
├── config/
│   ├── kitty/          # Kitty terminal config
│   ├── nvim/           # NvChad configuration
│   └── nvim-lazyvim/   # LazyVim configuration
├── custom/             # Legacy NvChad custom configs
├── iterm.json          # iTerm2 JSON profile
└── com.googlecode.iterm2.plist  # iTerm2 plist
```

## Maintenance

### Updating Dotfiles

```bash
cd ~/dotfiles
# Copy latest configs
cp ~/.zshrc .
cp ~/.zprofile .
cp ~/.config/kitty/kitty.conf config/kitty/
rsync -av --exclude='.git' ~/.config/nvim/ config/nvim/
rsync -av --exclude='.git' ~/.config/nvim-lazyvim/ config/nvim-lazyvim/

# Commit and push
git add -A
git commit -m "Update configurations"
git push
```

## License

Personal configuration files - use at your own risk!

## Security Notes

### Sensitive Information

This repository is safe to share publicly. Sensitive information like API keys, passwords, and work-specific configurations are kept in separate files that are NOT tracked in git:

- `~/.work_zshrc.zsh` - Work-specific environment variables and credentials
- The `.gitignore` is configured to exclude all work-related, credential, and secret files

### Work Configuration

The `.zshrc` sources `~/.work_zshrc.zsh` which should contain:
```bash
# Work-specific environment variables
export PEQUITY_CLONE_DB="..."
export PEQUITY_CLONE_USER="..."
export PEQUITY_CLONE_PGPASSWORD="..."
export PEQUITY_CLONE_HOST="..."
# Add other work-specific configs here
```

**NEVER** commit the `~/.work_zshrc.zsh` file to version control!

## Fresh Setup

### Neovim Configurations Available

1. **nvim** (NvChad) - Original configuration with NvChad v2.5
2. **nvim-lazyvim** - Previous LazyVim experiments
3. **nvim-fresh** - **NEW!** Clean, optimized LazyVim setup

### Using the Fresh LazyVim Config

```bash
ln -sf ~/dotfiles/config/nvim-fresh ~/.config/nvim
nvim
```

The fresh config includes:
- Python/Django support (Pyright, Ruff)
- Git integration (GitSigns, LazyGit)
- Modern UI (Tokyo Night theme)
- Optimized keymaps for development
- Telescope file finder
- Neo-tree file explorer

### Switching Between Configs

```bash
# Use fresh LazyVim
ln -sf ~/dotfiles/config/nvim-fresh ~/.config/nvim

# Use original NvChad
ln -sf ~/dotfiles/config/nvim ~/.config/nvim

# Use old LazyVim experiments
ln -sf ~/dotfiles/config/nvim-lazyvim ~/.config/nvim
```

### Kitty Terminal Setup

The Kitty config includes:
- Tokyo Night color scheme matching Neovim
- JetBrains Mono font
- Optimized performance settings
- macOS-friendly keybindings
- Background opacity for modern look

#### Setting up Cmd+` Hotkey for Kitty

**Option 1: macOS Keyboard Shortcuts (Easiest)**
1. Open **System Settings → Keyboard → Keyboard Shortcuts**
2. Click **App Shortcuts** → **+** button
3. Application: **Kitty.app**
4. Menu Title: **New OS Window**
5. Keyboard Shortcut: **Cmd+`**
6. Click **Add**

**Option 2: Hammerspoon** (if you use it):
```lua
hs.hotkey.bind({"cmd"}, "`", function()
  local kitty = hs.application.find("Kitty")
  if kitty then
    if kitty:isFrontmost() then
      kitty:hide()
    else
      kitty:activate()
    end
  else
    hs.application.launchOrFocus("Kitty")
  end
end)
```
