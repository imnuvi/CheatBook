# print is the basic command in awk

#the syntax is awk ' { command within braces } ' filename

awk ' { print } ' usr_bin_data.txt


# $ is used to access fields, $0 prints everything, $1 prints just the first element in each line.  useful for finding stuff from tables or when listing folders entirely


awk ' { print $1 } ' usr_bin_data.txt
