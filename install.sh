#!/bin/bash

create_complex_symlink() {
    local source_file="$1"
    local symlink_name_win="$2"
    local symlink_name_unix="$3"
  
    # Check the operating system
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        # Windows (using PowerShell)
        powershell -Command "New-Item -ItemType SymbolicLink -Path $symlink_name_win -Value $source_file -Force" 
        echo "Symbolic link created: $symlink_name_win -> $source_file"
    else
        # Unix-like (using Bash)
        ln -sf "$HOME/dotfiles/$source_file" "$symlink_name_unix"
        echo "Symbolic link created: $symlink_name_unix -> $source_file"
    fi
}

create_symlink() {
    local source_file="$1"
    local symlink_name="$2"
  
    # Check the operating system
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        # Windows (using PowerShell)
        powershell -Command "New-Item -ItemType SymbolicLink -Path $symlink_name -Value $source_file -Force" 
        echo "Symbolic link created: $symlink_name -> $source_file"
    else
        # Unix-like (using Bash)
        ln -sf "$HOME/dotfiles/$source_file" "$symlink_name"
        echo "Symbolic link created: $symlink_name -> $source_file"
    fi
}

# Usage: Pass the filename as an argument to the function
# create_symlink "./source.txt" "$HOME/source.txt"

# Simple config files where target is the same in both env
# create_symlink "$HOME/dotfiles/dprint.config.json" "$HOME/.dprint.json"
# create_symlink "$HOME/dotfiles/starship/.config.toml" "$HOME/.config/starship/.config.toml"
# create_symlink "$HOME/dotfiles/ssh/.ssh/config" "$HOME/.ssh/config"
create_symlink "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
create_symlink "$HOME/dotfiles/.zshenv" "$HOME/.zshenv"

# Complex config files where target depends on the env
## Helix
create_complex_symlink "$HOME/dotfiles/helix/.config/helix" "$env:APPDATA/helix" "$HOME/.config/helix"
