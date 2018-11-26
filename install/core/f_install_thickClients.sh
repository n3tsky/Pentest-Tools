########################################
# thickClients
########################################
function f_install_tools_thickClients() {
  prefix="$directory/thickClients"
  f_print "\n[*] Install thickClients tools ($prefix)"

  # ProcessHacker
  f_dl_wget "ProcessHacker" "https://wj32.org/processhacker/rel/processhacker-2.39-bin.zip" "/tmp/processhacker.zip"
  f_quiet_unzip_and_remove "/tmp/processhacker.zip" "$prefix/processHacker"
  # EchoMirage
  f_dl_wget "EchoMirage" "https://kent.dl.sourceforge.net/project/echomirage.oldbutgold.p/Echo Mirage.zip" "/tmp/echomirage.zip"
  f_quiet_unzip_and_remove "/tmp/echomirage.zip" "$prefix/echoMirage"
  # Sysinternals
  $LN -s "$directory/Tools/windows/sysinternals" "$prefix/sysinternals"

  f_print "\n[*] Install thickClients tools - done" "ok"
}
