# dotfiles

My `dotfiles`, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

Personal secrets are stored in [1Password](https://1password.com) and will
require [1Password CLI](https://developer.1password.com/docs/cli/) installed.

```shell
eval $(op signin)
```

Finally, init chezmoi

```shell
chezmoi init rkage
```
