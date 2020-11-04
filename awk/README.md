Here are the basic stuff to be done with awk


awk files are run with the -f flag to point to the awk program file


usage:

awk -f the_awk_file_name.awk file_to_perform.txt



you can also use the shell file specified that runs the awk file you choose automatically on the usr_bin_data.txt file which is what the programs are written for


dont use the shell script for the last file because it uses a different data set


One thing about awk is, it runs the program file for every single line in the file to be read. so each action you perform is done one by one for each line, so it is better to use one liners to get your job done

