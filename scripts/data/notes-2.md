# UNIX/Linux Mastery: Sheet 2 (Advanced Logic & System Internals)

## 1. Advanced Networking Tools
- `ping -c 5 google.com`: Limit pings to 5 (prevents infinite loop in scripts).
- `netstat -tulpn` or `ss -tulpn`: See all listening ports and which PID is using them.
- `curl -I [url]`: Fetch only the HTTP header (great for checking if a site is up).
- `nc -zv [ip] [port]`: (Netcat) Check if a specific port is open on a remote server.
- `ip addr show`: Modern replacement for `ifconfig` to check local IP.

---

## 2. Text Processing "The Big Three" (grep, sed, awk)
- **grep**: Searching text.
    - `grep -r "pattern" .`: Recursive search in current directory.
    - `grep -v "pattern"`: Invert match (show lines that DON'T contain pattern).
- **sed**: Stream Editor (Search and Replace).
    - `sed -i 's/old/new/g' file.txt`: Replace 'old' with 'new' globally and save in-place.
- **awk**: Column processing.
    - `awk '{print $1, $3}' file.txt`: Print only the 1st and 3rd columns of a file.
    - `ls -l | awk '{sum += $5} END {print sum}'`: Calculate total byte size of files in a list.

---

## 3. Advanced Bash Logic & Flow
- **Exit Codes**: Every command returns a code (0 = success, 1-255 = error).
    - `echo $?`: Check the exit code of the last command run.
- **Short-circuiting**:
    - `[cmd1] && [cmd2]`: Run cmd2 ONLY if cmd1 succeeded.
    - `[cmd1] || [cmd2]`: Run cmd2 ONLY if cmd1 failed.
- **Case Statements**: Cleaner than long `if/elif` chains.
    ```bash
    case "$VAR" in
        "start") systemctl start docker ;;
        "stop")  systemctl stop docker ;;
        *) echo "Invalid option" ;;
    esac
    ```

---

## 4. Environment & Shell Startup
- **PATH**: The list of directories the shell searches for commands.
    - `export PATH=$PATH:/new/custom/path`: Add to your path temporarily.
- **Startup Files**:
    - `.bash_profile` / `.zshrc`: Where to put `alias` and `export` commands.
- **source /path/to/file**: Executes a file in the *current* shell (used to refresh config without restarting).

---

## 5. Disk Usage & Performance
- `df -h`: "Disk Free" - check remaining space on all mounted drives in GB/MB.
- `du -sh *`: "Disk Usage" - check the size of every folder in current directory.
- `top` or `htop`: Real-time process and resource monitoring.
- `ps aux | grep [name]`: Find the Process ID (PID) of a specific running program.
- `kill -9 [PID]`: Force-kill a stuck process (use `-15` first for a clean exit).

---

## 6. IO Redirection - Advanced
- **Heredoc (`<<`)**: Pass multiple lines of text to a command.
    ```bash
    cat << EOF > index.html
    <html>
    <body>Hello World</body>
    </html>
    EOF
    ```
- **Process Substitution**: Use the output of a command as if it were a file.
    - `diff <(ls folder1) <(ls folder2)`

---

## 7. The "Caveats" Wall of Shame (Don't Forget!)
- **Variable Quoting**: Always wrap variables in double quotes `"$VAR"` if they might contain spaces.
- **Shebang**: Always start scripts with `#!/bin/bash` or `#!/bin/zsh` to ensure the correct shell is used.
- **Hidden Files**: `ls` hides them; `find` sees them. Use `ls -a` to see `.hidden` files.
- **Case Sensitivity**: UNIX is case-sensitive. `File.txt` and `file.txt` are different.
- **Line Endings**: Files created on Windows (`\r\n`) can break scripts on UNIX (`\n`). Use `dos2unix` to fix.