#!/bin/bash

# -------------------------------------------------
# Allows to bootstrap scripts 
# 
# Parameters:
#    1. Uses first parameter to use as filename
#    2. [optional] Uses second parameter to add a description to the script
# 
# Sample output:
    ############################################################
    #!/bin/bash
    # Author: Dee
    # Date: Sat Apr 11 12:02:55 CEST 2026
    # Description: 
    ############################################################
# -------------------------------------------------

FILENAME=$1.sh
DESCRIPTION=${2:-"No description provided."} # Default value if user doesn't pass description
# DEFAULT_FOLDER_PATH='/Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/exercises'
AUTHOR='Dee'

# cd $DEFAULT_FOLDER_PATH

# Check if filename was provided
if [ -z "$1" ]; then
    echo "❌ Error: Please provide a filename (without extension)."
    echo "Usage: ./bootstrap.sh <filename> [description]"
    exit 1
fi

# MAIN Bootstraping
# echo '############################################################' >> $FILENAME
# echo '#!/bin/bash' >> $FILENAME
# echo "# Author: $AUTHOR" >> $FILENAME
# echo "# Date: $(date)" >> $FILENAME
# echo "# Description: $DESCRIPTION" >> $FILENAME
# echo '############################################################' >> $FILENAME

# Create the script and append the header
# HERE-Doc syntax
cat << EOF > "$FILENAME"
############################################################
#!/bin/bash
# Author: $AUTHOR
# Date: $(date)
# Description: $DESCRIPTION
############################################################

EOF
# EOF > "$FILENAME" > /dev/null - works


# Make the new script executable
chmod +x $FILENAME

if [ -f $FILENAME ]; then echo "✅ Successfully bootstrapped: $FILENAME"; fi