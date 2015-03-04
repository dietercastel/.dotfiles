set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent on     " required!

"------------------VUNDLE SETUP-------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-scripts/dante.vim' "Dark color theme
Plugin 'mattn/webapi-vim' "Required for Gist plugin
Plugin 'vim-scripts/gist.vim' "Gist plugin
call vundle#end() " required 
"-------------------------------------------------

"Color scheme (downloaded by Vundle)
colorscheme dante 

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

"tab/spacing settings
set smartindent
set tabstop=4 "nb of visual spaces per TAB
set softtabstop=4 "nb of spaces in tab when editing
set shiftwidth=4

"Show command in bottom right portion of the screen  
set showcmd 

"Indent stuff  
set smartindent  
set autoindent  

"Always show the status line  
set laststatus=2  

"Set incremental searching  
set incsearch  
"Highlight searching  
set hlsearch  
"Case insensitive search  
set ignorecase  
set smartcase  

"enable code folding  
set foldenable  

"hide mouse when typing  
set mousehide 

" try mapping CAPS to CRTL
"noremap <CAPS>
" try mapping esc to kj
" jk is quite common in ducth so kj is better?
noremap! kj <Esc>

" Mark 80th column 
"set colorcolumn=80
"highlight ColorColumn ctermbg=lightgrey guibg=darkgrey

"PLUGIN SPECIFIC CONFIGS
"---------GIST--------
let g:gist_post_private = 1 "Private by default
let g:gist_detect_filetype = 1
" Only :w! updates a gist.
let g:gist_update_on_write = 2
"-------END GIST------

"Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.  
if has("autocmd")  
	autocmd bufwritepost _vimrc source C:/Dropbox/Vim/_vimrc  
endif 
