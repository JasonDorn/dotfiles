call plug#begin()
" C#
Plug 'OmniSharp/omnisharp-vim'

" General
Plug 'vim-autoformat/vim-autoformat'
" Color Theme
Plug 'morhetz/gruvbox'

" UI
" Plug 'powerline/powerline'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" MISC
Plug 'terryma/vim-smooth-scroll'

" Fuzzy Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim' "global search word

" Screen Search
Plug 'easymotion/vim-easymotion'

" Colors
Plug 'ap/vim-css-color'

" Create files/directories simultaneously
Plug 'duggiefresh/vim-easydir'

" Testing
Plug 'janko-m/vim-test'

" Commit messages
Plug 'rhysd/committia.vim'

" File Searcher
Plug 'scrooloose/nerdtree'

" Multi Cursors
Plug 'terryma/vim-multiple-cursors'

" Find and replace
Plug 'tpope/vim-abolish'

" Comment
Plug 'tpope/vim-commentary'

" git Blame
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Repeate commands
Plug 'tpope/vim-repeat'

" mnemonic surround
Plug 'tpope/vim-surround'

" Manages Rbenv via vim
" Maybe don't need
Plug 'tpope/vim-rbenv'

" Render CSV better
Plug 'chrisbra/csv.vim'

" Load and host language servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" #OO Languages#
" Summarize class
Plug 'preservim/tagbar'

" #RUBY#
" auto end
Plug 'tpope/vim-endwise'
" finds partner files
Plug 'tpope/vim-rails'
" GF in gemfile
Plug 'tpope/vim-bundler'
" Ruby highlight/auto complete
" Plug 'vim-ruby/vim-ruby' Don't think i need this anymore since solargraph

" #JS#
" Coffeescript coloring
Plug 'kchmck/vim-coffee-script'
" JS highlighting and indenting
Plug 'sheerun/vim-polyglot'
call plug#end()
" Search
let g:ackprg = 'ag --nogroup --nocolor --column' "use AG/fzf
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 }}
" Leader F color search
command! -bang -nargs=* BLines
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
    \   fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))

" # C# TOOLS #
" let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_mono_path = '/opt/homebrew/bin/mono'
let g:OmniSharp_server_use_mono = 1
" # RUBY TOOLS #
let g:coc_global_extensions = ['coc-solargraph']

" # JS TOOLS #
let g:vim_jsx_pretty_colorful_config = 1

" # VIM TOOLS #
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" COLORSCHEME
colorscheme gruvbox

" MAYBE REMOVE
syntax enable
" set termguicolors " Colors more intense
" set background=dark
" set nocompatible

" Multi window highlight
set cursorline

if has("autocmd")
  filetype indent plugin on
endif
set backspace=indent,eol,start
highlight ColorColumn ctermbg=cyan
set belloff=all
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
set path+=~/Developer/Homebase1/app/services
syntax on"
filetype plugin indent on
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

autocmd StdinReadPre * let s:std_in=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufWritePost *.cs :Autoformat
runtime macros/matchit.vim

au BufRead,BufNewFile *.rabl setf ruby
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
let g:test#javascript#runner = 'jest'
let test#ruby#bundle_exec = 0
let test#strategy = "vimterminal"
let test#vim#term_position = "belowright 20"
let g:test#preserve_screen = 1
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

let test#ruby#rspec#executable = 'bin/rspec --format documentation'

" MAPPINGS
map , <leader>
vnoremap <leader>ag "hy:Ag "<C-r>h"<CR>
map <leader>nt :NERDTreeFind<CR>
" map <leader>tca :execute "!zeus tcs %"<CR>
map <leader>tcs :execute "!SPEED=1 BROWSER=chrome bin/rspec %:" . line(".")<CR>
map <leader>tc :execute "!BROWSER=chrome bin/rspec %:" . line(".")<CR>
map <leader>q :q<cr>
map <leader>w :w<cr>
map <leader>dd "_dd
map <leader>v :vsplit<cr>
" map <leader>ss :Ag<cr>
map <leader>sv :SV<cr>
map <leader>tl :ts<cr>
map <leader>rw :windo e!<cr>
map <leader>D :call delete(expand('%')) \| bdelete!<cr>
map <leader>st <c-y>,
map tn :tabnew<cr>
map tk :tabn<cr>
map tj :tabp<cr>
nnoremap <leader>f :BLines<CR>
map <silent>f <plug>(easymotion-bd-f)
" map <leader>fj :%!python -m json.tool<cr>

nmap 0 ^
xmap tt $h
nmap tt $
nmap <silent> <leader>t :w \| :TestNearest<CR>
nmap <silent> <leader>T :w \| :TestFile<CR>
nnoremap <leader>ss :exe 'Ag!' expand('<cword>')<cr>
nnoremap <leader>ag :Ag 
nnoremap x "_x
nnoremap gl <C-W><C-L>
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gwr <C-W><C-R>
nnoremap gb <C-o>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader><space> :nohl<CR>
nnoremap <Leader>cp :let @+=expand("%") . ':' . line(".")<CR>
nnoremap <leader>. :CtrlPTag<cr>

nnoremap <silent> go :Files<CR>
nnoremap <space> :w<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>"

" FUNCTIONS
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

function! CreateSpec()
  try
    :AV
  catch
    let file_name = expand('%:r')
    let spec_file_name = substitute(file_name, 'app', 'spec', '') . '_spec.rb'

    exec ':saveas ' . spec_file_name
    execute "vsplit " . fnameescape(file_name) . '.rb'
    :wincmd w
  endtry
endfunction
map <leader>av :call CreateSpec()<cr>"

" AUTOCOMPLETE
" " vim-syntastic settings
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
set wildmenu


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" let g:endwise_no_mappings = 1

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <leader>y  :<C-u>CocList -A --normal yank<cr>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}
set statusline+=%*
set statusline+=%{FugitiveStatusline()}
" Go to tab by number
nnoremap <Leader>l :ls<CR>
" nnoremap <Leader>b :bp<CR>
" nnoremap <Leader>f :bn<CR>
" nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <Leader>so :TagbarToggle<CR>
set fileformats+=dos
