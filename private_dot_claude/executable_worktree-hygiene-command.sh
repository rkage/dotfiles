#!/usr/bin/env bash
# SessionStart hook: tidy the Claude worktrees in .claude/worktrees/.
#
# A session that crashed, or exited with "keep", leaves its worktree, its branch
# and its copied credentials (.worktreeinclude) behind. On every session start:
#   - skip a worktree whose owning session is still running (the lock Claude
#     Code writes names its pid)
#   - REMOVE one that is clean, has no commits missing from origin's default
#     branch, and was last touched over IDLE_MIN minutes ago (default 60): nothing
#     lost, nothing to ask about
#   - REPORT one older than STALE_DAYS that still holds uncommitted changes or
#     unpushed commits, so a person decides
#   - git worktree prune (drops records of worktree dirs already deleted)
#
# Never fetches (must stay fast) and never touches the main checkout. Silent
# unless it did or found something.

set -uo pipefail

ROOT="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null)}"
[[ -n "$ROOT" && -d "$ROOT/.claude/worktrees" ]] || exit 0
G() { /usr/bin/git -C "$1" "${@:2}"; }
STALE_DAYS="${WORKTREE_STALE_DAYS:-7}"
IDLE_MIN="${WORKTREE_IDLE_MIN:-60}"
now=$(date +%s)
base=$(G "$ROOT" symbolic-ref -q --short refs/remotes/origin/HEAD 2>/dev/null || echo origin/main)

removed=() report=()
while IFS= read -r line; do
    case "$line" in
        "worktree "*) wt=${line#worktree }; branch=""; lock="" ;;
        "branch "*) branch=${line#branch refs/heads/} ;;
        "locked"*) lock=${line#locked}; lock=${lock# } ;;
        "")
            # live session? its lock reads "claude session <name> (pid N start ...)"
            [[ "${wt:-}" == "$ROOT/.claude/worktrees/"* && -d "${wt:-}" ]] || { wt=""; continue; }
            name=${wt##*/}
            pid=$(sed -nE 's/.*\(pid ([0-9]+) .*/\1/p' <<< "$lock")
            if [[ -n "$pid" ]] && kill -0 "$pid" 2>/dev/null; then wt=""; continue; fi
            dirty=$(G "$wt" status --porcelain 2>/dev/null | wc -l | tr -d ' ')
            ahead=0
            [[ -n "$branch" ]] && ahead=$(G "$wt" rev-list --count "$base..HEAD" 2>/dev/null || echo 0)
            # Last activity: the worktree's own reflog (commits, checkouts, resets)
            # or a change to its top-level entries. Not the index: `git status`
            # above refreshes it.
            admin=$(sed -n 's/^gitdir: //p' "$wt/.git" 2>/dev/null)
            touched=$(stat -f %m "$wt" 2>/dev/null || echo "$now")
            reflog=$(stat -f %m "$admin/logs/HEAD" 2>/dev/null || echo 0)
            (( reflog > touched )) && touched=$reflog
            age_days=$(( (now - touched) / 86400 ))
            if [[ "$dirty" == 0 && "$ahead" == 0 ]] && (( now - touched > IDLE_MIN * 60 )); then
                [[ -n "$lock" ]] && G "$ROOT" worktree unlock "$wt" 2>/dev/null
                if G "$ROOT" worktree remove "$wt" 2>/dev/null; then
                    [[ -n "$branch" ]] && G "$ROOT" branch -q -d "$branch" 2>/dev/null
                    removed+=("$name")
                fi
            elif (( age_days >= STALE_DAYS )); then
                report+=("$name (${age_days}d old: ${dirty} uncommitted, ${ahead} unpushed commits)")
            fi
            wt="" ;;
    esac
done < <(G "$ROOT" worktree list --porcelain 2>/dev/null; echo)
G "$ROOT" worktree prune 2>/dev/null

(( ${#removed[@]} + ${#report[@]} )) || exit 0
msg=""
(( ${#removed[@]} )) && msg+="Removed ${#removed[@]} finished worktree(s): ${removed[*]}. "
(( ${#report[@]} )) && msg+="Stale worktrees with unfinished work in .claude/worktrees/: $(IFS='; '; echo "${report[*]}"). Review before removing (git worktree remove <path>)."
python3 -c 'import json,sys; m=sys.argv[1]; print(json.dumps({"systemMessage": "worktree-hygiene: " + m, "hookSpecificOutput": {"hookEventName": "SessionStart", "additionalContext": m}}))' "$msg"
