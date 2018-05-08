#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Some Other Env Values
#

# set Nodebrew Root to Brew
export NODEBREW_ROOT=/usr/local/var/nodebrew

# set Path for access to dashdb
export DYLD_LIBRARY_PATH=/Applications/dsdriver/lib
export DB2DSDRIVER_CFG_PATH=$HOME/.dsconfig

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /Applications/dsdriver/bin(N-/)
  /usr/local/{bin,sbin}
  $NODEBREW_ROOT/current/bin
  $HOME/.rbenv/bin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#
#
if [[ -z "$TMPDIR" ]]; then
  export TMPDIR="/tmp/zsh-$UID"
fi

if [[ ! -d "$TMPDIR" ]]; then
  mkdir "$TMPDIR"
  chmod 700 "$TMPDIR"
fi

eval "$(rbenv init -)"
