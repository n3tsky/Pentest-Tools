########################################
# FORENSIC
########################################
function f_install_tools_forensic() {
  prefix="$directory/forensic"
  f_print "\n[*] Install forensic tools ($prefix)"

  # Volatility
  f_dl_git "Volatility" "$GIT_VOLATILITY" "$prefix/Volatility"
  f_install_pipenv "$prefix/Volatility" "" "setup.py"

  f_print "\n[*] Install forensic tools - done" "ok"
}
