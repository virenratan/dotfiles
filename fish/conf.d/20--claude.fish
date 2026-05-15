# claude code environment config.
# mirrored in ~/.claude/settings.json -> ai-instructions/claude-code/settings.json
# keep the two in sync. use -gx (not -Ux) so this file stays the source.

# tasks tooling, /schedule, /loop. on by default in v2.1.16+; explicit as intent.
set -gx CLAUDE_CODE_ENABLE_TASKS true

# fork mode (v2.1.117+) — inherit-context subagents for parallel-approach forks.
# not the fresh-context validation mechanism. uncomment to opt in.
# set -gx CLAUDE_CODE_FORK_SUBAGENT 1

# disables /schedule and /loop running in the background. conflicts with
# CLAUDE_CODE_ENABLE_TASKS — uncomment only if you specifically want no
# background scheduling.
# set -gx CLAUDE_CODE_DISABLE_BACKGROUND_TASKS 1
