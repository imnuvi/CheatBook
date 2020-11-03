# enter the file number or its name to run the particular file with awk on the usr_bin_data.txt file

read -p "Enter file name or number :  " file

file_name=$(ls $file*)

awk -f $file_name usr_bin_data.txt
