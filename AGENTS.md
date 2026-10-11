# dotfiles

Personal macOS setup: fish, starship, git, iTerm2, Homebrew, macOS defaults, plus helper
scripts for the Synology NAS / Plex. See [`README.md`](README.md) for the full bootstrap.

## How it's wired

Everything here is **symlinked live** into `$HOME` by `symlink-setup.sh`. An edit takes
effect on this machine immediately: a new shell picks up `fish/` changes, and `brew`
reads the `Brewfile`.

- Every **top-level dotfile** (`.*`, except `.git`, `.DS_Store`, `.editorconfig`) is
  linked into `~`. Don't add a root dotfile unless you mean it to land in `$HOME`.
- `fish/` → `~/.config/fish`, `starship.toml` → `~/.config/starship.toml`,
  `1Password/` → `~/.config/1Password`, `scripts/` → `~/scripts`.
- `ghostty/` is a parked Ghostty config. It isn't installed or linked; it's kept for if the
  quick terminal ever gets tabs.
- SSH config and git identities/keys come from iCloud (`System/.ssh`, `System/git`), not this
  repo. Machine-local overrides live in `~/.gitconfig.local` and `~/.extra.fish` (untracked).

## Don't run

These change system state, need sudo, or prompt interactively. Read them, edit them,
but never execute them unless explicitly asked:
`initial-setup.sh`, `macos.sh`, `dock-setup.sh`, `symlink-setup.sh`,
`dnscrypt-proxy/install.sh`, `brew bundle`, anything under `scripts/` (they SSH to the NAS).

Safe checks: `fish -n <file>`, `bash -n <file>`, `brew bundle check --file=Brewfile`.

## Conventions

- **fish:** config is split by numbered prefix in `fish/conf.d/` (`00` env → `10` path →
  `11` aliases → `20` dev → `30` git → `40` colours → `90` prompt). Put new config in the
  matching file, and keep `config.fish` near-empty. Use `abbr` for typed shortcuts and
  `function`/`alias` when it must work in scripts.
- `fish/fish_variables` is written by fish itself. Don't hand-edit it.
- **Brewfile:** keep every section alphabetical, commented-out lines included.
  Tap-qualified formulae sort by short name (`hashicorp/tap/terraform` sorts as `terraform`).
- **Shell scripts:** bash, 2-space indent. New comments are lowercase and end in a fullstop
  (`macos.sh` keeps its upstream capitalised style, so leave it).
  NAS scripts share their SSH options via `scripts/nas.env` (`BatchMode=yes` so they fail fast).
- The LaunchAgent block in `symlink-setup.sh` is commented out on purpose, to keep NAS
  automation off work/shared machines. Leave it that way.

## Secrets

Public repo. Never commit tokens, keys, hostnames-with-credentials or personal paths outside
`$HOME`. Secrets go in 1Password (SSH agent) or untracked local files (`~/.extra.fish`,
`~/.gitconfig.local`). Don't read or print `.npmrc` or anything under `1Password/` beyond
what a task needs.
