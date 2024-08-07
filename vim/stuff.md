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
- w: word
- s: sentence
- ): sentence ( another way of doing the same )
- p: paragraph
- }: paragraph ( another way of doing paragraph )
- t: tag ( html xml )
- b: block ( programming block )


Nouns can be used as motion. You can use these nouns to move around content using them as size of  the jump. examples in moving section


## building sentences with the various parts
we can make the various pieces nouns verbs and modifiers intuitively just as how we use sentences in english


a few examples
- d2w - delete two words
- cis - change inside sentence - edit the current sentence
- yip - yank inside current paragraph - copy the paragraph you are in
- ct< - change to the next open bracket. the to operator is useful and you can put in whatever you want after the t and you can go there. You could easily do dtp which means delete everything from cursor to next paragraph

Now those are basics of vim.



## working with files
- vim filename - opens the file in vim
- :w - write changes to your file
- :q - quit operating on the file - q! the exclamation forces the quit
- :wq - write chnages to file and then quit
- ;saveas ~/some/path_to_new_file - save the file to that location
- :zz - same as :wq

## General thoughts
Vim should not be thought of as a text editor. It is a paradigm to think about text and how we go about editing it.
For example when we read a book, to reach maximum reading efficiency, we don't read a text word by word, But we read the line as a whole gathering multiple words at a time, and let our mind process them on the go. Similarly with vim, we don't look at text as a language representation. Instead, text itself is the canvas in which we move edit and perform various actions, and these actions are performed by using vim as a language. For example a line can just be deleted or a word can be yanked by quickly using a fey keystrokes

The best way to learn vim is to get comfortable with the terminal first, and then forcing yourself to just use vim wherever possible, on vscode, on pycharm, or straight up on the terminal by setting input mode to vim

Happy vimming!