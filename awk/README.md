Here are the basic stuff to be done with awk


awk files are run with the -f flag to point to the awk program file


usage:

awk -f the_awk_file_name.awk file_to_perform.txt



you can also use the shell file specified that runs the awk file you choose automatically on the usr_bin_data.txt file which is what the programs are written for


dont use the shell script for the last file because it uses a different data set


TO-NOTE: One thing about awk is, it runs the program file for every single line in the file to be read. so each action you perform is done one by one for each line, so it is better to use one liners to get your job done




### Basic working of AWK:

Awk is a turing complete programming langage in itself that is usually used for small scripts that operate on text files or any sort of sequential text inputs.

The general structure of awx is as follows

```
awk 'pattern { action  }' input.txt
```


By default AWK iterates over each line of the file. 

for eg.

```
awk '{ print }' input.txt
```

This prints all lines in the file


A more complex example would be

```
awk '/^#/ { print } ' input.txt
```

There are special keywords like

```
BEGIN { ...  }
END { ...  }
```


Begin runs once before each run and end runs each time a run ends.


There are also Per line variables such as


$0: The full line
$1, $2, etc.: The first, second etc columns of the file separated by the delimiter
NF: Number of fields in the current line
NR: The current line number



For example something like this command will run on each line, before and after

```
awk 'BEGIN { print "starting"  } { print "Line", NR, ":", $1  } END { print "ending"  }'  input.txt
```
