function __fish_seen_subcommand_from --argument-names cmd
    __fish_seen_argument --allow-empty -c $cmd
end

function __fish_use_subcommand
    __fish_seen_argument --allow-empty -c
end
