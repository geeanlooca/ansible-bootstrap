"           _
"          (_)
"    __   __ _  _ __ ___   _ __   ___
"    \ \ / /| || '_ ` _ \ | '__| / __|
"  _  \ V / | || | | | | || |   | (__
" (_)  \_/  |_||_| |_| |_||_|    \___|



" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim



" Plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'honza/vim-snippets'
" Plugin 'sirver/ultisnips'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" Plugin 'rbonvall/vim-textobj-latex'
Plugin 'kana/vim-textobj-user'
Plugin 'lifepillar/vim-solarized8'
Plugin 'tpope/vim-commentary'
Plugin 'machakann/vim-highlightedyank'
" Plugin 'lervag/vimtex'
Plugin 'junegunn/fzf.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'jceb/vim-orgmode'
Plugin 'unblevable/quick-scope'
Plugin 'romainl/vim-cool'
Plugin 'dhruvasagar/vim-zoom' " <C-w>m to toggle zoom
Plugin 'davidhalter/jedi-vim' 

call vundle#end()            " required
filetype plugin indent on

" Useful mappings
""""""""""""""""""
map 0 ^
map <space> <leader>
map <space><space> <leader><leader>


" Clipboard Management
set clipboard=unnamedplus
set encoding=utf-8
vnoremap <leader>y "+y
nnoremap <leader>p "+p

" Folding
set foldenable
set foldmethod=manual
set foldcolumn=1
autocmd BufWrite * mkview
autocmd BufRead * silent loadview
" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent loadview
" augroup END


" Colorscheme
"
"colorscheme Monokai
"colorscheme atom
"colorscheme codeschool

syntax enable
set t_Co=256
set termguicolors

" hi Normal ctermbg=none
if has('gui_running')
    " GUI colors
    " colorscheme twilight
    " colorscheme nord
    " set guifont=RobotoMono\ Nerd\ Font\ Mono\ 12
else
    " Non-GUI (terminal) colors
    " colorscheme dracula
    colorscheme solarized8_flat
    " colorscheme twilight256
    " colorscheme jellyx
    " colorscheme desert
    " colorscheme Tomorrow
    set background=dark
    "
    " colorscheme solarized
    " colorscheme nord
endif


" Buffer management
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>D :bd!<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr> 
" Close all the buffers
map <leader>ba :bufdo bd<cr>


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <c-w><c-h>
nnoremap <leader>ws :split<cr>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wd <C-W>q

set splitright
set splitbelow


" General options
""""""""""""""""""

set ignorecase " case insensitive search
set smartcase
set hlsearch
set lazyredraw
set magic
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set linebreak
set tw=500
set autoindent
set smartindent
set wrap
set mouse=a

nnoremap <CR> :noh<CR><CR>
set nocursorline
set ruler
set number
set relativenumber
set hidden
set incsearch

" better :commands completion
set wildmenu
set wildignore+=*.md5,*.cfg,*.o,*.pyc,*.*synctex*,*.pdf,*.zip,*.aux,.git
set wildmode=longest:full,list:full

" Open compilation errors in quickfix
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Return to last edit position when opening files 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2

" do not store global and local values in a session
set ssop-=options    
    

" Tabs management
map <leader>tc :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabmove

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Spell Checking
" Toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Commentary
autocmd FileType c,cpp,java setlocal commentstring=//\ %s

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:Powerline_symbols='unicode'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/my-snippets/UltiSnips']
let g:tex_flavor = "latex"


" Vimtex
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'
" let g:vimtex_complete_enabled = 1
" let g:vimtex_complete_close_braces = 1
" let g:vimtex_view_general_viewer = 'zathura'
" let g:vimtex_view_method = "zathura"
" let g:vimtex_fold_enabled = 1
" let g:vimtex_complete_recursive_bib = 1


" Fugitive
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" Autocompletion
" Copy pasted from lervag's vimrc - https://github.com/lervag/dotvim/blob/master/vimrc
" let g:ycm_key_invoke_completion = '<C-space>'
" if !exists('g:ycm_semantic_triggers')
" let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
" let g:qf_auto_open_quickfix = 0
" let g:ycm_path_to_python_interpreter = '/usr/bin/python'


" FZF
""""""
set rtp+=~/.fzf
nnoremap <leader>ww :Windows<CR>
nnoremap <leader><leader> :Buffers<CR>
nnoremap <leader>o :Files<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>a :Rg 
nnoremap <leader>A :Rg <c-r><c-w><cr> 
nnoremap <leader>t :Tags<cr> 
nnoremap <leader>S :Snippets<CR>


" Opening, closing, saving files

" Quickly open and reload vimrc
nnoremap <leader>rc :e ~/.vimrc<CR>
nnoremap <leader>rl :source ~/.vimrc<CR>

" Quit without saving
nnoremap <leader>q :qa!<CR>

" Save file
map <leader>s :w!<cr>

" Save and quit
nnoremap <leader>x ZZ

" Search and replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Jedi: python autocomplete
" let g:jedi#auto_initialization = 0
