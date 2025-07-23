
Tmux is one of those things I've always known about, but to understand how useful it is, you have to start using it.

Here are things I learnt and use constantly in tmux.


## Configuration
The tmux.conf file is usually under ~/.tmux.conf

```
# Change prefix from 'Ctrl+B' to 'Ctrl+S'
unbind C-b
set-option -g prefix C-s
bind-key C-s send-prefix

# Enable mouse mode
set -g mouse on

# set vim like movement
setw -g mode-keys vi

# leader + r reloads tmux config
unbind r
bind r source-file ~/.tmux.conf
```


## Keybindings


leader + : - get into command mode

setw -g mode-keys vi


leader + c - new window
leader + window_num - go to window
leader + n - next window
leader + p - previous window
leader + x - close current pane
leader + , - rename current window
leader + & - close current window and the panes
leader + : - command mode
        swap-window -s 3 -t 1            - swaps window 3 with window 1
        leader + :kill-session - close entire session with windows and panes


leader + % - split window vertically
leader + " - split window horizontally
leader + arrow keys - move across panes
leader + o - cyclic switch panes
leader + q - show pane numbers - you can then input pane number to switch focus
leader + ; - go to previous pane;
leader + o - cyclic swap panes
leader + { - swap panes
leader + } - swap panes
leader + z - zoom into pane
leader + z - again to zoom out of pane
leader + ! - turn pane into window

leader + $ - rename session
leader + :new - open new session
leader + s - show session
leader ( - switch to previous session
leader ) - switch to previous session

leader + w - preview windows in the session ( you can move through them with vim like keybindings ) you can also look at the panes
leader + [ - copy mode
