#==============================================================================
# .bash_profile - last update 20131010
#==============================================================================

#------------------------------------------------------------------
# Get the aliases and functions
#------------------------------------------------------------------
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#------------------------------------------------------------------
# Linux logo
#------------------------------------------------------------------
[ -x /usr/bin/linux_logo ] && { echo; linux_logo -a -c -d -f -k -u -y;}

#------------------------------------------------------------------
# User specific environment and startup programs
#------------------------------------------------------------------
export PATH=$HOME/.local/bin:$PATH
export EDITOR=vim  # used at least by crontab -e
#export http_proxy='http://direct1.proxy.i2:8080'
#export https_proxy='http://direct1.proxy.i2:8080'

#------------------------------------------------------------------
# Defragmentation des bases sqlite de Firefox
#------------------------------------------------------------------
for f in ~/.mozilla/firefox/*/*.sqlite; do sqlite3 $f "VACUUM;" 2>/dev/null; done
