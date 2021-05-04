# Best Bash PS1 prompt
# Usage: source this file in your .bashrc.

# Color codes for easy prompt building
COLOR_DIVIDER="\[\e[30;1m\]"
COLOR_EXITCODE="\[\e[34;1m\]"
COLOR_USERNAME="\[\e[34;1m\]"
COLOR_USERHOSTAT="\[\e[34;1m\]"
COLOR_HOSTNAME="\[\e[34;1m\]"
COLOR_GITBRANCH="\[\e[33;1m\]"
COLOR_VENV="\[\e[33;1m\]"
COLOR_GREEN="\[\e[32;1m\]"
COLOR_RED='\[\e[0;31m\]'
COLOR_PATH_OK="\[\e[32;1m\]"
COLOR_PATH_ERR='\[\e[0;31m\]'
COLOR_NONE="\[\e[0m\]"

function set_bash_prompt () {
	# Change the path color based on return value.
	if [ "$?" -eq "0" ]; then
		EXITCODE="${COLOR_GREEN}0"
		PATH_COLOR="${COLOR_GREEN}"
	else
		EXITCODE="${COLOR_RED}$?"
		PATH_COLOR="${COLOR_RED}"
	fi
	# Set the PS1 to be "[workingdirectory:commandcount"
	PS1="${COLOR_DIVIDER}[${PATH_COLOR}\w${COLOR_DIVIDER}:${EXITCODE}${COLOR_DIVIDER}"
	# Add git branch portion of the prompt, this adds ":branchname"
	if ! git_loc="$(type -p "$git_command_name")" || [ -z "$git_loc" ]; then
		# Git is installed
		if [ -d .git ] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
			# Inside of a git repository
			GIT_BRANCH=$(git symbolic-ref --short HEAD)
			PS1="${PS1}:${COLOR_GITBRANCH}${GIT_BRANCH}${COLOR_DIVIDER}"
		fi
	fi
	# Add Python VirtualEnv portion of the prompt, this adds ":venvname"
	if ! test -z "$VIRTUAL_ENV" ; then
		PS1="${PS1}:${COLOR_VENV}`basename \"$VIRTUAL_ENV\"`${COLOR_DIVIDER}"
	fi
	# Close out the prompt, this adds "]\n[username@hostname] "
	PS1="${PS1}]\n${COLOR_DIVIDER}[${COLOR_USERNAME}\u${COLOR_USERHOSTAT}@${COLOR_HOSTNAME}\h${COLOR_DIVIDER}]${COLOR_NONE} "
}

# Tell Bash to run the above function for every prompt
PROMPT_COMMAND=set_bash_prompt
