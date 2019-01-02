########################################
# WRAP-UP
########################################

BASHRC="/home/$username/.bashrc"

function f_wrapup() {
  # Log
  f_script

  f_print "[*] Adding variables/functions to .bashrc ($BASHRC)"
  $ECHO "export PATH=\"/home/$username/bin\":$PATH" >> "$BASHRC" # Radare2
  $ECHO "alias tools=\"cd $directory\"" >> "$BASHRC" # Alias
}



function f_script() {
  f_print "[*] Adding function to log (through typecript)"
  $CAT << EOL >> $BASHRC
function log_typescript() {
  if [ -z "$LOG_SCRIPT" ]; then
    # fetch date
    date_ymd=\$($DATE "+%Y-%m-%d")
    date_hm=\$($DATE "+%H:%M")
    log_dir_name="/home/$username/.logs/audit/\$date_ymd"
    log_dir_file="\$log_dir_name/\$date_hm.log"

    # Create dir
    $MKDIR -p "\$log_dir_name"
    export LOG_SCRIPT="\$log_dir_file"
    # script -a: append,
    $SCRIPT -q -a "\$log_dir_file"
    unset LOG_SCRIPT

    $ECHO "[!] Input/Output are logged at \$log_dir_file"
  fi

  if [ ! -z "\$LOG_SCRIPT" ]; then
    PS1="\e[0;31m[script: on]\e[m $PS1"
    $ECHO "[!] Input/Output are logged at \$LOG_SCRIPT"
  fi
}

#log_typescript
EOL
}
