
> 
> # Notes: 
>

| Syntax       | Meaning                       
| ------------ | ----------------------------- 
| `$(command)` | run command and return output - new subshell 
| `(commands)` | run commands in subshell      
| `$((math))`  | arithmetic calculation        
| `(a b c)`    | array     my_list=("a" "v" "d") echo ${my_list[0]}                    
| `{1..10}`    | spread operator like 



```08.04```
###  file descriptors 
0 1 2
###  crontab 0-e or 0l
* * 8-9 4 * echo "----$(date)----" >> /Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/exercises/out.log && /Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/exercises/multiple-ping-test.sh >> /Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/exercises/out.log 2 >> /Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/exercises/cron-err.log
  

###  create file with old timestamp
touch -d -- to create files with old timestamp

find . -mtime +90 -exec ls -l {} \; -- in exec command - {} is the placeholder from previous command every file discovered , and \ before ; is to escape it.

###  creates more files
for file in {1..10}; do touch -d "2025-12-11T02:02:12" $file; done

###  Backup - 
tar -cvf ../data/bckup.tar ~/Documents/Dee/code/shell-docker-lab/
###  compress backup tar using gunzip
gzip ../data/bckup.tar 

###  find and delete files
find /Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/exercises/ -name "*.log" -exec rm {} \;

> `find` is much better for scripting than `ls`, as ls has some inbuilt behaviour for printing and give much more output

### faster way to read files in a directory

for DIR in *.sh; do echo $DIR; done
or, for DIR in *; do echo $DIR; done


`last` command


### logger utility
logger -t error "custom error message" # to send error message to /var/log/message on linux
tail -fn0 file_name # to read only new lines


git ls-files | grep notes # nice command to see what git sees


nohup command &


<!-- remove headers in an output -->
inactive_users=`lastlog | tail -n+2` # tail -n+2 removes headers