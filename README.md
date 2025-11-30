# dotfiles

> Personal configurations for macOS, fish, iTerm2 and more.
> Includes `.macos` — sensible defaults for macOS, and automatic encrypted DNS setup with dnscrypt-proxy.

## Table of Contents

- [dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [👋 Getting started](#-getting-started)
    - [🤖 GitHub Copilot](#-github-copilot)
    - [🛜 NAS utility commands](#-nas-utility-commands)
    - [Additional setup](#additional-setup)
    - [🔐 DNSCrypt Proxy (disabled for Apple Silicon)](#-dnscrypt-proxy-disabled-for-apple-silicon)
  - [⬆️ Updating](#️-updating)

## 👋 Getting started

When running on a fresh machine:

- Sign into iCloud
- Install Homebrew:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Install Google Chrome and 1Password:

```shell
brew install google-chrome 1password
```

- Enable the SSH Agent in 1Password and ensure the "Generate SSH config file with bookmarked hosts" is enabled. The rest of the ssh config should sync from iCloud or be symlinked by this repo.
- Create a `~/Projects` directory

```shell
mkdir Projects && cd Projects
```

- Run the following:

```shell
git clone git@github.com:virenratan/dotfiles.git && cd dotfiles && ./initial-setup.sh
```

### 🤖 GitHub Copilot

Install the GitHub CLI and then the Copilot extension:

```shell
gh extension install github/gh-copilot
```

### 🛜 NAS utility commands

These fish functions and aliases provide quick helpers for Plex and NAS maintenance:

- `plex-restart`
  Restarts Plex Media Server on the Synology NAS, shows a macOS notification, and then runs `plex-status`.

- `plex-status`
  Checks whether Plex is running on the NAS and shows the last logged restart time.

- `nas-cleanup`
  Cleans up leftover `.smbdelete*` files and empty directories under `/volume2/Media`.
  Supports `--list` for a dry run.

- `nas-auto-cleanup (LaunchAgent)`
  Runs `nas-cleanup` automatically every hour via a LaunchAgent.
  Logs are written to:

  - `/tmp/nas-auto-cleanup.out` (stdout)
  - `/tmp/nas-auto-cleanup.err` (stderr)

- `nas-docker-remount`
  Checks if the NAS volumes are reachable and verifies that specific containers
  can still see their `/data/...` bind mounts. If not, the affected containers are restarted.
  Can be run manually via the alias.

- `nas-docker-remount (LaunchAgent)`
  Runs the remount check automatically every 5 minutes and on network changes via a LaunchAgent.
  Logs are written to:
  - `/tmp/nas-docker-remount.out` (stdout)
  - `/tmp/nas-docker-remount.err` (stderr)

> **Note:** By default, LaunchAgent symlinking is commented out in the bootstrap script.
> This prevents the jobs from running on work or shared machines. Uncomment the relevant
> block in `symlink-bootstrap.sh` if you want the automation to be active.

### Additional setup

- [AI control integration](https://github.com/virenratan/ai-instructions)

### 🔐 DNSCrypt Proxy (disabled for Apple Silicon)

Automatic setup of encrypted DNS using dnscrypt-proxy with Cloudflare DNS servers for enhanced privacy and security.

See [dnscrypt-proxy/README.md](dnscrypt-proxy/README.md) for detailed configuration and usage information.

## ⬆️ Updating

If you just need to update the symlinks:

```shell
git pull origin develop
./symlink-setup.sh
```
