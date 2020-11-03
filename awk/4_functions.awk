# there are functions in awk to perform stuff


# converts the float value in kilobytes to integer of all files that start with "w"


/^w/ {print $1,int($2/1024)"Kb"
