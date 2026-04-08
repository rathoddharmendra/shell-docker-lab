This is a comprehensive, raw Markdown "Master Sheet" designed for high-density revision. It covers everything from the syntax quirks we discussed to advanced redirection and process logic.

```markdown
# UNIX/Linux Mastery Revision Sheet

## 1. Syntax & Operators
| Syntax           | Meaning                                                                 |
| :--------------- | :---------------------------------------------------------------------- |
| `$(command)`     | **Command Substitution**: Runs command, returns output (preferred over `` ` ``). |
| `(commands)`     | **Subshell**: Commands run in a separate process; variables don't persist. |
| `${var}`         | **Variable Expansion**: Safest way to reference variables (e.g., `${name}_file`). |
| `$((math))`      | **Arithmetic**: Integer math (e.g., `echo $((count + 1))`).               |
| `(a b c)`        | **Array**: `list=("a" "b")`; access with `${list[0]}`; all with `${list[@]}`. |
| `{1..10}`        | **Brace Expansion**: Generates ranges/sequences BEFORE variables expand.   |
| `!!`             | **History**: Repeat the last command.                                   |
| `!$`             | **History**: Grab the last argument of the previous command.            |

---

## 2. File Descriptors & Redirection (0, 1, 2)
* `0`: **stdin** (Standard Input)
* `1`: **stdout** (Standard Output)
* `2`: **stderr** (Standard Error)

**Redirection Caveats:**
* `> file`: Overwrite file with stdout.
* `>> file`: Append stdout to file.
* `2> file`: Redirect only errors.
* `&> file`: Redirect BOTH stdout and stderr to the same file.
* `2>&1`: Send stderr to wherever stdout is currently going.
* `/dev/null`: The "black hole"—send output here to silence it (`command > /dev/null 2>&1`).

---

## 3. Power Tools: `find` vs `ls`
> **Crucial Rule:** Never parse `ls` in a script. It handles spaces and special characters poorly. Always use `find` or globs (`*.sh`).

### Find Execution Patterns:
* **The Semicolon (`\;`)**: `find . -name "*.log" -exec rm {} \;` 
    * Runs the command **once per file**. Slower, but precise.
* **The Plus (`+`)**: `find . -name "*.log" -exec rm {} +` 
    * Runs the command **once for all files** (batched). Massive performance boost.
* **Timestamp Search**:
    * `-mtime +30`: Modified > 30 days ago.
    * `-mtime -7`: Modified within the last 7 days.
    * `-atime`: Access time; `-ctime`: Metadata change time.

---

## 4. Shell Parameter Expansion (The "Scissors")
Use these to manipulate strings without calling `sed` or `awk`.

* **Suffix Removal (`%`)**: `${var%.*} `
    * Trims shortest match from the **Right**. 
    * *Memory Trick:* `%` is on the right of the keyboard.
* **Prefix Removal (`#`)**: `${var#*/}` 
    * Trims shortest match from the **Left**. 
    * *Memory Trick:* `#` is on the left of the keyboard.
* **Default Values**: `${var:-"default"}` 
    * If `$var` is empty, use "default" for this command only.

---

## 5. Permissions & Security
* **Chmod Octal**: `755` (rwxr-xr-x), `644` (rw-r--r--), `600` (rw-------).
* **SSH Key Safety**: Private keys (`.key` or `.pem`) **must** be `600` or SSH will reject them.
    * `chmod 600 ~/.ssh/my_key`
* **SCP with Key**: `scp -i [key] [source] [user]@[ip]:[dest]`

---

## 6. Process Management & Job Control
* `CTRL + C`: Interrupt/Kill (SIGINT).
* `CTRL + Z`: Suspend (SIGSTOP).
* `jobs`: List suspended/background tasks.
* `bg %1`: Move job #1 to background.
* `fg %1`: Move job #1 to foreground.
* `nohup [cmd] &`: Run command that persists even if you logout.

---

## 7. Crontab Mastery
**Format**: `Min Hour Day Month DoW [Command]`
* `0 * * * *`: Every hour on the dot.
* `*/15 * * * *`: Every 15 minutes.
* `0 0 * * 1`: Every Monday at midnight.
* **Caveat**: Cron has a limited environment path. Always use **absolute paths** for commands (e.g., `/usr/local/bin/python3` instead of `python3`).

---

## 8. Backup & Archiving
* **Tar (Tape Archive)**: `tar -cvf archive.tar /folder`
    * `c`: Create, `v`: Verbose, `f`: File.
* **Compression**: `gzip archive.tar` (results in `.tar.gz`).
* **The One-Liner**: `tar -czvf archive.tar.gz /folder` (`z` handles the compression in one step).

---

## 9. Conditionals (The `[[ ]]` advantage)
Always use `[[ ]]` instead of `[ ]` in Bash/Zsh; it handles empty variables and strings more safely.

* `-f`: Is a file.
* `-d`: Is a directory.
* `-z`: String is empty.
* `-n`: String is NOT empty.
* `&&`: AND; `||`: OR.
```