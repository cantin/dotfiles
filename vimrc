call plug#begin('~/.vim/plugged')
"Plug 'andymass/vim-matchup'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
"Plug 'int3/vim-extradite'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-haml'
Plug 'mbbill/undotree'
"Plug 'lilydjwg/colorizer' slow down large file
"Plug 'henrik/vim-ruby-runner'
"Plug 'cantin/vim-ruby-runner'
"Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-peekaboo' "Quickly review registers
"Plug 'vim-scripts/ZoomWin'
"Plug 'regedarek/ZoomWin' "v25
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdcommenter'
"Plug 'majutsushi/tagbar'
"Plug 'tpope/vim-endwise'
Plug 'honza/vim-snippets'
"Plug 'jeetsukumaran/vim-buffergator'
Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'skywind3000/asyncrun.vim'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'danchoi/ri.vim'
"Plug 'w0rp/ale'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug '/opt/homebrew/opt/fzf'
"Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'arcticicestudio/nord-vim' "Style

Plug 'tpope/vim-bundler'
Plug 'othree/eregex.vim' "Use Perl/Ruby style regexp

"Running command on column level: :B, :S
Plug 'vim-scripts/vis'

"Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
""Plug 'neoclide/coc-tag', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
""Plug 'neoclide/coc-syntax', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
"Plug 'voldikss/coc-translator', {'do': 'yarn install --frozen-lockfile'}
"Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
"Plug 'coc-extensions/coc-omnisharp', {'do': 'yarn install --frozen-lockfile'}
"Plug 'iamcco/coc-spell-checker', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

" --------------------- Vim Setttings ---------------------------------
" Don't load matchparens standard plugin
"let loaded_matchparen = 1
"autocmd VimEnter * NoMatchParen
"Call :DoMatchParen to enable it again
let g:matchparen_timeout=150

" From coc.nvim. Turn hidden on if editing has issues.
set hidden
set background=dark
set lazyredraw

set shortmess-=S

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=500
set history=5000

"colorscheme jellybeans
colorscheme nord
"colorscheme gruvbox
"color jellybeans+

set signcolumn=number

"set undofile
set undodir=~/.vim/_undodir
set undofile
set undolevels=2000 "maximum number of changes that can be undone

"be able to C-] into definitions for any gem in your Gemfile
set tags+=./gems.tags
set tags+=gems.tags
set nowrap

" Autoindent with two spaces, always expand tabs
set shiftwidth=2
set expandtab
set tabstop=2

syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
" off and the line continues beyond the left of the screen

set nowrap                        "nowarp for long line
set nu                            "line number
set ruler                         " Ruler on

" Highlight all search results
set incsearch
set hlsearch

set smartcase                       " but case-sensitive if expression contains a capital letter.
set ignorecase                      " ignore case when searching

" Never ever let Vim write a backup file! They did that in the 70’s.
" Use modern ways for tracking your changes (like git), for God’s sake
set nobackup
set nowritebackup
set noswapfile

set mouse=a
set dictionary+=/usr/share/dict/words

"html indent for vim 7.4
let g:html_indent_inctags = "html,body,head,tbody"

if has("gui_macvim")
  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>

  set transparency=20       "设置透明度
endif

if has("gui_running")
  "set guifont=monaco:h12
  set guifont=Anonymous\ Pro:h15
  set guioptions=Ace              " 去掉难看的工具栏和滑动条
  "set showtabline=2        " 开启自带的tab栏
  set linespace=2

  " Don't beep
  set visualbell
  "set lines=999 columns=999

  "set shell command options 'bash -ilc' so ~/.bash_profile get loaded
  "set shellcmdflag=-ilc
endif

set wildmenu " visual autocomplete for command menu
"set showmatch " highlight matching [{()}]

" set highlight style for quickfix & cursorcolumn
highlight! link QuickFixLine StatusLineNC
highlight! link CursorColumn StatusLineNC
highlight! link CocDiagnosticsError ModeMsg
highlight! link CocErrorFloat ModeMsg
"Set background to black for gruvbox
highlight Normal guibg=black
highlight Normal ctermbg=None
" for nord folded fg color
hi Folded guifg=LightGray

" -------------------- Plugin Setttings --------------------------------

" Plugin fzf.vim
" Add fzf to run time path
set rtp+=/usr/local/opt/fzf
" ctrl-\ to enable preview window
let g:fzf_preview_window = ['right:50%:hidden:nowrap', 'ctrl-\']
let g:fzf_layout = { 'down': '~40%' }
noremap <c-p> :Files<cr>
noremap <leader>cp :Tags<CR>
nnoremap <leader>fd :set foldmethod=syntax<cr>
nnoremap <leader>fl :BLines<cr>
nnoremap <leader>fL :Lines<cr>
nnoremap <leader>m :Marks<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>ft :BTags<cr>
nnoremap <leader>fT :Tags<cr>
let g:fzf_history_dir = '~/.vim/fzf-history'
"Use fzf to search in command history
nnoremap <leader>C :<c-U>History:<cr>
"nnoremap <leader>C q:?
" Change branch by fugitive & fzf
function! s:changebranch(branch)
  execute 'Git checkout' . a:branch
  "call feedkeys("i")
endfunction
command! -bang Gbranch call fzf#run(fzf#wrap({ 'source': 'git branch -a --no-color | grep -v "^\* " ', 'sink': function('s:changebranch') }))

" option + c to use autojump + fzf to cd previous entered dir
function! s:jcd(path)
  execute 'lcd' . a:path
  "call feedkeys("i")
endfunction
command! -bang Jcd call fzf#run(fzf#wrap({ 'source': 'autojump -s | sort -k1gr | cut -f2 | ruby -ne "print if %r{\/}"', 'sink': function('s:jcd') }))
nnoremap ç :<c-u>Jcd<cr>
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
  "\ 'bg':      ['bg', 'Normal'],
  "\ 'hl':      ['fg', 'IncSearch'],
  "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  "\ 'bg+':     ['bg', 'TabLine'],
  "\ 'hl+':     ['fg', 'IncSearch'],
  "\ 'info':    ['fg', 'PreProc'],
  "\ 'border':  ['fg', 'Ignore'],
  "\ 'prompt':  ['fg', 'Cursor'],
  "\ 'pointer': ['fg', 'Cursor'],
  "\ 'marker':  ['fg', 'Keyword'],
  "\ 'spinner': ['fg', 'Label'],
  "\ 'header':  ['fg', 'Comment'] }
" Override fzf buffer_tags function to update columns in preview window
"function! fzf#vim#buffer_tags(query, ...)
  "let args = copy(a:000)
  "let escaped = fzf#shellescape(expand('%'))
  "let null = s:is_win ? 'nul' : '/dev/null'
  "let sort = has('unix') && !has('win32unix') && executable('sort') ? '| sort -s -k 5' : ''
  "let tag_cmds = (len(args) > 1 && type(args[0]) != type({})) ? remove(args, 0) : [
    "\ printf('ctags -f - --sort=yes --language-force=%s %s 2> %s %s', &filetype, escaped, null, sort),
    "\ printf('ctags -f - --sort=yes %s 2> %s %s', escaped, null, sort)]
  "if type(tag_cmds) != type([])
    "let tag_cmds = [tag_cmds]
  "endif
  "try
    "return s:fzf('btags', {
    "\ 'source':  s:btags_source(tag_cmds),
    "\ 'sink*':   s:function('s:btags_sink'),
    "\ 'options': s:reverse_list(['-m', '-d', '\t', '--with-nth', '1..4', '-n', '1', '--prompt', 'BTags> ', '--query', a:query, '--preview-window', '+{3}-/2'])}, args)
  "catch
    "return s:warn(v:exception)
  "endtry
"endfunction

" Plugin coc.nvim
" setting up extensions
let g:coc_filetype_map = { "haml": "haml"}
let g:coc_global_extensions = ["coc-snippets", "coc-tag", "coc-json", "coc-pairs", "coc-syntax", "coc-css", "coc-html", "coc-solargraph", "coc-tsserver", "coc-translator", "coc-sh", "coc-yank"]
" Remap keys for gotos
nmap <silent> <leader>gh :call CocActionAsync('highlight')<cr>
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gc <Plug>(coc-codeaction)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
vnoremap <silent> <leader>gf <Plug>(coc-format-selected)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>go :<c-u>CocOutline<cr>
nmap <leader>rn <Plug>(coc-rename)
" Press ctrl-e to complete the autocomplete
imap <expr> <C-e> coc#pum#visible() ? coc#_select_confirm() : "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand',''])\<CR>"
inoremap <expr> <c-j> coc#pum#visible() ? coc#pum#next(1) : "\<down>"
inoremap <expr> <c-k> coc#pum#visible() ? coc#pum#prev(1) : "\<up>"
inoremap <expr> <C-l> coc#pum#visible() ? coc#_select_confirm() : "\<right>"
"inoremap <silent><expr> <c-e> coc#refresh()
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
inoremap <silent><expr> <d-i> coc#refresh()
autocmd! CompleteDone * if coc#pum#visible() == 0 | pclose | endif
autocmd FileType coctree nnoremap <buffer> q :q<cr>
autocmd FileType vue vnoremap <buffer> == <Plug>(coc-format-selected)
autocmd BufRead,BufNewFile .*nvue set filetype=vue
"coc-translator
" popup
nmap <Leader><Leader>p <Plug>(coc-translator-p)
vmap <Leader><Leader>p <Plug>(coc-translator-pv)
" echo
nmap <Leader><Leader>e <Plug>(coc-translator-e)
vmap <Leader><Leader>e <Plug>(coc-translator-ev)
" replace
nmap <Leader><Leader>r <Plug>(coc-translator-r)
vmap <Leader><Leader>r <Plug>(coc-translator-rv)
"coc-spell-checker
vmap <leader><leader>a <Plug>(coc-codeaction-selected)
nmap <leader><leader>a <Plug>(coc-codeaction-selected)
"coc-yank
nnoremap <silent> <leader><leader>y  :<C-u>CocList -A --normal yank<cr>
" Use coc to get documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Map \K to original keyword lookup
nnoremap <leader>K :<C-u>exec &keywordprg . " " . expand('<cword>')<cr>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Search workspace symbols.
nnoremap <silent><nowait> <leader><leader>s  :<C-u>CocList -I symbols<cr>
" ctrl-f/ctrl-b to scroll in floating window
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
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
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" Prese tab to cleverTab when coc.nvim has no autocomplete
"imap <expr> <TAB> coc#pum#visible() ? "\<C-N>" : "\<C-R>=CleverTab('omni')<CR><C-R>=CleverTab('keyword')<CR><C-R>=CleverTab('next')<CR>"
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ?  "\<C-R>=CleverTab('omni')<CR><C-R>=CleverTab('keyword')<CR><C-R>=CleverTab('next')<CR>" :
\ coc#refresh()
" Press enter to complete the completion
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<cr>"


" Plugin scrooloose/nerdcommenter
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'swift': { 'left': '//'} }

hi link EasyMotionTarget Search

" Plugin othree/eregex.vim
let g:eregex_default_enable = 0 " Disable eregex by default
noremap <leader>/ :M/
noremap <leader>? :M?

" Plugin peekaboo
" setup peekaboo window to 60 chars
let g:peekaboo_window = "vert bo 60new"

" Plugin fugitive
"Press \df to get the cached git diff
nmap <silent> <leader>df :silent execute "!git diff --cached > diff" <bar> :e diff<cr>
" Press \gs with cursor undder the commit sha to get the commit detail
nmap <silent> <leader>gs :exec 'Gsplit '. expand('<cword>')<cr>
command! Gblame :Git blame
nnoremap <leader>G :Git<cr>
autocmd FileType fugitive setlocal shellcmdflag=-c
autocmd FileType fugitive nnoremap <buffer> q :q<cr>
autocmd FileType git nnoremap <buffer> q :q<cr>


" Plugin lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
function! LightlineFilename()
  return expand('%:.')
endfunction
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'filename': 'LightlineFilename',
      \ },
      \ }
" Always open status bar
set laststatus=2

"Plugin undotree
nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1

" Plugin vim-trailing-whitespace
" \fw to clear up all trailing whitespace
noremap <leader>fw :FixWhitespace<CR>
noremap <leader>fW mf:%s/\r//g<cr>'f

" Plugin nerdtree
noremap <leader>n :NERDTreeToggle<CR>
autocmd FileType nerdtree nnoremap <buffer> q :q<cr>

" Plugin ale
" ALE don't linting on every changes
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
"let g:ale_open_list= 1
" disable rubocop & erb check
let g:ale_linters = {
\   'ruby': ['brakeman', 'rails_best_practices', 'reek', 'ruby'],
\   'eruby': [],
\}

" Plugin vim-jsx
let g:jsx_ext_required = 1

" Plugin jellybeans
let g:jellybeans_overrides = {
\    'rubyRegexp': { 'guifg': 'f0f000',
\              'ctermfg': 'Yellow', 'ctermbg': 'Black',
\              'attr': 'bold' },
\    'rubyRegexpDelimiter': { 'guifg': 'f0f000',
\              'ctermfg': 'Yellow', 'ctermbg': 'Black',
\              'attr': 'bold' },
\    'rubyRegexpSpecial': { 'guifg': 'f0f000',
\              'ctermfg': 'Yellow', 'ctermbg': 'Black',
\              'attr': 'bold' },
\}

" Plugin asyncrun
" Open quickfix widnow & type AsyncRun in command line
let g:asyncrun_open = 16
nnoremap <d-A> :AsyncRun -raw<space>
"vnoremap <d-r> :<c-u>'<,'>AsyncRun -raw ruby<cr>
"vnoremap <leader>R :<c-u>'<,'>AsyncRun -raw ruby<cr>
"nnoremap <leader>R :call asyncrun#quickfix_toggle(8)<cr>:AsyncRun<space>

" Plugin ag.vim
nnoremap <leader>a  :<C-u>let cmd = 'Ag! ' . expand('<cword>') <bar> call histadd('cmd', cmd) <bar> execute cmd<cr>
vnoremap <leader>a  :<c-u>call <SID>AgOperator(visualmode())<cr>
nnoremap <leader>A :Ag!<space>
function! s:AgOperator(type)
  let prev_saved_val = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  " Add ag command to history
  call histadd('cmd', "Ag! -Q " . shellescape(@@) . "")
  silent execute "Ag! -Q " . shellescape(@@) . ""
  let @@ = prev_saved_val
endfunction

" Plugin go.vim
nnoremap <D-g> :GoRun %<cr>


" ------------------- Folding -------------------
" set fold method to syntax, default fold on top level
set foldmethod=syntax
set foldlevelstart=1
augroup customer_folding_autocmd
  "autocmd InsertEnter * setl foldmethod=manual
  "autocmd BufWritePost * setl foldmethod=syntax

  autocmd WinLeave * setl fdm=manual
  autocmd InsertEnter * let b:last_fdm=&foldmethod | setlocal foldmethod=manual
  autocmd BufWritePost * if exists('b:last_fdm') | let &l:foldmethod=b:last_fdm | endif

  autocmd BufRead,BufNewFile *.html* setl foldmethod=indent
  autocmd BufWritePost *.html* setl foldmethod=indent
  autocmd BufRead,BufNewFile *.yml setl foldmethod=indent
  autocmd BufWritePost *.yml setl foldmethod=indent

  " Don't screw up folds when inserting text that might affect them, until
  " leaving insert mode. Foldmethod is local to the window. Protect against
  " screwing up folding when switching between windows.
  "autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  "autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END
nnoremap <space> :call <SID>toggleFold()<cr>
vnoremap <space> za
" Open all nested folds if not on top foldlevel & nested folds all in one page
function! s:toggleFold()
  let l:num = foldclosed(expand('.'))
  let l:level = foldlevel(expand('.'))
  let l:foldlevel = &foldlevel
  if (l:num != -1) && (l:level != l:foldlevel)
    " +----999 lines blah blah -----------  or +---- 999 lines blah blah -----------  take 999 to l:result
    let l:result = split(substitute(foldtextresult(expand('.')), '-', ' ', 'g'), '')[1]
    if l:result > &lines
      silent! normal za
    else
      silent! normal zO
    endif
  else
    silent! normal za
  endif
endfunction

" ------------------------------------ auto command --------------------------

autocmd WinEnter * if &buftype == 'quickfix' | nnoremap <buffer> <silent> q :ccl<CR> | endif

augroup numbertoggle
  autocmd BufEnter,FocusGained,InsertLeave * if &l:number == 1 | set relativenumber | endif
  autocmd BufLeave,FocusLost,InsertEnter   * if &l:number == 1 | set norelativenumber | endif
augroup END

augroup customer_my_autocmd
  "autocmd BufRead,BufNewFile *.js set ft=javascript
  "autocmd BufRead,BufNewFile *.jsx set ft=javascript.jsx.html
  autocmd BufRead,BufNewFile *.jsx set ft=javascript.jsx
  autocmd BufRead,BufNewFile *.rdoc setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd BufRead,BufNewFile *.rdoc set complete+=kspell
  autocmd BufRead,BufNewFile *.md set complete+=kspell

  autocmd BufRead,BufNewFile *.md setlocal omnifunc=
  au FileType markdown setlocal omnifunc=
  au FileType cs setlocal tabstop=4  shiftwidth=4
augroup END

autocmd FileType ruby,haml setlocal keywordprg=:SHELL\ ri\ -T\ -f\ markdown
autocmd FileType ruby nnoremap <buffer> <D-R> :RunRailsRunner<CR>

" Comment it out because of slowness even less than 100 lines
"Set vertical line indicator for yaml & haml files
"au FileType yaml,haml setlocal cursorcolumn

" -------------------------------------- command and mapping ----------------------------

" Map ctrl-x_ctrl-p to keyword completin in complete, so that it matches words in other buffers.
inoremap <expr> <c-x><c-p> pumvisible() ? "\<c-e>\<c-p>" : "\<c-p>"

" gb to alternative file
noremap gb <c-^>
noremap ]b :bn<cr>
noremap [b :bp<cr>

" ct to generate ctags
noremap <leader>ct :!ctags -R .<CR>
"noremap <leader>cT :!ctags -R -f gems.tags $(bundle show --paths)<CR>
" cT to generate private gems tags
noremap <leader>cT :!ctags -R -f gems.tags $(bundle list --paths \| grep bundler)<CR>

" rl to setup relativenumber
noremap <leader>rl :set relativenumber!<CR>

" Run Rails test and system test
nnoremap <leader>rt :<c-u>call <SID>RunCommandAsync('bundle exec rails test')<cr>
nnoremap <leader>rst :<c-u>call <SID>RunCommandAsync('bundle exec rails test:system')<cr>

" Run rails test/routes based on the curernt file type
nnoremap <leader>rk :<c-u>call <SID>RKRunner(expand('%'))<cr>

command! Vimrc :vs $MYVIMRC
command! Terminal :terminal zsh -il
nnoremap <leader>T :Terminal<cr>
" ctrl-q to quit terminal
tnoremap <c-q> <c-\><c-n>:bd!<cr>
" ctrl-o to enter normal mode in terminal
tnoremap <c-o> <C-W>N
command OpenTerminal :silent !open -a iTerm $(pwd)

"D + j/k to move entire line down/up
nnoremap <D-j> :m .+1<CR>
nnoremap <D-k> :m .-2<CR>

command! Light set bg=light transparency=0
command! Dark set bg=dark transparency=20 | highlight Normal guibg=black | highlight Normal ctermbg=None

" When enter command-line mode from visual mode, Vim automatically inserts this range: '<,'>
" It will make the call to execute the function for each line in the range.
" Use <c-u> to discard that range
" Pair ("'[ in selected visual block
vnoremap <leader>( :<c-u>call SimpleAppendPair('(', ')')<CR>
vnoremap <leader>{ :<c-u>call SimpleAppendPair('{ ', ' }')<CR>
vnoremap <leader>[ :<c-u>call SimpleAppendPair('[', ']')<CR>
vnoremap <leader>" :<c-u>call SimpleAppendPair('"', '"')<CR>
vnoremap <leader>' :<c-u>call SimpleAppendPair("'", "'")<CR>

" Replace pair in selected visual block
vnoremap <leader>r( :<c-u>call SimpleAutoPair('(', ')')<CR>
vnoremap <leader>r{ :<c-u>call SimpleAutoPair('{', '}')<CR>
vnoremap <leader>r[ :<c-u>call SimpleAutoPair('[', ']')<CR>
vnoremap <leader>r" :<c-u>call SimpleAutoPair('"', '"')<CR>
vnoremap <leader>r' :<c-u>call SimpleAutoPair("'", "'")<CR>

" zoom the current buffer
command! ZoomToggle call s:ZoomToggle()
noremap <C-W>o :ZoomToggle<CR>

"run ruby by CMD + r
command! RunRuby call <SID>RunCommandAsync('ruby '. expand('%:p'))
au FileType ruby nnoremap <buffer> <D-r> :RunRuby<CR>
vnoremap <D-r> :<c-u>call <SID>RunCommandAsync('ruby -e "puts begin; ' . escape(VisualSelection(), '"') . '; end"')<cr>

"Use ruby as filter command
"noremap <leader>rf :<c-u>%!ruby -pe ""<left>
"noremap <leader>rF :<c-u>%!ruby -pe "gsub //, \%{}"<left><left><left><left><left><left><left><left>
vnoremap <leader>rf :!ruby -pe ""<left>
vnoremap <leader>rF :!ruby -pe "gsub //, \%{}"<left><left><left><left><left><left><left><left>
vnoremap <leader>rr :!ruby<cr>   " Use filter command: The selected code gets run and be replaced with the result
vnoremap <leader>rR :!rails r<cr>

"Generate ri documentation for gems in Gemfile. Note: bundler list --name-only is not working
command! RiAll :SHELL for gem in $(bc ruby -e "Bundler.load.specs.each {|s| puts s.name.to_s + ''&'' + s.version.to_s }"); do name=$(cut -d''&'' -f1 <<< $gem); version=$(cut -d''&'' -f2 <<< $gem); gem rdoc --ri $name -v $version; yard gems $name; done
command! RubyDoc setlocal keywordprg=:SHELL\ ri\ -T\ -f\ markdown

"Generate ri, yard documentation and .solargraph.yml for specific gems
":Ri rails
command! -nargs=* Ri call <SID>GenerateRi('<args>')

command! -nargs=* RTags call <SID>GenerateTag('<args>')

"run rails runner by CMD + R
command! RunRailsRunner call <SID>RunCommandAsync('bundle exec rails r ' . expand('%:p'))
vnoremap <D-R> :<c-u>call <SID>RunCommandAsync('bundle exec rails r "puts begin; ' . escape(VisualSelection(), '"') . '; end"')<cr>

"'SHELL shellcommand', redirect output to buffer
command! -nargs=* -complete=shellcmd SHELL call <SID>RunCommandAsync('<args>')
noremap <D-H> :SHELL<space>
vnoremap <D-H> :<c-u>call <SID>RunCommandAsync('' . escape(VisualSelection(), '"'))<cr>

command! LcdToCurrentFilePath lcd %:p:h
noremap <leader>cd :LcdToCurrentFilePath<CR>

nnoremap <leader>fn :!echo -n %:. \| pbcopy<cr>
nnoremap <leader>fN :!echo -n %:p \| pbcopy<cr>

"copy selected area to system clipboard for cli vi
noremap <leader>y "+y

" press // in visual mode will search visual selected area
vnoremap // :<c-u>set hlsearch \| :call <SID>searchVirualSelected()<cr>

" Map ctrl + a to navigate to beginning of command line
cnoremap <C-a> <Home>

" jump to split without press ctrl-w
"nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-h> <left>
"inoremap <C-j> <down>
"inoremap <C-k> <up>

" don't highlight search
nnoremap <Leader><space> :nohlsearch<Enter>

"Override lcd command to store path to autojump
command -nargs=1 -complete=dir Lcd call s:lcd('<args>')
cabbrev lcd Lcd

" mvimdiff current file with given path
" Usage:
"  :Mvimdiff file_path_to_diff
"  :Mvimdiff # read from system clipboard if no arguments
command -nargs=* -complete=dir MvimDiff call s:mvimdiff(<args>)

" Profile shortcut
"nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
"nnoremap <silent> <leader>DP :exe ":profile pause"<cr>
"nnoremap <silent> <leader>DC :exe ":profile continue"<cr>
"nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

" -------------------------------- misc functions -----------------------

let g:stop_autocomplete=0
function! CleverTab(type)
  if a:type=='omni'
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      let g:stop_autocomplete=1
      return "\<TAB>"
    elseif !pumvisible() && !!&omnifunc
      return "\<C-X>\<C-O>"
    endif
  elseif a:type=='keyword' && !pumvisible() && !g:stop_autocomplete
    "return "\<C-X>\<C-N>\<C-P>"
    return "\<C-N>"
  elseif a:type=='next'
    if g:stop_autocomplete
      let g:stop_autocomplete=0
    else
      "return "\<C-N>" "No need because we set it outside in <TAB> mapping
    endif
  endif
  return ''
endfunction

function s:RKRunner(path)
  let s:test = matchstr(a:path, '_test.rb')
  if !empty(s:test)
    if line('.') == 1
      let s:cmd = 'bundle exec rails test '. a:path
    else
      let s:cmd = 'bundle exec rails test '. a:path . ':' .line('.')
    endif
    call <SID>RunCommandAsync(s:cmd)
  else
    let s:routes = matchstr(a:path, 'routes.rb')
    if !empty(s:routes)
      call <SID>RunCommandAsync('bundle exec rails routes')
    else
      call <SID>RunCommandAsync('bundle exec rails r ' . a:path)
    endif
  endif
endfunction

function! SimpleAppendPair(first, second)
  execute "normal \<esc>`<i" . a:first  . "\<esc>`>"

  if col(".") == col("$")-1
    execute "normal a" . a:second  . "\<esc>`>"
  else
    if a:first == '{ '
      execute "normal lla" . a:second  . "\<esc>`>"
    else
      execute "normal la" . a:second  . "\<esc>`>"
    endif
  endif
endfunction

function! SimpleAutoPair(first, second)
  execute "normal \<esc>`<"

  let l:part = matchstr(getline('.'), '\%' . col('.') . 'c.')
  if (l:part=~'\s')
    execute 'normal ' "\<esc>lr" . a:first . "\<esc>`>r" . a:second . "\<esc>"
  else
    execute 'normal ' "\<esc>r" . a:first . "\<esc>`>r" . a:second . "\<esc>"
  endif
endfunction

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction

function RunCommandAsyncCallbackToAppendMessageToR(channel, msg)
  let @r=@r . "\n" . a:msg
endfunction
function s:KillWhilQuit()
  let l:bufname = 'Asynccmdbuf-tab' . tabpagenr()
  let l:async_job = getbufvar(l:bufname, 'async_job')
  "echom '-------'
  "echom l:async_job
  "echom '-------'
  if !empty(l:async_job) && job_status(l:async_job) == 'run'
    call job_stop(l:async_job, 'kill')
    sleep 100m
    echo job_status(l:async_job)
  endif
endfunction
function! s:RunCommandAsync(cmd)
  let @r=''
  let l:bufname = 'Asynccmdbuf-tab' . tabpagenr()
  if bufwinnr(l:bufname) > 0
    let l:async_job = getbufvar(l:bufname, 'async_job')
  else
    let l:async_job = ''
  end

  "echom '>>>>'
  "echom l:async_job
  "echom '>>>>'

	if !empty(l:async_job)
    if job_status(l:async_job) == 'run'
      if job_stop(l:async_job, 'kill')
        let l:async_job = setbufvar(l:bufname, 'async_job', '')
        unlet l:async_job
      end
    endif
  endif

  let l:async_job = job_start(['/bin/bash', '-ilc', a:cmd], {'out_io': 'buffer', 'out_name': l:bufname, 'err_io': 'buffer', 'err_name': l:bufname, 'callback': 'RunCommandAsyncCallbackToAppendMessageToR'})
  call setbufvar(l:bufname, 'async_job', l:async_job)

  "echom '<<<<<'
  "echom getbufvar(l:bufname, 'async_job')
  "echom '<<<<<'

  if bufwinnr(l:bufname) > 0
    exec 'keepjumps' bufwinnr(l:bufname) 'wincmd W'
    exec 'normal! ggdG'
  else
    exec 'new '. l:bufname
    silent normal gg
  endif

  setlocal buftype=nofile filetype= bufhidden=wipe noswapfile nobuflisted nomodified
  autocmd! * <buffer>
  autocmd BufWinLeave <buffer> call <SID>KillWhilQuit()
  silent put=('$ '. a:cmd)
  silent put=''
  noremap <buffer> q ZZ
  exec 'wincmd p'
endfunction

function! VisualSelection()
  try
    let a_save = @a
    silent! normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

function! s:GenerateRi(gems)
  let gems = a:gems
  if gems == '' | let gems = '^rails$' | endif
  exec "SHELL " . "IFS=$''\\n''; bundle exec gem dependency " . gems . "; for gem in $(bundle exec gem dependency " . gems . " --pipe); do name=$(cut -d '' '' -f1 <<< $gem); version=$(cut -d '' '' -f3-10 <<< $gem);" . "eval \"gem rdoc --ri $name -v $version; yard gems $name\"; done;
        \ if [ ! -e .solargraph.yml ]; then bundle exec ruby -e \" require %{yaml}; names = Bundler.load.specs.select { |s| s.loaded_from =~ /bundler\\/gems/ }.map(&:name); File.write(%{.solargraph.yml}, { %{include} => [%{\"**/*.rb\"}] + names.map { |n| %{../#{n}/**/*.rb}}, %{exclude} => names.map { |n| %{../#{n}/test/**/*}} }.to_yaml) \";
        \ fi; solargraph download-core; solargraph bundle; echo Done"
endfunction

function! s:GenerateTag(gems)
  let gems = a:gems
  if strlen(gems) == 0 | let gems = 'actioncable actionmailbox actionmailer actionpack actiontext actionview activejob activemodel activerecord activestorage activesupport' | endif
  exec "SHELL " . " for gem in " . gems . "; do path=$(bundle info --paths $gem) && cd $path; echo $path; ctags -R .\; cd -; done; echo Done;"
endfunction

function! s:searchVirualSelected()
  let prev_saved_val = @"
  normal! `<v`>y
  let @/ = @"
  let @" = prev_saved_val
endfunction

"Override lcd command to store path to autojump
function! s:lcd(path)
  execute 'lch ' . a:path
  execute('silent !autojump --add $(pwd)')
endfunction

" mvimdiff current file with given path
" Usage:
"  :Mvimdiff file_path_to_diff
"  :Mvimdiff # read from system clipboard if no arguments
function! s:mvimdiff(path = @+)
  echom a:path
  let cmd = '!mvimdiff ' . expand('%') . ' ' . a:path
  echom(cmd)
  execute(cmd)
endfunction

command! RunSQL call <SID>RunCommandAsync('psql -f '. expand('%:p') . ' sql_test')
au FileType sql nnoremap <buffer> <D-r> :RunSQL<CR>
au FileType sql vnoremap <buffer> <D-r> :<c-u>call <SID>RunCommandAsync('psql -c "' . escape(VisualSelection(), '"') . '" sql_test')<cr>
