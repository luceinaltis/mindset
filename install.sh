#!/bin/bash
# mindset installer

set -e

MINDSET_DIR="$HOME/mindset"
GLOBAL_CLAUDE="$HOME/.claude/CLAUDE.md"
IMPORT_LINE="@~/mindset/AGENTS.md"

# Clone or update mindset
if [ -d "$MINDSET_DIR/.git" ]; then
  echo "Updating mindset..."
  git -C "$MINDSET_DIR" pull
else
  echo "Installing mindset to $MINDSET_DIR..."
  git clone https://github.com/luceinaltis/mindset "$MINDSET_DIR"
fi

# Global install (default) or project install
if [ "$1" = "--project" ]; then
  TARGET="./CLAUDE.md"
  echo "Installing to project: $TARGET"
else
  mkdir -p "$HOME/.claude"
  TARGET="$GLOBAL_CLAUDE"
  echo "Installing globally: $TARGET"
fi

# Add import line if not already present
if [ -f "$TARGET" ] && grep -qF "$IMPORT_LINE" "$TARGET"; then
  echo "Already installed in $TARGET"
else
  echo "" >> "$TARGET"
  echo "$IMPORT_LINE" >> "$TARGET"
  echo "Added to $TARGET"
fi

echo "Done! Restart Claude Code to apply."
