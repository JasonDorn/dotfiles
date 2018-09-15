set nocompatible
set cursorline
if has("autocmd")
  filetype indent plugin on
endif
set backspace=indent,eol,start
highlight ColorColumn ctermbg=cyan
set colorcolumn=80
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab
set noswapfile
set number
set numberwidth=5
set clipboard=unnamed
set ignorecase
set list listchars=tab:»·,trail:·
set lazyredraw
set hlsearch
set incsearch
set mouse=a
set t_Co=256
syntax on

filetype plugin indent on
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'kchmck/vim-coffee-script'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ctrlpvim/ctrlp.vim' "open file
Plug 'duggiefresh/vim-easydir'
Plug 'easymotion/vim-easymotion' "jummp to highlighted chars
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'kana/vim-textobj-user'
Plug 'leshill/vim-json'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/committia.vim'
Plug 'rking/ag.vim' "global search word
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible' "sensible defaults
Plug 'tpope/vim-surround'
Plug 'trevordmiller/nova-vim' "Nova color scheme plugin
" On-demand loading
call plug#end()

" vim-syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:NERDTreeWinSize=40
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" end

let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let test#javascript#mocha#options = '--compilers js:babel-register -R spec'
let test#javascript#jest#options = 'react-scripts test --env=jsdom'
let g:test#preserve_screen = 1
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

let test#ruby#rspec#executable = 'z r'

map , <leader>
map <leader>nt :NERDTreeFind<CR>
map <leader>q :q<cr>
map <leader>w :w<cr>
map <leader>dd "_dd
map <leader>v :vsplit<cr>
map <leader>ss :split<cr>
map <leader>av :AV<cr>
map <leader>sv :SV<cr>
map <leader>rw :windo e!<cr>
map <leader>,p "+p<cr>
map <leader>D :call delete(expand('%')) \| bdelete!<cr>
map <leader>st <c-y>,
map <leader>fj :%!python -m json.tool<cr>

nmap 0 ^
nmap <silent> <leader>t :w \| :TestNearest<CR>
nmap <silent> <leader>T :w \| :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
nnoremap x "_x
nnoremap gl <C-W><C-L>
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gwr <C-W><C-R>
nnoremap gb <C-o>
nnoremap <leader><space> :nohl<CR>
map f <plug>(easymotion-bd-f)

nnoremap <silent> go :Files<CR>
nnoremap <space> :w<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

colorscheme nova

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

autocmd BufRead,BufNewFile *.es6 setfiletype javascript

autocmd StdinReadPre * let s:std_in=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
runtime macros/matchit.vim

au BufRead,BufNewFile *.rabl setf ruby
