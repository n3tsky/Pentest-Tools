########################################
# PWCRACKING
########################################
function f_install_tools_pwcracking() {
  prefix="$directory/pwcracking"
  f_print "\n[*] Install password cracking tools ($prefix)"

  # JTR
  f_dl_git "JohnTheRipper" "$GIT_JTR" "$prefix/johnTheRipper-1.8.0-jumbo" "-b bleeding-jumbo"
  if [ "$install" == "true" ]; then
    current_dir=$(/bin/pwd)
    cd "$prefix/johnTheRipper-1.8.0-jumbo/src/" && ./configure > configure.result && $MAKE -s clean > make.result && $MAKE -sj4 >> make.result
    cd "$current_dir"
  fi

  # Hashcat
  f_dl_wget "Hashcat" "$URL_HASHCAT" "/tmp/hashcat.7z"
  $ZZ x "/tmp/hashcat.7z" -o"$prefix/"
  $RM "/tmp/hashcat.7z"

  # CUPP
  f_dl_git "CUPP" "$GIT_CUPP" "$prefix/cupp"

  f_print "\n[*] Install password cracking tools - done" "ok"
}
