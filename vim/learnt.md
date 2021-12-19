

# stuff I learnt

shift + i - enter insert mode at start of a line
shift + a - enter insert mode at end of a line

j - move down
k - move up
h - move left
l - move right

w - move a word right
b - move a word left

{ - move a block left
} - move a block right

% - move to matching bracket


:sp filename - open filename file in split view

ctrl + w + j - shift focus to the bottom split page
ctrl + w + k - shift focus to the top split page
ctrl + w + l - shift focus to the right split page
ctrl + w + h - shift focus to the left split page


Jumping to characters
t + char - jump to the next instance of a character
f + char - jump to a character and land on it
once you have jumped to a character you can use 

; - to go to next instance of the character
, - to go to the previous instance of the character

to change a single string under the cursor and enter edit mode on it

s - change a single character
s5 - change 5 characters under the cursor

replace a word with yanked word

y3w - yank the required text ( yank three words here )
viwp - visual inside word paste ( essentially replaces the current hovered word with the yanked word)

to go to search previous declaration of identified below cursor
shift + 3 - or # - find previous declaration

shift + 8 - or * - find next declaration

on mac :
:w !pbcopy - copies the current visual selection to clipboard


ea - append to the end of current word

to enter proper indentation in current line normal mode press cc
cc - clear current line and enter proper indentation



Scrolling


ctrl + e - scroll down
ctrl + y - scroll up


floaterm opens a terminal as a popup window within vim
set the global variable g:floaterm_keymap_toggle to any keybinding you want Ive kept it to fn1 as this works on the terminal as well

to quit the terminal do ctrl + d and :q to exit it



splitting the pane:

:sp                   - split the screen horizontally
:vsp                  - split the screen vertically
ctrl + w              - enter the window split help mode
ctrl + w + h          - move focus to left screen
ctrl + w + j          - move focus to bottom screen
ctrl + w + k          - move focus to top screen
ctrl + w + l          - move focus to right screen
ctrl + w + x          - swap the windows
ctrl + w + v          - split window vertically
ctrl + w + r          - rotate the screens
ctrl + w + shift + r  - rotate the screens inverted
ctrl + w + p          - go to previous window

resize +30            - adds thirty rows to the current window
vertical resize +20   - adds 20 columns to the current split
vertical resize -15   - removes 15 columns to the current split
