# awk can be used to perform math stuff on the values, for example in the given file we have all the sizes of binaries in bytes, so in order to show them in kilobytes we divide them by 1024

# this displays all files with their sizes in kb

awk ' { print $1,$2/1024 } ' usr_bin_data.txt
