# Neovim Config

## Navigation cheat sheet

Leader key - by default is set to <kbd>\\</kbd>

### Basic mappings

<kbd>|</kbd> - vertical split  
<kbd>-</kbd> horizontal split  
<kbd>Control + /h/j/k/l</kbd> - panes navigation  
<kbd>Control + e/q</kbd> - tabs left/right navigation  

### Telescope - fuzzy finder
<i>Leader</i> - <kbd>f</kbd> - open file searcher  
<i>Leader</i> - <kbd>b</kbd> - open active buffers searcher  
<i>Leader</i> - <kbd>g</kbd> - open grep window  
<i>Leader</i> - <kbd>s</kbd> - open grep with word under cursor

<kbd>Control + n/p</kbd> - move up/down inside filter window  
<kbd>Control + t/v/x</kbd> - open file in new tab/horizontal split/vertical split  

### LSP
<kbd>gd</kbd> - go to definition  
<kbd>gD</kbd> - go to declaration  
<kbd>gr</kbd> - find references  
<kbd>gi</kbd> - reach implementation  
<kbd>gca</kbd> - run code action (e.g. if fix available)  
<kbd>K</kbd> - show documentation  

### Hop navigation
<i>Leader</i> - <i>Leader</i> - <kbd>w</kbd> - jump to any word  
<i>Leader</i> - <i>Leader</i> - <kbd>p</kbd> - jump to any pattern  
<i>Leader</i> - <i>Leader</i> - <kbd>l</kbd> - jump to any line   

### Comments
<kbd>gcc</kbd> - toggle comment

For more advanced usage please refer directly to configured mapping or take a look at corresponding plugin default mapping in its doc.
