# dotfiles

> Personal configurations for macOS, fish, iTerm2 and more.
> Includes `.macos` — sensible defaults for macOS, and automatic encrypted DNS setup with dnscrypt-proxy.

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

### Copilot

Install the GitHub CLI and then the Copilot extension:

```shell
gh extension install github/gh-copilot
```

### NAS Helper Commands

These fish functions and aliases provide quick helpers for Plex and NAS maintenance:

- `plex-restart`
  Restarts Plex Media Server on the Synology NAS, shows a macOS notification, and then runs `plex-status`.

- `plex-status`
  Checks whether Plex is running on the NAS and shows the last logged restart time.

- `nas-cleanup`
  Cleans up leftover `.smbdelete*` files and empty directories under `/volume2/Media/Movies` and `/volume2/Media/Series`.
  Supports `--list` for a dry run.

- `nas-auto-cleanup`
  Runs automatically every hour via a LaunchAgent. Results can be checked in:
  - `/tmp/nas-auto-cleanup.out` (stdout)
  - `/tmp/nas-auto-cleanup.err` (stderr)

The LaunchAgent is automatically symlinked and loaded by the bootstrap script in this repo.

### DNSCrypt Proxy (disabled for Apple Silicon)

Automatic setup of encrypted DNS using dnscrypt-proxy with Cloudflare DNS servers for enhanced privacy and security.

See [dnscrypt-proxy/README.md](dnscrypt-proxy/README.md) for detailed configuration and usage information.

## ⬆️ Updating

If you just need to update the symlinks:

```shell
git pull origin develop
./symlink-setup.sh
```

## 🙏 Thanks to people I've grabbed stuff from

- [holman/dotfiles](https://github.com/holman/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)
- [kentcdodds/dotfiles](https://github.com/kentcdodds/dotfiles)
- [github/gitignore](https://github.com/github/gitignore)
