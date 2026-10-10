# path management.
if test -d /opt/homebrew
  # apple silicon.
  fish_add_path "/opt/homebrew/bin"
  fish_add_path "/opt/homebrew/sbin"
  fish_add_path "/opt/homebrew/opt/make/libexec/gnubin"
else
  # intel.
  fish_add_path "/usr/local/sbin"
  fish_add_path "/usr/local/opt/curl/bin"
  fish_add_path "/usr/local/opt/make/libexec/gnubin"
end
