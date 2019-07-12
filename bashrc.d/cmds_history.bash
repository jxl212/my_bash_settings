# Set no limit for history file size
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# Do not store a duplicate of the last entered command
export HISTCONTROL=ignoreboth
# ignore clear, ls, exit
export HISTIGNORE='&:clear:ls:exit:[ t\]*'

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$"\n"}history -a; history -c; history -r"

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
