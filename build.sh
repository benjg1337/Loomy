#!/bin/bash

# Ensure loomy.sh is executable
chmod +x loomy.sh

# Get the directory where this script resides
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Determine the user's shell
user_shell=$(basename "$SHELL")

# Add the directory containing loomy.sh to PATH if not already in PATH
if [[ ":$PATH:" != *":$script_dir:"* ]]; then
    case "$user_shell" in
        bash)
            echo "export PATH=\"$script_dir:\$PATH\"" >> ~/.bashrc
            echo "Updated PATH in ~/.bashrc to include $script_dir"
            ;;
        zsh)
            echo "export PATH=\"$script_dir:\$PATH\"" >> ~/.zshrc
            echo "Updated PATH in ~/.zshrc to include $script_dir"
            ;;
        *)
            echo "Unsupported shell: $user_shell. Please add the following line manually to your shell configuration file:"
            echo "export PATH=\"$script_dir:\$PATH\""
            ;;
    esac
else
    echo "$script_dir is already in PATH"
fi
