#!/usr/bin/env bash
# Claude Code Notification hook: desktop notification titled with the session's
# name (Claude's auto-generated topic, or the /rename name), so with many Ghostty
# splits open you can tell which one wants you. Claude's own generic
# notification is off (preferredNotifChannel in settings.json). Requires jq.

input=$(cat)
transcript=$(echo "$input" | jq -r '.transcript_path // empty')
message=$(echo "$input" | jq -r '.message // "Needs your attention"')
cwd=$(echo "$input" | jq -r '.cwd // empty')

# Latest title in the transcript: a /rename wins over the AI-generated one
title=""
if [ -f "$transcript" ]; then
  title=$(grep '"type":"custom-title"' "$transcript" | tail -n 1 | jq -r '.customTitle // empty' 2>/dev/null)
  [ -z "$title" ] && title=$(grep '"type":"ai-title"' "$transcript" | tail -n 1 | jq -r '.aiTitle // empty' 2>/dev/null)
fi
[ -z "$title" ] && title="Claude Code: ${cwd##*/}"

# OSC 777 fields are split on ';' and must not contain control characters
clean() { printf '%s' "$1" | tr ';' ',' | tr -d '\000-\037\177'; }

jq -n --arg t "$(clean "$title")" --arg m "$(clean "$message")" \
  '{terminalSequence: "\u001b]777;notify;\($t);\($m)\u0007"}'
