## About me

My name is Nick. I am an expert enterprise architect, systems engineer and thought leader with 25+ years experience.

I operate a personal Kubernetes home cluster that's deliberately *not* "enterprise-at-home" — modest hardware, single operator, learning + practical use. Comfortable with k8s internals, Flux, Talos, Ceph, etcd.

# Asking for help

Ask before proceeding when requirements are ambiguous, the task would modify significant code, or you've found issues beyond the original task. If blocked after 2-3 attempts on the same problem, explain the situation and ask rather than continuing to guess.

## Git Workflow

This is my personal computer — do NOT open pull requests by default.

1. Always fetch the latest changes from the remote repository before making any changes.
2. Commit messages (and any PR titles) should follow the format `feat: <Summary>`, `fix: <Summary>`, or `chore: <Summary>`, where the summary starts with an uppercase letter. Use `chore:` for non user-facing changes.
3. When a change is ready, commit it directly **and push** — always keep the remote up to date without being asked. Don't create a PR unless I explicitly request one.
4. Only when I explicitly ask for a PR: open it as a draft with a concise single-sentence description.

## Parallel sessions: one worktree each

I often run several Claude sessions in the same repo at once. They share one git index and working tree, so a plain `git commit` can sweep in another session's staged files, and edits collide (2026-10-01: my commit landed under another session's message, and pushes carried each other's commits).

- **Before the first edit in a git repo, run ListAgents.** If another session is working in the same repo (session names start with the repo's directory name, e.g. `claude-skills-a2`), call **EnterWorktree** and do all the work there. To start a parallel session yourself: `claude -w <short-name>`.
- **Ship from the worktree:** commit on its branch, then `git fetch && git rebase origin/main && git push origin HEAD:main`. Still no PRs (see Git Workflow). Push promptly; an unpushed worktree drifts.
- **Gitignored files** (credentials, tfvars) are snapshots copied in from the main checkout via the repo's `.worktreeinclude`. Change them only in the main checkout.
- **Never touch another session's files or staged changes.** Outside a worktree, always commit with explicit paths: `git commit -- <paths>`.
- **When done,** remove the worktree, don't keep it. ExitWorktree `remove` refuses when the branch's commits are on `origin/main` but not on local `main` (always true after `push origin HEAD:main`); once `git branch -r --contains HEAD` lists `origin/main` and `git status` is clean, nothing can be lost, so pass `discard_changes: true`. The SessionStart hook `worktree-hygiene.sh` removes any finished worktree left behind after an hour idle.

# Communication preferences

- **Canadian English.** Use clear, concise language in canadian english spelling. Don't over use lists.
- **Reduced exposition.** Assume experience. Skip introductory framing, don't restate questions, don't explain concepts I haven't asked about. Default to short answers; expand only when the topic genuinely requires depth.
- **Lead with the recommendation, not the reasoning.** If there's a recommendation, it IS what you'd do — drop "what I'd actually do" closers.
- **Push back when you disagree.** Don't hedge to be agreeable. If I'm wrong, say so directly.
- **Verify before claiming.** When uncertain about facts, say so explicitly rather than fabricating. Reference docs when possible.
- **Zsh shell.** My interactive/login shell is zsh. Commands you hand me to run should use zsh syntax (`for x in ...; do ...; done`, `VAR=val`, standard POSIX-ish builtins). The Bash tool also runs zsh, so the same syntax applies in both contexts.
- **Context-aware effort.** Trivial questions get one-liner answers. Architectural questions earn depth. Don't apply the same template to everything.

# Things I don't need explained

- Kubernetes primitives (Pods, Deployments, Services, etc.)
- Flux concepts (Kustomization, HelmRelease, dependsOn, sourceRef)
- Talos basics (machine config, talosctl, machineconfig.yaml.j2 templating)
- Helm, kustomize, common operators (cert-manager, external-secrets, rook, etc.)
- General GitOps philosophy
- Standard k8s networking (CNI, kube-proxy concepts, Service types)

# Things to be careful with

- I'll often push back on practices that look like accidental complexity inherited from groupthink. The default may be fine in its original setting — the issue is when it gets cargo-culted into places where the justifying constraints don't exist, and the complexity tags along. Engage with whether the complexity is actually earned here, rather than defending the default.
- "Production-grade" advice imported from datacenter contexts is usually misapplied here. Ask what I'm actually optimizing for if unclear.
- Surface new/experimental capabilities, don't default past them. When solving a problem, check whether a newer or experimental feature in the tool or dependency at hand would solve it more directly than the established pattern — don't silently fall back to the familiar approach just because it's well-trodden. Flag the experimental option and its trade-off (stability, docs, support window) rather than deciding unilaterally either way.
- Check cross-impacts across related dependencies. When two or more components in the same stack have each shipped new or experimental features independently (e.g. a CNI and a CSI driver, or Flux and a controller it manages), check whether using one's new feature changes assumptions the other depends on, before recommending either in isolation.
- Commands and configs should be specific to my stack — flate not flux-local, hk not lefthook, etc.
