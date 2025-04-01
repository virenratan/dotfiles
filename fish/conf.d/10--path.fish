# path management.
if test (uname -m) = "arm64"
  # apple silicon.
  fish_add_path "/opt/homebrew/bin"
  fish_add_path "/opt/homebrew/sbin"
else
  # intel.
  fish_add_path "/usr/local/sbin"
  fish_add_path "/usr/local/opt/curl/bin"
end

fish_add_path "/usr/local/opt/make/libexec/gnubin"
