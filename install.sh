#!/bin/bash
# mindset installer

set -e

REPO_URL="https://github.com/luceinaltis/mindset"

# Determine tool
if [ "$1" = "--claude" ]; then
  TOOL=claude
elif [ "$1" = "--codex" ]; then
  TOOL=codex
else
  echo ""
  echo "Which tool?"
  echo "  1) Claude Code"
  echo "  2) Codex"
  read -p "Choose [1]: " tool_choice < /dev/tty
  case "$tool_choice" in
    2) TOOL=codex ;;
    *) TOOL=claude ;;
  esac
fi

# Determine scope
if [ "$2" = "--project" ]; then
  SCOPE=project
elif [ "$2" = "--global" ]; then
  SCOPE=global
else
  echo ""
  echo "Install scope?"
  echo "  1) Global (all projects)"
  echo "  2) This project only"
  read -p "Choose [1]: " scope_choice < /dev/tty
  case "$scope_choice" in
    2) SCOPE=project ;;
    *) SCOPE=global ;;
  esac
fi

# Set paths based on tool + scope
if [ "$TOOL" = "claude" ]; then
  if [ "$SCOPE" = "project" ]; then
    TOOL_DIR="./.claude"
    IMPORT_LINE="@.claude/mindset/AGENTS.md"
    TARGET="./CLAUDE.md"
  else
    TOOL_DIR="$HOME/.claude"
    IMPORT_LINE="@~/.claude/mindset/AGENTS.md"
    TARGET="$TOOL_DIR/CLAUDE.md"
  fi
  MINDSET_DIR="$TOOL_DIR/mindset"
else
  if [ "$SCOPE" = "project" ]; then
    TOOL_DIR="./.codex"
  else
    TOOL_DIR="$HOME/.codex"
  fi
  MINDSET_DIR="$TOOL_DIR/mindset"
fi

# Clone or update mindset into tool directory
mkdir -p "$TOOL_DIR"
if [ -d "$MINDSET_DIR/.git" ]; then
  echo "Updating mindset..."
  git -C "$MINDSET_DIR" pull
else
  echo "Installing mindset to $MINDSET_DIR..."
  git clone "$REPO_URL" "$MINDSET_DIR"
fi

# Install based on tool + scope
if [ "$TOOL" = "claude" ]; then
  if [ -f "$TARGET" ] && grep -qF "$IMPORT_LINE" "$TARGET"; then
    echo "Already installed in $TARGET"
  else
    echo "" >> "$TARGET"
    echo "$IMPORT_LINE" >> "$TARGET"
    echo "Added to $TARGET"
  fi
else
  if [ "$SCOPE" = "project" ]; then
    TARGET="./AGENTS.md"
  else
    TARGET="$TOOL_DIR/AGENTS.md"
  fi

  cp "$MINDSET_DIR/AGENTS.md" "$TARGET"
  echo "Copied to $TARGET"
fi

echo "Done! Restart $TOOL to apply."
