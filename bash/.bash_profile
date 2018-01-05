# Add the PATH for new version of PHP
export PATH=/usr/local/php5/bin:$PATH

# General aliases
alias ls="ls -G"
alias please="sudo"
alias reload_profile=". ~/.bash_profile"

# Git aliases
alias gits="git status"
alias gitaa="git add ."
alias gita="git add"
alias gitc="git commit -am"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Disable and enable internal keyboard on Mac OS
alias nokey="sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"
alias yeskey="sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"

# Docker aliases
alias drush-d="docker-compose run --rm --user $(id -u):$(id -g)  --workdir '/var/www/html/web' drush"
alias node-d="docker-compose run --rm node"
composer-d () {
  tty=
  tty -s && tty=--tty
  docker run \
    $tty \
    --interactive \
    --rm \
    --user $(id -u):$(id -g) \
    --volume ${HOME}/.ssh/known_hosts:/etc/ssh/ssh_known_hosts:ro \
    --volume $SSH_AUTH_SOCK:/ssh-auth.sock \
    --volume /etc/passwd:/etc/passwd:ro \
    --volume /etc/group:/etc/group:ro \
    --volume $(pwd):/app \
    --env SSH_AUTH_SOCK=/ssh-auth.sock \
    --dns=10.1.2.33 \
    composer "$@"
}

# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

# Check Git branch
parse_git_branch () {
  if git rev-parse --git-dir >/dev/null 2>&1
  then
    echo -e "{ \033[33m"$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')"\033[0m }"
  else
   echo ""
  fi
}

# Prompt modification
export PS1="$FMAG\n\t$RS::$FRED\u$RS { $FBLE\w$RS } \$(parse_git_branch)\n↳  \$ "