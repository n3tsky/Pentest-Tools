########################################
# WORDLIST
########################################
function f_install_tools_wordlists() {
  prefix="$directory/wordlists"
  f_print "\n[*] Install wordlists ($prefix)"

  # FuzzDB
  f_dl_git "FuzzDB" "$GIT_FUZZDB" "$prefix/FuzzDB"
  # wfuzz
  $LN -s "$directory/web/wfuzz/wordlists" "$prefix/wfuzz"
  # SecLists
  f_dl_git "SecLists" "$GIT_SECLIST" "$prefix/SecLists"
  # ProbableWordlists
  f_dl_git "ProbableWordlists" "$GIT_PROBABLEWORDLIST" "$prefix/ProbableWordlists"
  # NaugthyStrings
  f_dl_git "NaugthyStrings" "$GIT_NAUGHTYSTRINGS" "$prefix/NaugthyStrings"

  f_print "\n[*] Install wordlists - done" "ok"
}
