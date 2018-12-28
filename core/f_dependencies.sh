
# Install all required dependencies
function f_install_dependencies() {

  if [ "$install" == "true" ]; then

    f_print "\n[*] Doint update/upgrade\n"
    f_update_upgrade

    f_print "\n[*] The following dependencies will be installed\n"

    # Display list of dependencies
    for i in ${PKG[@]}; do echo $i; done
    f_print ""
    for i in ${PIP_PKG[@]}; do echo $i; done
    f_print ""

    # Ask user for confirmation
    while true; do
      read -p "Are you sure (y/n)? " -n 1 -r
      echo ""
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        break
      elif [[ $REPLY =~ ^[Nn]$ ]]; then
        f_print "Exiting..." "error"
        exit 1
      fi
    done

    f_print "\n[*] Installing dependencies\n"

    # Don't ask for user input
    $ECHO "wireshark-common wireshark-common/install-setuid boolean true" | $SUDO /usr/bin/debconf-set-selections

    # Install dependencies
    $SUDO $APT -qq -y install ${PKG[@]}
    $SUDO -H $PIP install $QUIET -U "pipenv"
    $PIP install $QUIET --user $PIP_PKG

    f_print "\n[*] Installing dependencies - done" "ok"
  else
    f_print "\n[*] Skipping dependencies" "ok"
  fi

  f_check_installed "pip pipenv python2.7 python3"
}
