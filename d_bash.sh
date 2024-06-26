# Enhanced History Settings
HISTSIZE=50000                             # Increase command history size
HISTFILESIZE=100000                        # Increase history file size
HISTCONTROL=ignoreboth:erasedups           # Ignore duplicates, both for commands starting with space and duplicates
shopt -s histappend                        # Append to history, don't overwrite it
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"  # Save and reload history

# Check the window size after each command and update LINES and COLUMNS.
shopt -s checkwinsize

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'                       # Colorize ls output
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
fi

# File and Directory Management Aliases
alias ll='ls -lAhrt'                                  # Long list, show hidden
alias la='ls -A'
alias l='ls -CF'

# Navigation Aliases
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'

# Colorful Prompt Aliases
alias prompt_default="PS1='\[\e[0;32m\]\u@\h \[\e[0;36m\]\w\[\e[0m\] \$ '"  # Green user@host, cyan working directory
alias prompt_simple="PS1='\w \$ '"                                        # Just the working directory
alias prompt_git="PS1='\[\e[0;32m\]\u@\h\[\e[0;33m\] \w\[\e[0;35m\] \$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\[\e[0m\] \$ '"  # Includes Git branch

# Misc Aliases
alias reload='. ~/.bashrc'                             # Reload .bashrc file
alias c='clear'                                        # Clear terminal display
alias path='echo -e ${PATH//:/\\n}'                    # Display PATH one entry per line
alias du='du -h'                                       # Disk usage in human readable format
alias df='df -h'                                       # Disk free space in human readable format

# Use Git command line with color output
git config --global color.ui auto

# Git Aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log'
alias gdiff='git diff'
alias gd=gdiff
alias gdno='gdiff --name-only'
alias gun='git ls-files --others --exclude-standard'
alias gw='git config --global user.name;git config --global user.email'
'

# Enhance Grep with color and better defaults
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Safe Operations
alias rm='rm -i'                                      # Prompt before removal
alias cp='cp -i'                                      # Prompt before overwrite
alias mv='mv -i'                                      # Prompt before overwrite

# Enable programmable completion features (you don't need to enable this if you're using Bash 4.2 or later, it's on by default)
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export dletter="${dletter:-"y"}"
export RPATH="${RPATH:-""}"
export DDRIVE="${DDRIVE:-$RPATH/$dletter}"
alias gitis='git config core.eol;git config core.autocrlf input'
alias hist='history'
alias his='hist'
alias hi='his'
alias gl10='gl -10'
alias cdh='cd ${DDRIVE}/hgall'

