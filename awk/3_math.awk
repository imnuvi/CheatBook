# awk can be used to perform math stuff on the values, for example in the given file we have all the sizes of binaries in bytes, so in order to show them in kilobytes we divide them by 1024

# this displays all files with their sizes in kb along with "Kb"

awk ' { print $1,$2/1024"Kb" } '



# math operators can be used on fields.

# this prints all binaries with value greater than 20Kb

awk ' $2 > 20000 { print $1,$2 } '
