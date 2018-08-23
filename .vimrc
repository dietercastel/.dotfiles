set nocompatible               " be iMproved

#Setup plugged 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"------------------VUNDLE SETUP-------------------
call plug#begin('~/.config/nvim/autoload/plug.vim')
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'Townk/vim-autoclose'
Plug 'vim-scripts/dante.vim' "Dark color theme
Plug 'mattn/webapi-vim' "Required for Gist plugin
Plug 'vim-scripts/gist.vim' "Gist plugin
call plug#end() " required 
"-------------------------------------------------

"Color scheme (downloaded by Vundle)
colorscheme dante 

"Disable the swap file
set noswapfile
#" Remove the current directory from the backupdir (no annoying ~files)
#set backupdir-=.
#" Add my own directory to the backupdir (So still backup possible)
#set backupdir^=C:/Dropbox/Vim/backup,~/tmp,/tmp


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

noremap! jj <Esc>

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
