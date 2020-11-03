# regex patterns can be used before the curly brackets to match stuff.

# this matches all binaries with python in them

awk ' /python/ { print $1 } ' usr_bin_data.txt

# this matches all that start with "s".  (theres a lot) and their sizes
# the " , " is used to separate fields, so you can print multiple fields from the same pattern match

awk ' /^s/ { print $1,$2 } ' usr_bin_data.txt

