# awk has function definitions which can be used later

# here a round function rounds values given to it and then the printer prints all the rounded values of the file specified


func round(n) {
	n = n + 0.5
	n = int(n)
	return n
}


$2 > 10000 {print $1,round($2/1024)"Kb"}
