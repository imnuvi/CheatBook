
variable scopes available in vimscript
used like so 
'''let g:var = "xyz"'''

g: Global
s: Script-local (like "static" in C)
l: Function-local
a: Function argument
v: Vim internal
b: Buffer local
w: Window local
t: Tab local


:echom 'hello' . 'world'                         - this prints whatever the argument is
'hello' . 'world'                                - the dot operator concatenates two strings 
