# DNSCrypt Proxy

> Secure DNS resolution using Cloudflare DNS servers with automatic configuration.
> Provides encrypted DNS queries for all system requests.

## 📁 Files

- `dnscrypt-proxy.toml`: Main configuration file (specifies Cloudflare DNS)
- `system.dnscrypt-proxy.plist.template`: Template for LaunchDaemon (system-wide service)
- `install.sh`: Script to install DNSCrypt as a system service (requires sudo)
- `README.md`: This documentation file

> ⚠️ DNSCrypt automatically downloads resolver lists (`public-resolvers.md` and `relays.md`) and their signature files to system directories

## 👋🏼 Getting started

The `install.sh` script handles:

1. Creating necessary system directories
2. Dynamically generating the LaunchDaemon plist file with correct paths based on:
   - Current Homebrew prefix (different between Intel and Apple Silicon Macs)
   - Current location of the dotfiles repository
3. Saving the generated plist file to `/Library/LaunchDaemons/system.dnscrypt-proxy.plist`
4. Setting up the LaunchDaemon to run on startup with root privileges
5. Configuring dnscrypt-proxy to use standard DNS port 53

To install DNSCrypt as a system service:

```shell
./dnscrypt-proxy/install.sh
```

## 🚀 Usage

### 🔧 Configuring macOS to use the local resolver

To use dnscrypt-proxy for all DNS lookups:

1. Open **System Settings** > **Network** > [Your active connection] > **Details**
2. Select **DNS** and add `127.0.0.1` as your DNS server
3. Remove any other DNS servers from the list
4. Click **OK** to apply changes

Your system is now using encrypted DNS for all lookups!

### 🧪 Testing the DNS resolver

```shell
dig @127.0.0.1 google.com
```

### ⤴️ Updating the configuration

If you want to change DNS providers or other settings:

1. Edit `dnscrypt-proxy.toml`
2. Reload the system service:
   ```shell
   sudo launchctl unload /Library/LaunchDaemons/system.dnscrypt-proxy.plist
   sudo launchctl load -w /Library/LaunchDaemons/system.dnscrypt-proxy.plist
   ```

If you need to modify the LaunchDaemon template:

1. Edit `system.dnscrypt-proxy.plist.template`
2. Run the install script to regenerate the plist file:
   ```shell
   ./dnscrypt-proxy/install.sh
   ```
