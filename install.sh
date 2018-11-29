#!/bin/bash
# The sole purpose of this script is not to bother installing tools (manually)
# each and every time...

username="$USER"
directory="/home/$username/Tools"
verbose="false" # true: display some more info
install="false" # false: download only, true: install dependencies + requirements + install

source "./core/functions.sh"

# Handle arguments
while getopts ":u:d:ivh" opt; do
  case $opt in
    u) username="$OPTARG" ;;
    d) directory="$OPTARG" ;;
    i) install=true ;;
    v) verbose=true ;;
    h) f_help ;;
    \?) $ECHO -e "\n[!] Invalid option -$OPTARG" >&2; f_help ;;
  esac
done

# Options
if [ "$verbose" == "false" ]; then
  QUIET="--quiet"
else
  QUIET=""
fi

# Quick failsafe
if [ -z "$username" ] || [ -z "$directory" ]; then
  f_help
fi

# Ask for user confirmation
while true; do
  f_print "\n[-] Tools will be installed @:$directory, with \"$username\" privileges (verbosity: \"$verbose\", install: \"$install\")" "ok"
  read -p "Are you sure? (y/Y) " -n 1 -r REPLY
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    break
  elif [[ $REPLY =~ ^[Nn]$ ]]; then
    f_print "Exiting..." "error"
    exit 1
  fi
done

# Source all files
source "apps.conf"
source "./core/f_dependencies.sh"
source "./core/f_install_network.sh"
source "./core/f_install_recon.sh"
source "./core/f_install_web.sh"
source "./core/f_install_windows.sh"
source "./core/f_install_pwcracking.sh"
source "./core/f_install_forensic.sh"
source "./core/f_install_wordlist.sh"
source "./core/f_install_database.sh"
source "./core/f_install_exploits.sh"
source "./core/f_install_reverse.sh"
source "./core/f_install_mobile.sh"
source "./core/f_install_RFID.sh"
source "./core/f_wrapup.sh"

########################################
# Main function
########################################

# Required dependencies
f_install_dependencies

# Creating some folders
f_print "\n[*] Creating some directories..." "ok"
$MKDIR -p "$directory"/{network,recon,web,windows,pwcracking,forensic,wordlists,database,exploits,reverse,mobile,RFID}

# Let's go
f_install_tools_network
f_install_tools_recon
f_install_tools_web
f_install_tools_windows
f_install_tools_pwcracking
f_install_tools_forensic
f_install_tools_wordlists
f_install_tools_database
f_install_tools_exploits
f_install_tools_reverse
#f_install_tools_thickClients
f_install_tools_mobile
f_install_tools_RFID
f_wrapup
