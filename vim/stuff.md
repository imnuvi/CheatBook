The first thing is to start thinking in vim. Like you think in python. But here its considered a literal language


basic .vimrc file
:syntax on # enables syntax coloring
inoremap jk <ESC> # remap jk to escape
let mapleader = "'" # activator key
set number # show line numbers
set noswapfile # disable swap file
set hlsearch # highlight search results
set ignorecase # ignore case in search
set incsearch # show search results incrementaly as you type



# verbs
these are actions we take
- d: delete
- c: change
- y: yank ( copy )
- v: visually select ( V For lines vs v for characters)


# modifiers
modifiers are used before nouns to describe the way in which you are going to perform the action.
- i: inside
- a: around
- NUM: number
- t: searches for something and stops before it
- f: searches for something and lands on it
- /: find a string literal or regex

# nouns
Objects you perform an acton on or do something to
- 2:
