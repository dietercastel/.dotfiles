set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent on     " required!

"Enable Filetypes
filetype plugin on
filetype indent on
syntax on

"Disable the swap file
set noswapfile
" Remove the current directory from the backupdir (no annoying ~files)
set backupdir-=.
" Add my own directory to the backupdir (So still backup possible)
set backupdir^=C:/Dropbox/Vim/backup,~/tmp,/tmp


"Enable relative Line Numbers
set rnu
" Show current absolute line number too!
set nu
"set background to dark
set background=dark
"display current cursor position in lower right corner.  
set ruler

"Show command in bottom right portion of the screen  
set showcmd 

"Indent stuff  
set smartindent  
set autoindent  

"Always show the status line  
set laststatus=2  

"Set incremental searching"  
set incsearch  
"  "Highlight searching  
set hlsearch  
" case insensitive search  
set ignorecase  
set smartcase  

"enable code folding  
set foldenable  

"hide mouse when typing  
set mousehide 

" Mark 80th column 
"set colorcolumn=80
"highlight ColorColumn ctermbg=lightgrey guibg=darkgrey

"Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.  
if has("autocmd")  
	autocmd bufwritepost _vimrc source C:/Dropbox/Vim/_vimrc  
endif 