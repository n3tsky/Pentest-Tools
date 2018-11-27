########################################
# RECON
########################################
function f_install_tools_recon() {
  prefix="$directory/recon"
  f_print "\n[*] Install recon tools ($prefix)"

  # Sublist3r
  f_dl_git "Sublist3r" "$GIT_SUBLIST3R" "$prefix/sublist3r"
  f_install_pipenv "$prefix/sublist3r" "requirements.txt" "setup.py"

  # theHarvester
  f_dl_git "TheHarvester" "$GIT_THEHARVESTER" "$prefix/theHarvester"
  f_install_pipenv "$prefix/theHarvester" "requirements.txt"

  f_print "\n[*] Install reco tools - done" "ok"
}
