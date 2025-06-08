#!/bin/bash

set -e  # exit on any error.

echo "🔒 Installing DNSCrypt Proxy as system service (requires sudo)"

# ensure we're in the dotfiles directory.
if [[ ! -d "$(pwd)/dnscrypt-proxy" ]]; then
    echo "❌ Please run this script from the root of the dotfiles repository"
    exit 1
fi

# check for sudo access.
if [[ $EUID -ne 0 ]]; then
    echo "🔑 This script requires root privileges to install the system service"
    echo "Please enter your password when prompted"
    sudo -v || { echo "❌ Failed to get sudo privileges"; exit 1; }

    # keep sudo access alive.
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done 2>/dev/null &
fi

echo "🔄 Stopping any existing dnscrypt-proxy services..."
launchctl unload ~/Library/LaunchAgents/local.dnscrypt-proxy.plist 2>/dev/null || true
sudo launchctl unload /Library/LaunchDaemons/system.dnscrypt-proxy.plist 2>/dev/null || true
brew services stop dnscrypt-proxy 2>/dev/null || true

HOMEBREW_PREFIX=$(brew --prefix)
DOTFILES_PATH=$(pwd)

echo "📁 Creating system directories..."
sudo mkdir -p /var/lib/dnscrypt-proxy /var/log

echo "🔧 Generating LaunchDaemon plist file..."
cat "$DOTFILES_PATH/dnscrypt-proxy/system.dnscrypt-proxy.plist.template" | \
    sed "s|{{HOMEBREW_PREFIX}}|$HOMEBREW_PREFIX|g" | \
    sed "s|{{DOTFILES_PATH}}|$DOTFILES_PATH|g" > /tmp/system.dnscrypt-proxy.plist

echo "📝 Installing LaunchDaemon..."
sudo cp /tmp/system.dnscrypt-proxy.plist /Library/LaunchDaemons/system.dnscrypt-proxy.plist
sudo chown root:wheel /Library/LaunchDaemons/system.dnscrypt-proxy.plist
sudo chmod 644 /Library/LaunchDaemons/system.dnscrypt-proxy.plist

echo "🚀 Starting DNSCrypt Proxy system service..."
sudo launchctl load -w /Library/LaunchDaemons/system.dnscrypt-proxy.plist

sleep 2
if pgrep -f "dnscrypt-proxy" > /dev/null; then
    echo "✅ DNSCrypt Proxy is running as system service on port 53"
    echo "🌐 You can now set 127.0.0.1 as your DNS server in macOS network settings"
else
    echo "❌ DNSCrypt Proxy service failed to start. Check logs:"
    echo "sudo cat /var/log/dnscrypt-proxy.err"
    exit 1
fi
