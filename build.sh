#!/bin/bash

# Variables for the script and man page
SCRIPT_NAME="loomy.sh"
MAN_PAGE_NAME="loomy.1"

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Changes file perms to execute
chmod +x "$SCRIPT_NAME"

# Install the script to /usr/bin
echo "Installing $SCRIPT_NAME to /usr/bin..."
cp "$SCRIPT_NAME" /usr/bin/loomy
if [ $? -eq 0 ]; then
  echo "$SCRIPT_NAME installed to /usr/bin/loomy"
else
  echo "Failed to install $SCRIPT_NAME to /usr/bin/loomy"
  exit 1
fi

# Check if the man directory exists, if not create it
MAN_DIR="/usr/share/man/man1"
if [ ! -d "$MAN_DIR" ]; then
  echo "Creating man directory at $MAN_DIR..."
  mkdir -p "$MAN_DIR"
fi

# Move the man page to the man directory
echo "Moving $MAN_PAGE_NAME to $MAN_DIR..."
cp "$MAN_PAGE_NAME" "$MAN_DIR"
if [ $? -eq 0 ]; then
  echo "$MAN_PAGE_NAME moved to $MAN_DIR"
else
  echo "Failed to move $MAN_PAGE_NAME to $MAN_DIR"
  exit 1
fi

# Compress the man page using tar
echo "Compressing $MAN_PAGE_NAME..."
tar -cvf "$MAN_DIR/$MAN_PAGE_NAME.tar" -C "$MAN_DIR" "$MAN_PAGE_NAME"
if [ $? -eq 0 ]; then
  rm "$MAN_DIR/$MAN_PAGE_NAME"
  echo "$MAN_PAGE_NAME compressed and original file removed"
else
  echo "Failed to compress $MAN_PAGE_NAME"
  exit 1
fi

echo "Installation complete!"
