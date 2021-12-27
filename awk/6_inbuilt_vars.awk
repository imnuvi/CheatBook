 #NR: NR is the number of rows presnt in each file. you can use this variable in loops and conditionals
#NR can also be used before the start of command to set the number of rows in which the command is executed

 #NF: NF takes care of the number of fields in the file. This is usually the number of colums in the file

 #FS: this represents the value that will be used as separator on the file. so csvs can be split using FS=,
#

 #RS: this is the record separator. so essentially the line separator. By default this is the Newline character
#

##OFS: This is the ourput field separator and shows how awk separates the output fields that it prints
#

 #ORS: the output record separator is the value that will separate the output REcords. default is newline
