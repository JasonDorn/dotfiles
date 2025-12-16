#!/bin/bash

set -e

echo "========================================"
echo "  Jason's Dotfiles Installer"
echo "  Complete Development Environment Setup"
echo "========================================"
echo ""

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

# Helper functions
print_step() {
    echo ""
    echo -e "${BLUE}==>${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Create backup directory
print_step "Creating backup at: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Backup existing files
backup_file() {
    if [ -e "$1" ] || [ -L "$1" ]; then
        echo "  Backing up: $1"
        cp -r "$1" "$BACKUP_DIR/" 2>/dev/null || true
    fi
}

print_step "Backing up existing configs..."
backup_file "$HOME/.zshrc"
backup_file "$HOME/.zprofile"
backup_file "$HOME/.zshenv"
backup_file "$HOME/.gitconfig"
backup_file "$HOME/.tmux.conf"
backup_file "$HOME/.config/nvim"
backup_file "$HOME/.config/kitty"
backup_file "$HOME/.hammerspoon"
backup_file "$HOME/.p10k.zsh"
backup_file "$HOME/.work_zshrc.zsh"

# Install Homebrew
print_step "Checking for Homebrew..."
if ! command -v brew &> /dev/null; then
    print_warning "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    print_success "Homebrew installed"
else
    print_success "Homebrew already installed"
fi

# Install essential CLI tools
print_step "Installing essential CLI tools..."
brew install \
    ripgrep \
    fd \
    fzf \
    lazygit \
    tree \
    bat \
    eza \
    zoxide \
    neovim \
    tmux \
    git \
    direnv \
    rbenv \
    pyenv \
    nvm \
    postgresql@17 \
    kitty \
    || print_warning "Some packages may have failed to install"

print_success "CLI tools installed"

# Install Oh My Zsh
print_step "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_success "Oh My Zsh installed"
else
    print_success "Oh My Zsh already installed"
fi

# Install Powerlevel10k theme
print_step "Installing Powerlevel10k theme..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    print_success "Powerlevel10k installed"
else
    print_success "Powerlevel10k already installed"
fi

# Install Zsh Syntax Highlighting
print_step "Installing Zsh Syntax Highlighting..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    print_success "Zsh Syntax Highlighting installed"
else
    print_success "Zsh Syntax Highlighting already installed"
fi

# Copy p10k config if it doesn't exist
print_step "Setting up Powerlevel10k configuration..."
if [ ! -f "$HOME/.p10k.zsh" ]; then
    # Use default p10k config or create minimal one
    print_warning "No .p10k.zsh found. You'll need to run 'p10k configure' after installation."
fi

# Create symlinks
create_symlink() {
    SOURCE="$1"
    TARGET="$2"

    if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
        rm -rf "$TARGET"
    fi

    mkdir -p "$(dirname "$TARGET")"
    ln -sf "$SOURCE" "$TARGET"
    echo -e "${GREEN}✓${NC} Linked: $TARGET -> $SOURCE"
}

print_step "Creating symlinks..."
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
create_symlink "$DOTFILES_DIR/config/kitty" "$HOME/.config/kitty"
create_symlink "$DOTFILES_DIR/config/hammerspoon" "$HOME/.hammerspoon"
create_symlink "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"

# Create work config template
print_step "Setting up work configuration..."
if [ ! -f "$HOME/.work_zshrc.zsh" ]; then
    cp "$DOTFILES_DIR/.work_zshrc.zsh.template" "$HOME/.work_zshrc.zsh"
    print_success "Created ~/.work_zshrc.zsh template"
    print_warning "Edit ~/.work_zshrc.zsh to add your work-specific environment variables"
else
    print_success "Work config already exists"
fi

# Install FZF key bindings
print_step "Setting up FZF..."
if [ -f "$(brew --prefix)/opt/fzf/install" ]; then
    "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-update-rc --no-bash --no-fish
    print_success "FZF key bindings installed"
fi

# Setup rbenv
print_step "Initializing rbenv..."
if command -v rbenv &> /dev/null; then
    mkdir -p "$(rbenv root)/plugins"
    print_success "rbenv ready"
fi

# Setup pyenv
print_step "Initializing pyenv..."
if command -v pyenv &> /dev/null; then
    print_success "pyenv ready"
    print_warning "You may want to install Python versions: pyenv install 3.11.0"
fi

# Setup NVM
print_step "Initializing NVM..."
mkdir -p "$HOME/.nvm"
print_success "NVM directory created"
print_warning "NVM will be fully initialized on next shell start"

# Install Hammerspoon if on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    print_step "Checking for Hammerspoon..."
    if [ ! -d "/Applications/Hammerspoon.app" ]; then
        print_warning "Hammerspoon not found. Install from: https://www.hammerspoon.org/"
        print_warning "After installing, launch Hammerspoon and enable it in System Settings"
    else
        print_success "Hammerspoon found"
        print_warning "Make sure to launch Hammerspoon and enable it in System Settings"
    fi
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Installation Complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Backup saved to: $BACKUP_DIR"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Open Neovim: nvim"
echo "     - Lazy.nvim will auto-install plugins on first launch"
echo "  3. Configure Powerlevel10k: p10k configure (if needed)"
echo "  4. Edit ~/.work_zshrc.zsh with work-specific configs"
echo "  5. Install Kitty.app from: https://sw.kovidgoyal.net/kitty/"
echo "  6. Install Hammerspoon from: https://www.hammerspoon.org/"
echo ""
echo -e "${BLUE}Optional installations:${NC}"
echo "  - Install a Nerd Font: brew install --cask font-jetbrains-mono-nerd-font"
echo "  - Ruby: rbenv install 3.2.0 && rbenv global 3.2.0"
echo "  - Python: pyenv install 3.11.0 && pyenv global 3.11.0"
echo "  - Node: nvm install --lts"
echo ""
