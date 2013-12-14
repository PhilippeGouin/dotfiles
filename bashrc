#==============================================================================
# .bashrc - last update 20131116
#==============================================================================

# -- source global definitions ------------------------------------------------
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# -- miscellaneous ------------------------------------------------------------
shopt -s globstar
alias mv='mv -i'
alias cp='cp -i'

# -- moving into and from directories -----------------------------------------
# do not forget j(ump) and 'cd -' !
cd () {
    case "$*" in
        '' )
            pushd $HOME > /dev/null
        ;;
        '...' )
            pushd '../..' > /dev/null
        ;;
        '....' )
            pushd '../../..' > /dev/null
        ;;
        '.....' )
            pushd '../../../..' > /dev/null
        ;;
        * )
            pushd "$*" > /dev/null
        ;;
    esac
}
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias '.....'='cd ../../../..'
alias p='pushd'
alias o='popd'
alias b='popd' #backward
alias d='dirs -v'
alias 1='pushd +1'
alias 2='pushd +2'
alias 3='pushd +3'
alias 4='pushd +4'
alias 5='pushd +5'
alias 6='pushd +6'
alias 7='pushd +7'
alias 8='pushd +8'
alias 9='pushd +9'

# -- ls -----------------------------------------------------------------------
# FIXME - does not work when arg contains a space
## extended_ls provides dot shortcuts to ls
#extended_ls () {
#    # DEBUG echo "args before=${@} - ${#} args"
#    local args=''
#    for arg in ${*}
#    do
#        # DEBUG echo "arg=${arg}"
#        case ${arg} in
#            '...' )
#                args="${args} ../.."
#            ;;
#            '....' )
#                args="${args} ../../.."
#            ;;
#            '.....' )
#                args="${args} ../../../.."
#            ;;
#            * )
#                args="${args} ${arg}"
#            ;;
#        esac
#    done
#    #DEBUG - echo "args after=${args}"
#    command ls --color=always ${args}
#}
## ls options shortcuts
#alias ls='extended_ls'
#alias lf='extended_ls -F'
#alias ll='extended_ls -l'
#alias lh='extended_ls -lh'
#alias la='extended_ls -la'
#alias lt='extended_ls -lrt'

# ls options shortcuts
alias ls='ls --color=always'
alias lf='ls -F'
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -la'
alias lt='ls -lrt'

# -- vim ----------------------------------------------------------------------
# we want to use gvim (vim-X11) with full options instead of vim
alias vim='gvim'
alias vi='gvim'
# vi for readline
set -o vi

# -- grep ---------------------------------------------------------------------
# TODO - --exclude-from=FILE
export GREP_OPTIONS='-nRI --color=always
 --exclude-dir=__pycache__ --exclude-dir=.nodeproject
 --exclude-dir=CVS --exclude-dir=SVN --exclude-dir=.git --exclude-dir=.hg
 --exclude-dir=backup
 --exclude=\*.tmp --exclude=\*~
'

# -- autojump -----------------------------------------------------------------
alias jumpstat='autojump --stat'

# -- some colors definition ---------------------------------------------------
# !! all non-printing character sequence must be enclosed in \[...\] !!

# -->> reset <<-------------------------
NC='\033[0m'  # reset all

# -->> regular colors <<----------------
#black='\033[0;30m'
red='\033[0;31m'
bold_red='\033[1;31m'
green='\033[0;32m'
yellow='\033[0;33m'
#blue='\033[0;34m'
purple='\033[0;35m'
#cyan='\033[0;36m'
white='\033[0;37m'
bold_white='\033[1;37m'

# -->> High intensty <<-----------------
#iblack='\033[0;90]'
#ired='\033[0;91m'
#igGreen='\033[0;92m'
#iyellow='\033[0;93m'
#iblue='\033[0;94m'
#ipurple='\033[0;95m'
#icyan='\033[0;96m'
#iwhite='\033[0;97m'

# -->> Composed colors <<---------------
# yellow_on_blue='\e[44;0;33m'  # 1 for bold
bold_yellow_on_blue='\e[44;1;33m'  # 1 for bold

# -- a cool prompt statement --------------------------------------------------
#users colors
if [ "$(id -u)" -eq 0 ]; then
    linecolor="\[${red}\]"
    usercolor="\[${red}\]"
else
    linecolor="\[${white}\]"
    usercolor="\[${yellow}\]"
fi
#right print time then go back at the beginning of the line
export PROMPT_COMMAND='autojump_add_to_database; printf "\n%${COLUMNS}s\r" "[$(date +%k:%M)]"'
#ps variables
PS1="${linecolor}┌─\[${white}\][${usercolor}\u\[${white}\]][\[${purple}\]\h\[${white}\]] \[${green}\]\w\[${white}\]\[${white}\]\n${linecolor}└──╼ \[${NC}\]"
PS2="╾──╼ "

#-- man in color with less ----------------------------------------------------
man() {
    env \
    LESS_TERMCAP_mb=$(printf ${red}) \
    LESS_TERMCAP_md=$(printf ${bold_white}) \
    LESS_TERMCAP_me=$(printf ${NC}) \
    LESS_TERMCAP_se=$(printf ${NC}) \
    LESS_TERMCAP_so=$(printf ${bold_yellow_on_blue}) \
    LESS_TERMCAP_ue=$(printf ${NC}) \
    LESS_TERMCAP_us=$(printf ${yellow}) \
    man "$@"
}
