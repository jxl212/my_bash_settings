# Set no limit for history file size
HISTFILESIZE=-1
HISTSIZE=-1

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$"\n"}history -a; history -c; history -r"


#color man pages (really the output of less)
export LESS_TERMCAP_mb=$'\E[01;36m' # enter blinking mode
export LESS_TERMCAP_md=$'\E[01;35m' # enter double-bright mode
export LESS_TERMCAP_me=$'\E[0m' # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$'\E[0m' # leave standout mode
export LESS_TERMCAP_so=$'\E[01;33m' # enter standout mode
export LESS_TERMCAP_ue=$'\E[0m' # leave underline mode
export LESS_TERMCAP_us=$'\E[0;32m' # enter underline mode

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
