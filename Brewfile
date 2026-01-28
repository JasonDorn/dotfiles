# Jason's Brewfile
#
# Usage:
#   Personal machine (all apps): brew bundle --file=~/dotfiles/Brewfile
#   Work machine (dev only):     WORK_MACHINE=1 brew bundle --file=~/dotfiles/Brewfile
#
# The WORK_MACHINE flag excludes: music production tools, personal communication apps,
# VPN tools, and other personal-use applications

tap "homebrew/services"

# ============================================
# Essential Development Tools
# ============================================
brew "git"
brew "gh"                    # GitHub CLI
brew "neovim"
brew "tmux"
brew "direnv"                # Auto-load environment variables per directory

# ============================================
# Shell & Terminal Tools
# ============================================
brew "ripgrep"               # Fast grep alternative
brew "fd"                    # Fast find alternative
brew "fzf"                   # Fuzzy finder
brew "bat"                   # Better cat with syntax highlighting
brew "eza"                   # Better ls
brew "tree"                  # Directory tree viewer
brew "zoxide"                # Smart cd command
brew "htop"                  # Process viewer
brew "lazygit"               # Terminal UI for git

# ============================================
# Programming Languages & Version Managers
# ============================================
brew "rbenv"                 # Ruby version manager
brew "ruby-build"
brew "pyenv"                 # Python version manager
brew "pyenv-virtualenv"
brew "python@3.12"
brew "python@3.13"
brew "nvm"                   # Node version manager
brew "node"
brew "pnpm"                  # Fast npm alternative
brew "uv"                    # Fast Python package installer

# ============================================
# Databases
# ============================================
brew "postgresql@12"
brew "postgresql@17", restart_service: :changed
brew "redis", restart_service: :changed
brew "pgcli"                 # Better PostgreSQL CLI
brew "pgvector"              # Vector similarity search for Postgres

# ============================================
# Development Tools
# ============================================
brew "croc"                  # File transfer
brew "sevenzip"
brew "gnupg"                 # GPG encryption
brew "nmap"                  # Network scanner
brew "mailhog", restart_service: :changed  # Email testing tool

# ============================================
# Documentation & Build Tools
# ============================================
brew "pandoc"                # Document converter
brew "cmake"
brew "pkgconf"

# ============================================
# Python Tools
# ============================================
brew "pipx"                  # Install Python apps in isolated environments
brew "sqlparse"

# ============================================
# Libraries (dependencies for other tools)
# ============================================
brew "openssl@3"
brew "glib"
brew "icu4c@74"
brew "icu4c@77"
brew "harfbuzz"
brew "pango"
brew "ffmpeg"
brew "flac"
brew "librsvg"
brew "graphviz"
brew "libmagic"
brew "libxmlsec1"
brew "openjdk"
brew "antlr"

# ============================================
# GUI Applications (All Machines)
# ============================================
cask "alfred"                # Productivity launcher
cask "hammerspoon"           # Window manager & automation
cask "kitty"                 # Fast GPU-based terminal
cask "iterm2"                # Alternative terminal
cask "rectangle"             # Window snapping

# ============================================
# Browsers
# ============================================
cask "google-chrome"
cask "firefox"
cask "brave-browser"

# ============================================
# Development Apps
# ============================================
cask "claude-code"           # AI coding assistant

# ============================================
# Productivity (All Machines)
# ============================================
cask "obsidian"              # Note-taking
cask "slack"

# ============================================
# Utilities (All Machines)
# ============================================
cask "stats"                 # System monitor in menu bar
cask "daisydisk"             # Disk space analyzer

# ============================================
# Media (All Machines)
# ============================================
cask "vlc"
cask "loom"                  # Screen recording

# ============================================
# Other Tools
# ============================================
cask "chatgpt-atlas"
cask "basictex"              # LaTeX distribution

# ============================================
# Personal Machine Only (skip with WORK_MACHINE=1)
# ============================================
unless ENV['WORK_MACHINE']
  # Communication
  cask "1password"
  cask "discord"
  cask "signal"
  cask "whatsapp"
  cask "messenger"

  # VPN & Network
  cask "nordvpn"
  cask "twingate"

  # Productivity
  cask "libreoffice"

  # Music Production (DJ Tools)
  cask "rekordbox"
  cask "mixed-in-key"
  cask "tidal"
end
