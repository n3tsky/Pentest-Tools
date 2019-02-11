########################################
# RFID
########################################
function f_install_tools_RFID() {
  prefix="$directory/RFID"
  f_print "\n[*] Install RFID tools ($prefix)"

  # Proxmark
  f_dl_git "Proxmarkv3" "$GIT_PROXMARK" "$prefix/proxmark3"

  if [ "$install" == "true" ]; then
    $CD "$prefix/proxmark3"
    # Add UDEV rules
    $SUDO $CP -rf "driver/77-mm-usb-device-blacklist.rules" "/etc/udev/rules.d/77-mm-usb-device-blacklist.rules"
    $SUDO udevadm control --reload-rules # Reload
    $SUDO adduser $username dialout # Add user to group

    # Build
    $CD "client"
    $MAKE clean > "install.log" && $MAKE all >> "install.log"
    $CD "$prefix"
  fi

  f_print "\n[*] Install RFID tools - done" "ok"
}
