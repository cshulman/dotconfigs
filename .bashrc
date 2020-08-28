# .bashrc

# ======================
# Init environment
# ======================
# Check for an Interactive Session
[ -z "PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Set up Bash Git Prompt
#if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
#  GIT_PROMPT_THEME=Evermeet
#  GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=1
#  GIT_PROMPT_ONLY_IN_REPO=0
#  source "$HOME/.bash-git-prompt/gitprompt.sh"
#fi


# Set colors for bash (pretty!!)
if [ -f ~/.bash_colors ]; then
  . ~/.bash_colors
fi

# If support 256 color terminal then DO IT...
/usr/bin/dircolors --p|grep -E xterm-256color > /dev/null
if [ $? -eq 0 ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

case $(uname -s) in
Linux|SunOS)
  eval `dircolors ~/.trapd00r_colors`
  ;;
esac

#PS1='[\[\033[00;32m\]\u@\h\[\033[00;31m\]:$(date +%H%M) \[\033[00;35m\]\W\[\033[00m\]]\$ '

# Show git branch name
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]|$(date +%H:%M)$(parse_git_branch)\[\033[00m\]\$ '

# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]|$(date +%H:%M) \[\033[00;35m\]\W\[\033[00m\]$(parse_git_branch)\[\033[00m\]\$ '

else
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w|$(date +%H:%M) $(parse_git_branch)\$ '

# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$|$(date +%H:%M) \[\033[00;35m\]\W\[\033[00m\](parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt


# =====================
# Shell Variables
# =====================
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HOSTFILE=$HOME/.hosts    # Put a list of remote hosts in ~/.hosts
export EDITOR=vim
export GREP_COLOR="1;32"
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=ignoredups
export HISTIGNORE="&:bg:fg:ll:h"
export PAGER=less
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'


# =====================
# Config Options
# =====================
shopt -s histappend     # Append to history rather than overwrite
shopt -s cdspell        # Correct spelling in cd command
shopt -s checkwinsize
shopt -s cdable_vars
shopt -s checkhash
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob       # Necessary for programmable completion.


# =====================
# Functions
# =====================
# Returns system load as percentage, i.e., '40' rather than '0.40)'.
function load()
{
  local SYSLOAD=$(cut -d " " -f1 /proc/loadavg | tr -d '.')
  echo $((10#$SYSLOAD))       # Convert to decimal.
}


# ====================
# Aliases
# ====================
alias df='df -h'
alias ls='ls -pFHh --color=auto'
alias ll='ls -lsh'
alias lla='ls -la'
alias la='ls -A'
alias lt='ls -ltrhs'
alias l='ls -CFlhs'
alias ps='ps o user,pid,psr,%cpu,%mem,args axf --cols 120'
alias grep='grep --color=auto'
alias rsync='rsync -ravz --progress'
alias yum='sudo yum -y'
alias dnf='sudo dnf -y'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -pv'
alias which='type -a'
alias ..='cd ..'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias more='less'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias vi='vim'

# Openshift Stuff
alias events="oc get events --sort-by='{.lastTimestamp}'"

# Ansible Stuff
alias ansible-syntax='ansible-playbook --syntax-check'


export GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin

PATH=$PATH:~/bin

