# sources a tool's generated init script from a cache instead of spawning the tool every shell.
# the cache is keyed on the resolved binary path, so a brew upgrade (new cellar path) regenerates it.
# usage: __source_cached_init starship init fish --print-full-init
function __source_cached_init
    set -l bin (path resolve (command -s $argv[1])); or return
    set -l cache $__fish_cache_dir/$argv[1]-init.fish
    set -l stamp "# $bin $argv[2..]"

    set -l first
    test -s $cache; and read first <$cache
    if test "$first" != "$stamp"
        mkdir -p $__fish_cache_dir
        begin
            echo $stamp
            command $argv
        end >$cache
    end

    source $cache
end
