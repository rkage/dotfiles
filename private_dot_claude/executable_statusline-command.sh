#!/usr/bin/env bash
# Claude Code status line, modeled on the p10k prompt: dir + git branch/status,
# plus model and context usage, led by the session title (Claude's auto-generated
# topic, or the /rename name) so each Ghostty split shows what it's for. Requires jq.
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
[ -z "$cwd" ] && cwd=$(pwd)
model=$(echo "$input" | jq -r '.model.display_name // empty')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
title=$(echo "$input" | jq -r '.session_name // empty')
# Keep long titles from pushing the rest off narrow splits
[ ${#title} -gt 50 ] && title="${title:0:49}…"

# Directory, with $HOME abbreviated to ~
dir="$cwd"
case "$dir" in
  "$HOME") dir="~" ;;
  "$HOME"/*) dir="~/${dir#"$HOME"/}" ;;
esac

# Git branch and dirty marker (skip optional locks)
branch=""
dirty=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null \
    || git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  if [ -n "$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null | head -n 1)" ]; then
    dirty="*"
  fi
fi

out=$(printf '\033[34m%s\033[0m' "$dir")
[ -n "$title" ] && out="$(printf '\033[1;35m%s\033[0m' "$title") $out"
[ -n "$branch" ] && out="$out $(printf '\033[32m%s%s\033[0m' "$branch" "$dirty")"
[ -n "$model" ] && out="$out $(printf '\033[36m%s\033[0m' "$model")"
[ -n "$used" ] && out="$out $(printf '\033[33mctx %.0f%%\033[0m' "$used")"

printf '%s\n' "$out"
