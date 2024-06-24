#!/bin/bash

# Changes file perms to execute
chmod +x loomy.sh

# Find source directory and sends to dev null
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Pulls $SHELL info
user_shell=$(basename "$SHELL")

# From the above echos the location of Loomy to the path of the shell.
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
