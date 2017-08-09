# https://stackoverflow.com/questions/6205157/iterm-2-how-to-set-keyboard-shortcuts-to-jump-to-beginning-end-of-line
bindkey "^U" backward-kill-line # changes hex 0x15 to delete everything to the left of the cursor, rather than the whole line
bindkey "^X\\x7f" backward-kill-line # binds hex 0x18 0x7f with deleting everything to the left of the cursor
bindkey "^X^_" redo # adds redo
