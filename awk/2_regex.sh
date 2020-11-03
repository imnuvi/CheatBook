# regex patterns can be used before the curly brackets to match stuff.

# this matches all binaries with python in them

awk ' /python/ { print $1 } ' usr_bin_data.txt

# this matches all that start with "s".  (theres a lot)

awk ' /^s/ { print $1 } ' usr_bin_data.txt

