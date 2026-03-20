# disable fish 4.x keyboard protocol (CSI u / kitty keyboard protocol).
# fish 4.1+ queries the terminal and enables enhanced key encoding, which
# causes interactive subprocesses to receive escape sequences (e.g. ^[[13u
# for Enter, ^[[99;5u for Ctrl+C) instead of normal keystrokes.
# disabling query-term reverts to standard terminal input handling.
#
# feature flags are read before conf.d, so this must be a universal variable.
# the line below is idempotent – it writes to fish_variables once and persists.
set -U fish_features no-query-term
