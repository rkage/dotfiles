#!/bin/sh
# Claude Code apiKeyHelper — reads the LiteLLM key from the macOS login Keychain.
# Login keychain auto-unlocks with your session, so this is silent: no 1Password
# biometric prompt on every new Claude/Zed session. Output is the key, no newline.
#
# 1Password stays canonical. After rotating the LiteLLM virtual key, re-sync with:
#   security add-generic-password -U -a "$USER" -s claude-litellm \
#     -w "$(op read 'op://talos-n150-cluster/litellm/vqbeulhvextfx4v4ksbmz4e2k4' --no-newline)"
set -eu
printf '%s' "$(security find-generic-password -w -s claude-litellm)"
