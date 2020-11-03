# regex patterns can be used before the curly brackets to match stuff.

# this matches all binaries with python in them

awk ' /python/ { print $1 } ' usr_bin_data.txt
