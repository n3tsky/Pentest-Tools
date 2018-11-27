########################################
# WEB
########################################
function f_install_tools_web() {
  prefix="$directory/web"
  f_print "\n[*] Install web tools ($prefix)"

  # Burp
  f_dl_wget "Burp (free)" "$URL_BURP" "$prefix/burp.jar"

  # reGeorg
  f_dl_git "reGeorg" "$GIT_REGEORG" "$prefix/reGeorg"

  # Tunna
  f_dl_git "Tunna" "$GIT_TUNA" "$prefix/tunna"

  # SQLMap
  f_dl_git "SQLMap" "$GIT_SQLMAP" "$prefix/sqlmap"

  # WFuzz
  f_dl_git "WFuzz" "$GIT_WFUZZ" "$prefix/wfuzz"

  # Loubia
  f_dl_git "Loubia" "$GIT_LOUBIA" "$prefix/loubia"

  # Dirbuster
  f_dl_wget "Dirbuster" "$URL_DIRBUSTER" "$prefix/dirbuster-0.12.tar.bz2"
  $TAR -xf "$prefix/dirbuster-0.12.tar.bz2" -C "$prefix"
  $RM "$prefix/dirbuster-0.12.tar.bz2"

  # Spartan
  f_dl_git "Spartan" "$GIT_SPARTAN" "$prefix/spartan"
  f_install_pipenv "$prefix/spartan" "requirements.txt"
  #f_install "requirements" "$prefix/spartan/requirements.txt"

  # SoapUI
  f_dl_wget "SoapUI" "$URL_SOAPUI" "$prefix/soapUI.sh"

  f_print "\n[*] Install web tools - done" "ok"
}
