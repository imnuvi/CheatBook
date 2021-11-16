### enable ssh in linux


$ sudo apt install openssh-server

$ sudo systemctl enable ssh
$ sudo systemctl start ssh

$ sudo ufw allow ssh
$ sudo ufw enable
$ sudo ufw status

!! - previous command

instead of tail -f we can use 

$ less -F file.txt

this opens up the log in less. you can do ctrl+c to quit and shift f to follow again

ctrl + u - cut till the cursor
ctrl + k - cut from cursor to the end
ctrl + y - paste whatever was cut

ctrl + x + e - open the current command you are typing in your editor

!* - gives the arguments of the previous command you typed
!^      first argument
!$      last argument
!*      all arguments
!:2     second argument

!:2-3   second to third arguments
!:2-$   second to last arguments
!:2*    second to last arguments
!:2-    second to next to last arguments

!:0     the command
!!      repeat the previous line
