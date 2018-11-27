########################################
# NETWORK
########################################
function f_install_tools_network() {
  prefix="$directory/network"
  f_print "\n[*] Install network tools ($prefix)"

  # testSSL
  f_dl_git "TestSSL" "$GIT_TESTSSL" "$prefix/testSSL" "--depth 1"
  # Enum4Linux
  f_dl_git "Enum4Linux" "$GIT_ENUM4LINUX" "$prefix/enum4linux"
  # Responder
  f_dl_git "Responder" "$GIT_RESPONDER" "$prefix/responder"
  # impacket
  f_dl_git "Impacket" "$GIT_IMPACKET" "$prefix/impacket"
  f_install_pipenv "$prefix/impacket" "requirements.txt" "setup.py"
  #f_install "requirements" "$prefix/impacket/requirements.txt"
  #f_install "setup" "$prefix/impacket/setup.py"

  f_print "\n[*] Install network tools - done" "ok"
}
