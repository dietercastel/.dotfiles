set nocompatible               " be iMproved

#Plugged plugin manager auto download
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"------------------plugged SETUP-------------------
call plug#begin('~/.config/nvim/autoload/plug.vim')
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'Townk/vim-autoclose'
Plug 'vim-scripts/dante.vim' "Dark color theme
Plug 'mattn/webapi-vim' "Required for Gist plugin
Plug 'mattn/gist-vim'
Plug 'cseelus/vim-colors-clearance'
Plug 'rhysd/vim-grammarous'
call plug#end() " required
"-------------------------------------------------


" LANGUAGE SPELL AND SYNTAXCHECK SETTINGS
"
set spell
"au BufReadPost *.md set spelllang=(EVAL PYTHONSCRIPT HERE)
" the "," and "," a ", " to "
set spellfile=/keybase/private/dietercastel/langtools/mylist.utf-8.add
""""""""""""""""""""""

"Color scheme (downloaded by plugged)
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
" Rework to 2 spaces?
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

" For using argdo see http://vimcasts.org/transcripts/43/en/
" What is the effect of this in vimrc?
"set hidden

noremap! jj <Esc>
" TODO figure this out how to map it?
"map gk gcc

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
 
"---------GRAMMAROUS--------
:nmap gf <Plug>(grammarous-fixit)
:nmap gn <Plug>(grammarous-move-to-next-error)
" check feature of gn
:nmap gp <Plug>(grammarous-move-to-previous-error)
" check feature of gp
"-------END GRAMMAROUS------
