##################
###### Variables
##################
GREEN="\033[0;32m"
RED="\033[0;31m"
ORANGE="\033[0;33m"
NOCOLOR="\033[0m"

# Binaries
APT="/usr/bin/apt"
APTKEY="/usr/bin/apt-key"
CAT="/bin/cat"
CHMOD="/bin/chmod"
CP="/bin/cp"
CUT="/usr/bin/cut"
CURL="/usr/bin/curl"
DATE="/bin/date"
DPKG="/usr/bin/dpkg"
ECHO="/bin/echo"
GIT="/usr/bin/git"
GREP="/bin/grep"
LN="/bin/ln"
MAKE="/usr/bin/make"
MKDIR="/bin/mkdir"
PIP="pip" # as it might change during installation
PYTHON="/usr/bin/python"
PYTHON3="/usr/bin/python3"
RM="/bin/rm"
SCRIPT="/usr/bin/script"
SED="/bin/sed"
SUDO="/usr/bin/sudo"
TAR="/bin/tar"
TEE="/usr/bin/tee"
UNZIP="/usr/bin/unzip"
WGET="/usr/bin/wget"
WHEREIS="/usr/bin/whereis"
ZZ="/usr/bin/7z"

##################
###### Functions
##################

# Helper function
function f_help() {
  echo -e "\nUsage: $0 [-u username] [-d directory] [-i install] [-v verbose]"
  echo -e "\n\t -u: low-privs username (will be used to set functions/variables in .bashrc, define paths, etc.)"
  echo -e "\t -d: specify the location where all tools will be installed (default is: /home/\$user/Tools)"
  echo -e "\t -i: whether to install tools or just download them (will actually install all repo-related tools)"
  echo -e "\t -v: set verbosity on"
  echo -e "\n\t/!\ This script doesn't need (and not recommended) to be run as root (but you might be required to type in your password for privileged tasks - apt install, etc.)"
  exit 1
}

# Generic function to print stuff
function f_print() {
  # Something to print?
  if [ $# != 0 ]; then
    if [ $# == 1 ]; then
      # Just print the message
      echo -e "${NOCOLOR}$1${NOCOLOR}"
    else
      if [ $2 == "error" ]; then
        echo -e "${RED}$1${NOCOLOR}"
      elif [ $2 == "ok" ]; then
        echo -e "${GREEN}$1${NOCOLOR}"
      elif [ $2 == "warning" ]; then
        echo -e "${ORANGE}$1${NOCOLOR}"
      fi
    fi
  fi
}

# Install through git
function f_dl_git() {
  LABEL="$1"
  URL="$2"
  DEST="$3"
  OPTS="$4"

  f_print "\n\t[*] Installing $LABEL"
  cmd="$GIT clone $QUIET $OPTS $URL $DEST"
  f_print "\t[*] cmd: $cmd"
  $GIT clone $QUIET $OPTS "$URL" $DEST
  f_print "\t[*] Installed $LABEL - done" "ok"
}

# Install through wget
function f_dl_wget() {
  LABEL="$1"
  URL="$2"
  DEST="$3"
  OPTS="$4"

  f_print "\n\t[*] Installing $LABEL"
  cmd="$WGET $QUIET $URL $OPTS -O $DEST"
  f_print "\t[*] cmd: $cmd"
  $WGET $QUIET "$URL" $OPTS -O $DEST
  f_print "\t[*] Installed $LABEL - done" "ok"
}

# Unzip (quietly) and remove zip file afterwards
function f_quiet_unzip_and_remove() {
  FILE=$1
  DEST=$2

  $UNZIP -qq "$FILE" -d "$DEST"
  $RM "$FILE"
}

# Install tools
function f_install() {
  METHOD="$1"
  ARGS="$2"

  if [ "$install" == "true" ]; then
    if [ "$METHOD" == "apt" ]; then
      $SUDO $APT -qq -y install "$ARGS"
    elif [ "$METHOD" == "dpkg" ]; then
      $SUDO $DPKG -i "$ARGS"
    fi
  fi
}

function f_install_pipenv() {
  CURRENT_DIRECTORY="$1"
  REQUIREMENTS="$2"
  SETUP="$3"

  if [ "$install" == "true" ]; then
    cd "$CURRENT_DIRECTORY"

    if [ "$REQUIREMENTS" == "requirements.txt" ]; then
      pipenv install -r "$CURRENT_DIRECTORY/requirements.txt"
    fi

    if [ "$SETUP" == "setup.py" ]; then
      pipenv install -e .
    fi
    # Get back
    cd "${CURRENT_DIRECTORY%/*}"
  fi
}

function f_update_upgrade() {
  if [ "$install" == "$true" ]; then
    $SUDO $APT -qq update
    $SUDO $APT -qq -y upgrade
  fi
}

function f_check_installed() {
  PROGS="$1"
  for p in $PROGS; do
    # CHECK=$($DPKG -l | grep -i "$p")
    CHECK=$($WHEREIS "$p" | $CUT -d ':' -f2) # works for python packages
    if [ -z "$CHECK" ]; then
      f_print "[!] \"$p\" is missing, please install it.\nExiting..." "error"
      exit 1
    fi
  done
}

########################################
# Generic
########################################
function f_install_tools_XXX() {
  prefix="$directory/XXX"
  f_print "\n[*] Install XXX tools ($prefix)"

  # XXX

  f_print "\n[*] Install XXX tools - done" "ok"
}
