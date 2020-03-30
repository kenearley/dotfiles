set nocompatible              " be iMproved, required

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'w0rp/ale'
Plug 'palantir/tslint'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mileszs/ack.vim'
Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-sort-motion'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'amadeus/vim-mjml'
Plug 'svermeulen/vim-easyclip'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'metakirby5/codi.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'bogado/file-line'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'leafgarland/typescript-vim'
Plug 'bdauria/angular-cli.vim'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'ElmCast/elm-vim'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

filetype plugin indent on    " required
syntax enable

set encoding=utf-8
set backupcopy=yes
set title
set hidden
set number
set numberwidth=3
set scrolloff=3
set backspace=indent,eol,start
set vb
set nowrap
set clipboard=unnamed
set colorcolumn=120
set cursorline
set autoindent
set smartindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set copyindent
set preserveindent
set signcolumn=yes
set splitbelow
set splitright
set list
set listchars=tab:▸\ ,eol:↵ 
set diffopt+=iwhite " ignore whitespace in diff
set laststatus=2
set nostartofline
set noswapfile
set noshowmode
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set guifont=Sauce\ Code\ Powerline\ Light:h16

au FileType * set fo-=r fo-=o

let mapleader = ","

nnoremap <leader><leader> <c-^> " Switch between the last two files
map <leader>q :ccl<cr> " close qickfix window
map <leader>r :redraw!<cr>

command Chrome execute "!open -a 'Google Chrome' %"

" window movements
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"normal mode
nnoremap gm m

" insert mode
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
inoremap jj <esc>j
inoremap kk <esc>k

" search
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

nnoremap <leader><space> :noh<cr>

au BufNewFile,BufRead *.hbs set filetype=html

" bufexplorer
let g:bufExplorerShowDirectories=0
let g:bufExplorerFindActive=0

nnoremap <leader>b :Buffers<cr>

" file search settings
" set wildignore+=*/target/*,node_modules,*.swp

" command CopyPath execute "let @*=expand('%')"
command Cpp execute "let @*=fnamemodify(expand('%'), ':~:.')"
command Cpl execute "let @*=fnamemodify(expand('%') . ':' . line('.'), ':~:.')"
command DeleteFile execute "call delete(expand('%')) | bdelete!"

" FZF
nmap <leader>t :FZF<cr>
let g:fzf_buffers_jump = 1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-sort-motion
let g:sort_motion_flags = "ui"

" hightlight .js files
let g:jsx_ext_required = 0

" netrw
let g:netrw_liststyle=0

" ale
nmap <space>p <Plug>(ale_previous_wrap)
nmap <space>n <Plug>(ale_next_wrap)

let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   'typescript': ['prettier'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

" lightline.vim
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'component': {
  \   'readonly': '%{&readonly?"":""}'
  \ },
  \ 'component_visible_condition': {
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
  \ },
  \ 'separator': { 'left': "", 'right': "" },
  \ 'subseparator': { 'left': "", 'right': "" }
  \ }

let g:lightline.active = {
  \ 'left': [ [ 'mode', 'paste' ],
  \           [ 'readonly', 'relativepath', 'modified' ] ],
  \ 'right': [
  \   [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \   [ 'lineinfo' ],
  \   [ 'percent' ] ] }

let g:lightline.component_expand = {
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
  \ }

let g:lightline.component_type = {
    \     'linter_warnings': 'warning',
    \     'linter_errors': 'error',
    \     'linter_ok': 'left',
    \ }

"vim-easyclip
let g:EasyClipUseSubstituteDefaults=1

" theme settings
let g:solarized_visibility='low'
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

highlight clear LineNr
highlight clear SignColumn


" indent_guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=NONE    ctermbg=NONE
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#4e4e4e ctermbg=235

" netrw
let g:netrw_altv           = 1
let g:netrw_banner         = 0
let g:netrw_fastbrowse     = 2
let g:netrw_special_syntax = 1
let g:netrw_list_hide      = '\(^\|\s\s\)\zs\.\S\+'

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 

" angular-cli
autocmd VimEnter * if globpath('.,..','node_modules/@angular') != '' | call angular_cli#init() | endif

" tsuquyomi
let g:tsuquyomi_shortest_import_path = 1
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_single_quote_import = 1
