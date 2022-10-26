" Homebase
set path+=~/Developer/Homebase1/app/services
set path+=~/Developer/Homebase1/client/jest
set path+=~/Developer/Homebase1/client/lib
set path+=~/Developer/Homebase1/client/src

call plug#begin()
Plug 'kristijanhusak/vim-create-pr'
"CHANGES
Plug 'airblade/vim-gitgutter'
" Language Analysis
Plug 'dense-analysis/ale'

" AUTO COMPLETE
" :CocInstall coc-tsserver coc-tabnine coc-pyright coc-html coc-css
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax Checker
Plug 'dense-analysis/ale'

" Language Support
Plug 'sheerun/vim-polyglot'

" Fast File searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim' "global search word

" Checks for tabs/spaces and amm
Plug 'tpope/vim-sleuth'

" COLOR SCHEME
Plug 'rafi/awesome-vim-colorschemes'

" FILE SEARCH
Plug 'preservim/nerdtree'

" STATUS BAR
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" SURROUND
Plug 'tpope/vim-surround'
" COMMENTARY
Plug 'tpope/vim-commentary'
" auto end
Plug 'tpope/vim-endwise'
" finds partner files
Plug 'tpope/vim-rails'
" GF in gemfile
Plug 'tpope/vim-bundler'
" git Blame
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Repeate commands
Plug 'tpope/vim-repeat'
" Find and replace
Plug 'tpope/vim-abolish'

" TAGBAR
Plug 'preservim/tagbar'

" Colors
Plug 'ap/vim-css-color'

" Multi Cursors
Plug 'terryma/vim-multiple-cursors'

" Commit messages
Plug 'rhysd/committia.vim'

" Testing
Plug 'janko-m/vim-test'

" Create files/directories simultaneously
Plug 'duggiefresh/vim-easydir'

" Colors
Plug 'ap/vim-css-color'

" Screen Search
Plug 'easymotion/vim-easymotion'

" C#
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

" Multi window highlight
set cursorline
set belloff=all " no bells
set colorcolumn=100
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab
set noswapfile
set number
set numberwidth=5
set ignorecase
set list listchars=tab:»·,trail:·
set lazyredraw
set hlsearch
set incsearch
set mouse=r
syntax on
filetype plugin indent on
runtime macros/matchit.vim
" MAPPINGS
map , <leader>
map <leader>q :q<cr>
map <leader>w :w<cr>
map <leader>dd "_dd
map <leader>v :vsplit<cr>
map <leader>sv :SV<cr>
map <leader>tl :ts<cr>
map <leader>rw :windo e!<cr>
map <leader>D :call delete(expand('%')) \| bdelete!<cr>
nmap 0 ^
xmap tt $h
nmap tt $
nnoremap <leader><space> :nohl<CR>
nnoremap <Leader>cp :let @+=expand("%") . ':' . line(".")<CR>
nnoremap <Leader>ccp :let @+=expand("%:p") . ':' . line(".")<CR>
nnoremap <silent> go :Files<CR>
nnoremap <space> :w<CR>
nnoremap <leader>ss :exe 'Ag!' expand('<cword>')<cr>
nnoremap <leader>ag :Ag
vnoremap <leader>ag "hy:Ag "<C-r>h"<CR>
nnoremap x "_x
nnoremap gl <C-W><C-L>
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gwr <C-W><C-R>
nnoremap gb <C-o>
nnoremap <leader>gb :Git blame<CR>
set clipboard=unnamed
set backspace=indent,eol,start " allows backspace to go to new lines
"
" Enable 256-color by default in the terminal
if !has('gui_running') | set t_Co=256 | endif

" EASY MOTION
map <silent>f <plug>(easymotion-bd-f)

" Wildignore
set wig+=vendor,log,logs

let g:ackprg = 'ag --nogroup --nocolor --column' "use AG/fzf
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 }}
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
nnoremap <leader>f :BLines<CR>
command! -bang -nargs=* BLines
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
    \   fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))
vnoremap <leader>ag "hy:Ag "<C-r>h"<CR>

" THEME
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE
let g:terminal_ansi_colors = [
    \ '#282828', '#cc241d', '#98971a', '#d79921',
    \ '#458588', '#b16286', '#689d6a', '#a89984',
    \ '#928374', '#fb4934', '#b8bb26', '#fabd2f',
    \ '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
\]
set background=dark

" NERDTREE
nnoremap <C-t> :NERDTreeToggle<CR>
map <leader>nt :NERDTreeFind<CR>
" let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1
set wildignore+=*.DS_Store,*.min.*
" autocmd BufWinEnter * silent NERDTreeMirror
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

" POLYGOT
set nocompatible

" ALE
" Fix files with prettier, and then ESLint.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 1

" COC
set shortmess+=c
let g:ale_disable_lsp = 1

" RUBY
au BufRead,BufNewFile *.rabl setf ruby

" TESTING
let test#ruby#rspec#executable = 'bin/rspec --format documentation'
let test#javascript#jest#executable = 'cd client;yarn test'
let g:test#javascript#runner = 'jest'
let test#ruby#bundle_exec = 0
let test#strategy = "vimterminal"
let test#vim#term_position = "belowright 20"
let g:test#preserve_screen = 1
map <leader>tcs :execute "!SPEED=3 BROWSER=chrome bin/rspec %:" . line(".")<CR>
map <leader>tc :execute "!BROWSER=chrome bin/rspec %:" . line(".")<CR>
nmap <silent> <leader>t :w \| :TestNearest<CR>
nmap <silent> <leader>T :w \| :TestFile<CR>

" TAGBAR
nmap <Leader>so :TagbarToggle<CR>

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

" May need for vim (not neovim) since coc.nvim calculate byte offset by count
" utf-8 byte sequence.
set encoding=utf-8
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
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
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cocqf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> coca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> coce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> cocc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> coco  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> cocs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> cocj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> cock  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> cocp  :<C-u>CocListResume<CR>
