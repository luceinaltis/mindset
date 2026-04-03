#!/bin/bash
# mindset installer

set -e

REPO_URL="https://github.com/luceinaltis/mindset"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

info()   { echo -e "  ${BLUE}▸${NC} $1"; }
ok()     { echo -e "  ${GREEN}✓${NC} $1"; }
warn()   { echo -e "  ${YELLOW}⚠${NC} $1"; }
header() { echo -e "\n${BOLD}$1${NC}"; }

header "mindset installer"

# Determine tool
if [ "$1" = "--claude" ]; then
  TOOL=claude
elif [ "$1" = "--codex" ]; then
  TOOL=codex
else
  header "Which tool?"
  echo "  1) Claude Code"
  echo "  2) Codex"
  read -p "  Choose [1]: " tool_choice < /dev/tty
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
  header "Install scope?"
  echo "  1) Global (all projects)"
  echo "  2) This project only"
  read -p "  Choose [1]: " scope_choice < /dev/tty
  case "$scope_choice" in
    2) SCOPE=project ;;
    *) SCOPE=global ;;
  esac
fi

# Set paths based on tool + scope
if [ "$TOOL" = "claude" ]; then
  if [ "$SCOPE" = "project" ]; then
    TOOL_DIR="./.claude"
  else
    TOOL_DIR="$HOME/.claude"
  fi
  SKILLS_TARGET="$TOOL_DIR/skills"
else
  if [ "$SCOPE" = "project" ]; then
    TOOL_DIR="./.codex"
    SKILLS_TARGET="./.agents/skills"
  else
    TOOL_DIR="$HOME/.codex"
    SKILLS_TARGET="$HOME/.agents/skills"
  fi
fi

# Clone mindset to a temp directory
header "Installing..."
TMPDIR=$(mktemp -d)
info "Downloading mindset..."
git clone --quiet "$REPO_URL" "$TMPDIR"
ok "Downloaded"

# Install AGENTS.md
TARGET="$TOOL_DIR/AGENTS.md"
mkdir -p "$TOOL_DIR"
if [ -f "$TARGET" ]; then
  warn "$TARGET already exists, skipping"
else
  cp "$TMPDIR/AGENTS.md" "$TARGET"
  ok "AGENTS.md → $TARGET"
fi

# Install skills
mkdir -p "$SKILLS_TARGET"
for skill_dir in "$TMPDIR/skills/code/"* "$TMPDIR/skills/github/"*; do
  [ -d "$skill_dir" ] || continue
  skill_name=$(basename "$skill_dir")
  rm -rf "$SKILLS_TARGET/$skill_name"
  cp -r "$skill_dir" "$SKILLS_TARGET/$skill_name"
done
ok "Skills → $SKILLS_TARGET"

# Cleanup
rm -rf "$TMPDIR"

echo ""
ok "Done! Restart ${BOLD}$TOOL${NC} to apply."
