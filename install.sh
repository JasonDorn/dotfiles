#!/bin/bash

set -e

echo "================================"
echo "  Jason's Dotfiles Installer"
echo "================================"
echo ""

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Create backup directory
echo -e "${YELLOW}Creating backup at: $BACKUP_DIR${NC}"
mkdir -p "$BACKUP_DIR"

# Backup existing files
backup_file() {
    if [ -e "$1" ] || [ -L "$1" ]; then
        echo "  Backing up: $1"
        cp -r "$1" "$BACKUP_DIR/" 2>/dev/null || true
    fi
}

echo ""
echo "Backing up existing configs..."
backup_file "$HOME/.zshrc"
backup_file "$HOME/.zprofile"
backup_file "$HOME/.gitconfig"
backup_file "$HOME/.tmux.conf"
backup_file "$HOME/.config/nvim"
backup_file "$HOME/.config/kitty"
backup_file "$HOME/.hammerspoon"

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

echo ""
echo "Creating symlinks..."
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
create_symlink "$DOTFILES_DIR/config/kitty" "$HOME/.config/kitty"
create_symlink "$DOTFILES_DIR/config/hammerspoon" "$HOME/.hammerspoon"

# Ask which Neovim config to use
echo ""
echo "Which Neovim configuration would you like to use?"
echo "1) NvChad (current setup)"
echo "2) LazyVim (alternative)"
read -p "Enter choice [1 or 2]: " nvim_choice

case $nvim_choice in
    1)
        create_symlink "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"
        echo -e "${GREEN}✓${NC} NvChad configuration installed"
        ;;
    2)
        create_symlink "$DOTFILES_DIR/config/nvim-lazyvim" "$HOME/.config/nvim"
        echo -e "${GREEN}✓${NC} LazyVim configuration installed"
        ;;
    *)
        echo -e "${YELLOW}Skipping Neovim config${NC}"
        ;;
esac

echo ""
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}  Installation Complete!${NC}"
echo -e "${GREEN}================================${NC}"
echo ""
echo "Backup saved to: $BACKUP_DIR"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal"
echo "  2. Install required tools (see README.md)"
echo "  3. Open nvim and run :Lazy sync"
echo ""
