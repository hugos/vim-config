call plug#begin('~/.local/share/nvim/plugged')

" https://sharksforarms.dev/posts/neovim-rust/
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" Indentation guides
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'dcampos/cmp-snippy'
Plug 'dcampos/nvim-snippy'
Plug 'honza/vim-snippets'

" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Jinja syntax highlighting
" https://github.com/lepture/vim-jinja
Plug 'lepture/vim-jinja'

" colour schemes
" http://neovimcraft.com/plugin/marko-cerovac/material.nvim/index.html
Plug 'marko-cerovac/material.nvim'
Plug 'morhetz/gruvbox'
Plug 'akai54/2077.nvim'
Plug 'haishanh/night-owl.vim'
Plug 'ajmwagar/vim-deus'
Plug 'nelstrom/vim-blackboard'
" File explorer
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

"Tabs
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'preservim/nerdcommenter' 
"Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}




"Format on save
" https://github.com/vim-autoformat/vim-autoformat
Plug 'Chiel92/vim-autoformat'

"Javascript Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

filetype plugin on


call plug#end()


if (has("termguicolors"))
set termguicolors
endif

"let g:material_style = "palenight"
colorscheme deus 


"Mapping keys
map <leader>js :w !node <CR>

"COC autocomplete config

:verbose imap <tab>
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"


"===== NERD TREE Configuration ======
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-n> :NERDTreeToggle<CR>


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -name .DS_Store \) -prune -o -print'

"Integrated Terminal

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>

" ==== Tabs Configuration ====

" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
" Close buffer
nnoremap <silent>    <C-w> <Cmd>BufferClose<CR>

"CONFIGS
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set list
"set background=dark "Font issue
"set t_Co=256

"More configurations from https://medium.com/geekculture/neovim-configuration-for-beginners-b2116dbbde84
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
""""set cc=80                  " set an 80 column border for good coding style
"filetype plugin indent on   "allow auto-indenting depending on file type
"syntax on                   " syntax highlighting
"set mouse=a                 " enable mouse click
"set clipboard=unnamedplus   " using system clipboard
"filetype plugin on
"set cursorline              " highlight current cursorline
set cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
