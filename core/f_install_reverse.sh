########################################
# REVERSE
########################################
function f_install_tools_reverse() {
  prefix="$directory/reverse"
  f_print "\n[*] Install reverse tools ($prefix)"

  # OllyDBG
  f_dl_wget "OllyDBG" "$URL_OLLY" "/tmp/olly.zip"
  f_quiet_unzip_and_remove "/tmp/olly.zip" "$prefix/ollyDBG2"
  # Immunity
  token="$($CURL -s "https://debugger.immunityinc.com/ID_register.py" | $GREP -i csrfmiddlewaretoken | $SED "s/.*value='\([^ ]*\)'.*/\1/")"
  hash="$($CURL -s -d "address=a&company=a&csrfmiddlewaretoken=$token&email=a@a.com&fullname=a" -H "Referer: https://debugger.immunityinc.com/ID_register.py" -b "csrftoken=$token" "https://debugger.immunityinc.com/ID_register.py" | $GREP ID | $SED "s/.*hash=\([^ ]*\)><.*/\1/")"
  f_dl_wget "ImmunityDebugger" "https://debugger.immunityinc.com/getID.py?hash=$hash" "$prefix/immunityDebugger.exe"

  # IDA Pro
  f_dl_wget "IDAPro" "$URL_IDA" "$prefix/ida_free.run"
  # Radare2
  f_dl_git "Radare2" "$GIT_RADARE2" "$prefix/radare2"
  $prefix/radare2/sys/user.sh &>>"$prefix/radare2/install.log"

  # Hopper - Free
  f_dl_wget "Hopper" "$URL_HOPPER" "$prefix/hopper.deb"
  f_install "dpkg" "$prefix/hopper.deb"

  f_print "\n[*] Install reverse tools - done" "ok"
}
