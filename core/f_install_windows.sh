########################################
# WINDOWS
########################################
function f_install_tools_windows() {
  prefix="$directory/windows"
  f_print "\n[*] Install Windows-related tools ($prefix)"

  # Mimikatz
  f_dl_wget "Mimikatz" "$GITRELEASE_MIMIKATZ" "/tmp/mimikatz_trunk.7z"
  $ZZ x "/tmp/mimikatz_trunk.7z" -o"$prefix/mimikatz"
  $RM "/tmp/mimikatz_trunk.7z"
  # CME
  #$PIP install --user pipenv
  f_dl_git "CrackMapExec" "$GIT_CME" "$prefix/CrackMapExec" "--recursive"
  if [ "$install" == "true" ]; then
    #f_install "pip" "crackmapexec"
    # Do we need bleeding-edge? Yes!
    f_install_pipenv "$prefix/CrackMapExec" "requirements.txt" "setup.py"
    #cd "$prefix/CrackMapExec" && pipenv install -e .
    #cd "$directory/windows" # Get back
  fi


  # Nishang
  f_dl_git "Nishang" "$GIT_NISHANG" "$prefix/Nishang"
  # PowerSploit
  f_dl_git "PowerSploit" "$GIT_POWERSPLOIT" "$prefix/PowerSploit"
  # Empire
  f_dl_git "Empire" "$GIT_EMPIRE" "$prefix/Empire"

  # BloodHound
  # BloodHound - neo4j
  $WGET --quiet -O - "https://debian.neo4j.org/neotechnology.gpg.key" | $SUDO $APTKEY add -
  $ECHO "deb https://debian.neo4j.org/repo stable/" | $SUDO $TEE "/etc/apt/sources.list.d/neo4j.list"
  $SUDO $APT -qq update
  f_install "apt" "neo4j"

  # BloodHound - release binaries
  f_dl_wget "BloodHound" "$GITRELEASE_BLOODHOUND" "/tmp/BloodHound.zip"
  f_quiet_unzip_and_remove "/tmp/BloodHound.zip" "$prefix/"

  # Sysinternals
  f_dl_wget "Sysinternals" "$URL_SYSINTERNALS" "/tmp/sysinternals.zip"
  f_quiet_unzip_and_remove "/tmp/sysinternals.zip" "$prefix/sysinternals"

  f_print "\n[*] Install Windows-related tools - done" "ok"
}
