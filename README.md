# Dotfiles

Personal macOS dotfiles configuration using GNU Stow for symlink management.

## 🚀 Quick Setup

```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles

# Run the installation script
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## 📁 What's Included

- **Shell Configuration** (`zsh/`)
  - Oh My Zsh with Powerlevel10k theme
  - Custom aliases and functions
  - Environment variables and PATH configuration

- **Git Configuration** (`git/`)
  - Global Git settings (`.gitconfig`)
  - Personal Git profile (`.gitconfig.personal`)
  - Work Git profile (`.gitconfig.work`)

- **VS Code Settings** (`vscode/`)
  - User settings and preferences
  - Extensions list for easy installation
  - Keybindings and snippets

- **Package Management**
  - Homebrew packages and applications (`Brewfile`)
  - Automatic installation of essential development tools

## 🛠 Installation Details

The `install.sh` script will:

1. **Install Homebrew** (if not already installed)
2. **Install packages** from `Brewfile` using `brew bundle`
3. **Setup Oh My Zsh** with Powerlevel10k theme
4. **Install MesloLGS Nerd Font** for proper terminal display
5. **Create symlinks** using GNU Stow for all configuration files
6. **Install development tools**:
   - NVM (Node Version Manager)
   - GVM (Go Version Manager)
   - Python 3

## 📦 Key Tools & Applications

### Development Tools
- Docker & Docker Compose
- Go, Node.js, Python
- Git with Hub
- Helix editor
- Various CLI utilities (jq, curl, etc.)

### System Utilities
- Colima (Docker Desktop alternative)
- Earthly (Build automation)
- ASDF (Version manager)
- Stow (Symlink manager)

### VS Code Extensions
The setup includes 50+ carefully selected extensions for:
- Language support (Go, Rust, TypeScript, etc.)
- Git integration (GitLens, GitHub)
- Code formatting and linting
- Docker and containerization
- AI assistance (GitHub Copilot)

## 🔧 Manual Configuration

### Git Profiles
After installation, configure your Git profiles:

```bash
# Personal projects
git config --include-if "gitdir:~/personal/" user.name "Your Name"
git config --include-if "gitdir:~/personal/" user.email "personal@example.com"

# Work projects  
git config --include-if "gitdir:~/work/" user.name "Your Work Name"
git config --include-if "gitdir:~/work/" user.email "work@company.com"
```

### Terminal Setup
1. Set your terminal font to "MesloLGS NF" for proper Powerlevel10k display
2. Run `p10k configure` to customize your prompt
3. Restart your terminal

### VS Code Extensions
Install VS Code extensions from the list:

```bash
# Install all extensions from the list
cat vscode/extentions.txt | xargs -L 1 code --install-extension
```

## 🔄 Updating

To update your dotfiles:

```bash
cd ~/dotfiles
git pull origin main
brew bundle --file=Brewfile  # Update Homebrew packages
stow zsh git vscode          # Re-link any new configurations
```

## 🛠 Customization

### Adding New Packages
1. Add packages to `Brewfile`
2. Run `brew bundle --file=~/dotfiles/Brewfile`

### Adding New Configurations
1. Create new directories in the dotfiles repo
2. Add your config files
3. Use `stow <directory-name>` to create symlinks

### Modifying Existing Configs
Edit files directly in the dotfiles directory, changes will be reflected immediately due to symlinks.

## 📋 Prerequisites

- macOS (tested on macOS Monterey and later)
- Command Line Tools for Xcode
- Internet connection for downloading packages


## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Note**: Always review scripts before running them on your system. This setup is tailored for macOS development environments.