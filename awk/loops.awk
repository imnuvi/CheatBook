# loops in awk are similar to js and cpp. they can be used to iterate loops.

# in awk the main function is called every time a line is read.

# printf is formatted print.

# print all numbers from 1 to n where n is the number specified in the numbers.txt file

func looper(n){
	for(i=0;i<n;i++){
		printf("%d ", i)
	}
}

{ print looper($1) }
