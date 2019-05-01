So as I understand there are two clipboards (sometimes they're the same) on the
system: 
  
  - the "selecting text copies and middle mouse button pastes" clipbard 
  - the "ctrl+c / ctrl+v" clipboard

First to make sure you can use Vim's clipboard capabilities make sure you've
got a compatible Vim version installed by checking that 
```bash
vim --version | grep clipboard 
```
contains `+clipboard` and `+xterm_clipbard` rather than `-clipboard` and
`-xterm_clipbard`. 
If it is not compatible, install a compatible version iE by 
```bash
sudo apt install vim-gtk
```

When you have a compatible version add 
```vimscript
" makes vim use the system clipboard 
" (set to unnamed to use select/midmouse clipboard)
    set clipboard=unnamedplus
```
and you should now be able to go into your browser, select some text and copy it
using `ctrl+c`, go into vim and paste it with `p`.
As the comment in the snippet above suggests, if you'd rather use the select and
middle mouse clipboard, use `set clipboard=unnamed` and you should be good to
go. 
It also should work the other way around, so you yank (`yy`) a line from vim and
then can paste it in your browser, email-client, etc.

[This Wikia post](https://vim.fandom.com/wiki/Accessing_the_system_clipboard)
is the primary source for this entry.
