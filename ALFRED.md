# Alfred Configuration Guide

Alfred preferences are stored in `~/Library/Application Support/Alfred/` but the actual configuration structure makes it challenging to version control directly.

## Backup Alfred Settings

### Option 1: Alfred Sync Folder (Recommended)

Alfred has a built-in sync feature that's perfect for version control:

1. **Enable Alfred Sync**:
   - Open Alfred Preferences (⌥Space, type "alfred", click gear icon)
   - Go to "Advanced" tab
   - Click "Set preferences folder..."
   - Choose `~/dotfiles/config/alfred` (create this folder if it doesn't exist)
   - Alfred will copy all your settings there

2. **Add to Git**:
   ```bash
   cd ~/dotfiles
   git add config/alfred
   git commit -m "Add Alfred configuration"
   git push
   ```

3. **On New Machine**:
   - After cloning dotfiles and installing Alfred
   - Open Alfred Preferences > Advanced
   - Click "Set preferences folder..."
   - Select `~/dotfiles/config/alfred`
   - Alfred will load all your settings, workflows, and preferences

### Option 2: Manual Backup (Alternative)

If you prefer not to use Alfred's sync feature:

```bash
# Backup current Alfred config
cp -r ~/Library/Application\ Support/Alfred/Alfred.alfredpreferences ~/dotfiles/config/alfred-backup

# Restore on new machine
cp -r ~/dotfiles/config/alfred-backup ~/Library/Application\ Support/Alfred/Alfred.alfredpreferences
```

## What Gets Synced

When using Alfred's sync folder, it includes:
- ✅ Preferences and settings
- ✅ Custom workflows
- ✅ Clipboard history settings
- ✅ Snippets and text expansion
- ✅ Appearance and theme
- ✅ Default results and features
- ✅ File search settings
- ✅ Web searches and custom searches

## Alfred Workflows

If you have custom workflows, they'll be automatically included in the sync folder.

To manually backup/restore specific workflows:
```bash
# Backup workflows
cp -r ~/Library/Application\ Support/Alfred/Alfred.alfredpreferences/workflows ~/dotfiles/config/alfred-workflows

# Restore workflows
cp -r ~/dotfiles/config/alfred-workflows/* ~/Library/Application\ Support/Alfred/Alfred.alfredpreferences/workflows/
```

## Alfred License

**Important**: Your Alfred Powerpack license is **NOT** stored in the sync folder for security reasons.

After setting up Alfred on a new machine:
1. Open Alfred Preferences
2. Go to "Powerpack" tab
3. Enter your license email and key (check your email for the original purchase)
4. Or sign in with your registered email if you have a v5+ license

## Recommended Setup on New Machine

1. Install Alfred via Brewfile: `brew bundle --file=~/dotfiles/Brewfile`
2. Launch Alfred for the first time
3. Open Alfred Preferences (click Alfred icon in menu bar)
4. Navigate to: Advanced > Set preferences folder
5. Select: `~/dotfiles/config/alfred`
6. Alfred will restart and load all your settings
7. Enter your Powerpack license when prompted

## Notes

- The sync folder approach is the official Alfred-recommended method
- It's safe to commit to version control (no sensitive data)
- Your license key is never stored in the sync folder
- Works seamlessly across multiple machines
