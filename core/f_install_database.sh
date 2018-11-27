########################################
# DATABASE
########################################
function f_install_tools_database() {
  prefix="$directory/database"
  f_print "\n[*] Install database tools ($prefix)"

  # DbVis
  f_dl_wget "DbVis" "$URL_DBVIS" "$prefix/dbvis.deb"
  f_install "dpkg" "$prefix/dbvis.deb"
  #$RM "/tmp/dbvis.deb"
  # Odat
  f_dl_git "Odat" "$GIT_ODAT" "$prefix/odat"
  # MSdat
  f_dl_git "MSdat" "$GIT_MSDAT" "$prefix/msdat"

  f_print "\n[*] Install database tools - done" "ok"
}
