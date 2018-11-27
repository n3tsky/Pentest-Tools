########################################
# MOBILE
########################################
function f_install_tools_mobile() {
  prefix="$directory/mobile"
  f_print "\n[*] Install mobile tools ($prefix)"

  # JD-GUI
  f_dl_wget "JD-GUI" "$GIT_JDGUI" "$prefix/jd-gui.jar"

  # Dex2Jar
  f_dl_wget "DEX2JAR" "$URL_DEX2JAR" "/tmp/dex2jar.zip"
  f_quiet_unzip_and_remove "/tmp/dex2jar.zip" "$prefix/dex2jar"

  f_print "\n[*] Install mobile tools - done" "ok"
}
