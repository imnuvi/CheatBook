

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
