#!/bin/zsh

# --- Helper function for idempotent appends to shell config files ---
add_to_shell_config() {
  local line="$1"
  local file="$2"
  if ! grep -qF "$line" "$file"; then # -q (quiet), -F (fixed string)
    echo "$line" >> "$file"
    echo "  Added: '$line' to '$file'"
  else
    echo "  Line already exists: '$line' in '$file'. Skipping."
  fi
}

# Helper function to create a symlink with idempotency checks
create_dotfile_symlink() {
  local dotfile_base_name="$1" # e.g., 'vim'
  local local_link_name="$2"   # e.g., '.vim'

  local dotfile_source="$HOME/dotfiles/$dotfile_base_name" # Source path in your dotfiles repo
  local local_target_path="$HOME/$local_link_name"       # Target symlink path in your home directory

  echo "Processing $dotfile_source -> $local_target_path"

  if [ -e "$dotfile_source" ]; then # Check if the source dotfile actually exists
    if [ -L "$local_target_path" ]; then # Check if the symlink already exists
      echo "  Symlink '$local_target_path' already exists. Skipping."
    elif [ -e "$local_target_path" ]; then # Check if a file/dir exists at target that is NOT a symlink
      echo "  WARNING: '$local_target_path' exists and is NOT a symlink. Please move or delete it manually if you want to create a symlink."
    else
      # Create the symlink if source exists and target doesn't exist or isn't a symlink
      ln -s "$dotfile_source" "$local_target_path"
      echo "  Created symlink: '$local_target_path' -> '$dotfile_source'"
    fi
  else
    echo "  ERROR: Source dotfile '$dotfile_source' does not exist. Cannot create symlink for '$local_target_path'."
  fi
}

# --- Ensure Zsh is the default shell ---
# This line can be problematic if run non-interactively or if not desired every time.
# On macOS, it requires user password input. Consider running it manually once.
# chsh -s $(which zsh)
echo "Ensuring Zsh is the default shell (consider running 'chsh -s $(which zsh)' manually if issues arise)."

# --- Install Homebrew ---
echo "--- Installing Homebrew ---"

if ! [ -x "$(command -v brew)" ]; then
  echo "Homebrew not found. Installing..."
  # Install Xcode Command Line Tools first (Homebrew will prompt if not present)
  xcode-select --install || true # `|| true` prevents script from exiting if tools are already installed or user cancels

  # Official Homebrew installer for macOS
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # --- IMPORTANT: Add Homebrew to PATH ---
  # Homebrew's installer typically provides these instructions at the end.
  # This makes it available for the current session and adds to .zshrc/.zprofile
  # For Apple Silicon Macs, Homebrew installs to /opt/homebrew
  # For Intel Macs, Homebrew installs to /usr/local
  echo "Adding Homebrew to .zshrc and current session..."
  add_to_shell_config 'eval "$('"${HOMEBREW_PREFIX}"'/bin/brew shellenv)"' ~/.zprofile
  add_to_shell_config 'eval "$('"${HOMEBREW_PREFIX}"'/bin/brew shellenv)"' ~/.zshrc
  eval "$(/opt/homebrew/bin/brew shellenv)" # Source for current session

  echo "Running brew doctor to check for issues..."
  brew doctor
else
  echo "Homebrew is already installed."
fi

# --- Install ag (The Silver Searcher) via Homebrew ---
echo "--- Installing ag (The Silver Searcher) ---"

if ! [ -x "$(command -v ag)" ]; then
  echo "ag not found. Installing via Homebrew..."
  brew install the_silver_searcher
else
  echo "ag is already installed."
fi

# --- Install Visual Studio Code via Homebrew Cask ---
echo "--- Installing Visual Studio Code ---"

if ! [ -x "$(command -v code)" ]; then
  echo "Visual Studio Code not found. Installing via Homebrew Cask..."
  brew install --cask visual-studio-code
  echo "Visual Studio Code installed. To enable 'code' command in your terminal:"
  echo "  1. Launch VS Code."
  echo "  2. Open the Command Palette (Cmd+Shift+P)."
  echo "  3. Type 'shell command' and select 'Shell Command: Install 'code' command in PATH'."
  echo "  4. Restart your terminal."
else
  echo "Visual Studio Code is already installed."
fi

# --- Install asdf-vm ---
echo "--- Installing asdf-vm ---"

if ! [ -d "$HOME/.asdf" ]; then # Check if the directory exists
  echo "asdf-vm not found. Installing..."
  # Clone asdf to your home directory, pinning to a specific stable version for consistency
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

  echo "Adding asdf to .zshrc for proper initialization..."
  add_to_shell_config '# asdf-vm setup' ~/.zshrc
  add_to_shell_config '. "$HOME/.asdf/asdf.sh"' ~/.zshrc
  # The line below is the crucial one for Zsh completions.
  # It initializes Zsh's completion system *after* asdf is sourced.
  # We use -D to ensure a faster startup after the first run.
  add_to_shell_config 'autoload -Uz compinit && compinit -D' ~/.zshrc

  # Source asdf for the current shell session so it's immediately available
  . "$HOME/.asdf/asdf.sh"
  # Also run compinit for the current session
  autoload -Uz compinit && compinit -D

  echo "asdf-vm installed and configured for Zsh."

  echo "Adding common asdf plugins..."
  # Add some common plugins. The '|| true' prevents the script from stopping
  # if a plugin is already added (e.g., if you run the script multiple times).
  asdf plugin add ruby || true
  asdf plugin add nodejs || true
  asdf plugin add python || true
  asdf plugin add golang || true # Popular for Go projects

  # Optional: Install a default Ruby and Node.js version.
  # Uncomment and adjust versions as needed for your primary development.
  # echo "Installing default ruby and nodejs versions..."
  # asdf install ruby latest
  # asdf global ruby latest
  # asdf install nodejs latest
  # asdf global nodejs latest
else
  echo "asdf-vm is already installed."
fi

# --- Existing Symlinks Section (with improvements) ---
cd "$HOME" # Ensure we are in the home directory before creating symlinks
echo "--- Generating Symlinks ---"

# Call the helper function for each dotfile
create_dotfile_symlink "vim" ".vim"
create_dotfile_symlink "gemrc" ".gemrc"
create_dotfile_symlink "gitconfig" ".gitconfig"
create_dotfile_symlink "gitignore" ".gitignore"
create_dotfile_symlink "irbrc" ".irbrc"
create_dotfile_symlink "rspec" ".rspec"
create_dotfile_symlink "vimrc" ".vimrc"
create_dotfile_symlink "zshrc" ".zshrc"
create_dotfile_symlink "zsh" ".zsh"
create_dotfile_symlink "git-prompt.sh" ".git-prompt.sh"
create_dotfile_symlink "aliases" ".aliases"

echo "--- Setup complete! Please restart your terminal or run 'source ~/.zshrc' ---"
