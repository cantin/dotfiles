source ~/.vimrc.vundle

set background=dark

"**********************Plugin
colorscheme jellybeans
"color jellybeans+

"let g:syntastic_ruby_exec = 'ruby20'
"let g:syntastic_html_tidy_exec = 'tidy5'

"let g:ctrlp_by_filename = 1
"let g:ctrlp_root_markers = ['']
"let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/]tmp$|\v[\/]node_modules$',
      \ 'file': '\.gz$\|\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
      \ }
"let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height


"Airline, always open status bar
set laststatus=2

noremap <leader>fw :FixWhitespace<CR>
noremap <leader>ct :!ctags -R .<CR>
noremap <leader>crt :!ctags -R -f gems.tags $(bundle show --paths)<CR>
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>rt :TagbarToggle<CR>
noremap <leader>cp :CtrlPTag<CR>
"run rake default task, default is running test in current file
noremap <leader>rk :.Rake<CR>

" ALE don't linting on every changes
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
"let g:ale_open_list= 1
" disable rubocop & erb check
let g:ale_linters = {
\   'ruby': ['brakeman', 'rails_best_practices', 'reek', 'ruby'],
\   'eruby': []
\}

let g:jsx_ext_required = 0

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

augroup customer_my_autocmd
  autocmd BufRead,BufNewFile *.js set ft=javascript.jsx
  autocmd BufRead,BufNewFile *.jsx set ft=javascript.jsx
  autocmd BufRead,BufNewFile *.rdoc setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd BufRead,BufNewFile *.rdoc set complete+=kspell
  autocmd BufRead,BufNewFile *.md set complete+=kspell
augroup END

" Open ag.vim
"nnoremap <leader>a :Ag<space>
"nnoremap <leader>a :set operatorfunc=<SID>AgOperator<cr>g@
nnoremap <leader>a  :Ag! <cword><cr>
vnoremap <leader>a  :<c-u>call <SID>AgOperator(visualmode())<cr>
nnoremap <leader>A :Ag!<space>
" Open quickfix widnow & type AsyncRun in command line
nnoremap <leader>R :call asyncrun#quickfix_toggle(8)<cr>:AsyncRun<space>

function! s:AgOperator(type)
  let prev_saved_val = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  silent execute "Ag! -Q " . shellescape(@@) . ""
  let @@ = prev_saved_val
endfunction

" Make AsyncRun works with vim-fugitive, comment out because has side effect for rails.vim
"command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
" Let Airline display status of AsyncRun
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

"**********************Plugin

"set undofile
set undodir=~/.vim/_undodir
set undofile
set undolevels=500 "maximum number of changes that can be undone

"be able to C-] into definitions for any gem in your Gemfile
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

"html indent for vim 7.4
let g:html_indent_inctags = "html,body,head,tbody"

"D + j/k to move entire line down/up
nnoremap <D-j> :m .+1<CR>
nnoremap <D-k> :m .-2<CR>



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
endif

if has("gui_running")
  "set guifont=monaco:h12
  set guifont=Anonymous\ Pro:h14
  set guioptions=Ace              " 去掉难看的工具栏和滑动条
  "set showtabline=2        " 开启自带的tab栏
  set transparency=20       "设置透明度
  set linespace=2

  "call Rand()
  "hi Normal guibg=Black guifg=White
  "hi Normal guibg=White guifg=Black

  " Don't beep
  set visualbell
  "set lines=999 columns=999
endif

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
command! ZoomToggle call s:ZoomToggle()
noremap <C-W>o :ZoomToggle<CR>


"let s:output_file = '/tmp/ruby_runner_output.txt'

"run command and redirect output to buffer on top
function! s:RunCommand(cmd)
  let temp_reg = @"
  redir @"
  silent execute a:cmd
  redir END
  let output = copy(@")
  let @" = temp_reg

  "silent execute '' a:cmd ' > ' s:output_file '2>&1'

  " Reuse or create new buffer. Based on code in Decho
  " http://www.vim.org/scripts/script.php?script_id=120
  if exists('t:rrbufnr') && bufwinnr(t:rrbufnr) > 0
    exec 'keepjumps' bufwinnr(t:rrbufnr) 'wincmd W'
    exec 'normal! ggdG'
  else
    exec 'keepjumps silent! new'
    let t:rrbufnr=bufnr('%')
  end

  setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
  silent put=output
  silent exec '%s/$//'
  silent normal gg
  "exec 'read' s:output_file

  noremap <buffer> q ZZ
endfunction

"run ruby by CMD + r
command! RunRuby call <SID>RunCommand('!ruby %:p')
au FileType ruby noremap <buffer> <D-r> :RunRuby<CR>

"Redirect output of ri to buffer when pressing K
if has("gui_running") && !has("gui_win32")
  au FileType ruby setlocal keywordprg=:SHELL\ ri\ -T\ -f\ markdown
endif

"run rails runner by CMD + R
command! RunRailsRunner call <SID>RunCommand('!bundle exec rails r %:p')
au FileType ruby noremap <buffer> <D-R> :RunRailsRunner<CR>

"'SHELL shellcommand', redirect output to buffer
"command! -nargs=* -complete=shellcmd SH new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
command! -nargs=* -complete=shellcmd SHELL call <SID>RunCommand('!<args>')
noremap <D-H> :SHELL<space>

command! LcdToCurrentFilePath lcd %:p:h
noremap <leader>cd :LcdToCurrentFilePath<CR>

nnoremap <leader>f :!echo -n %:p \| pbcopy<cr>

"Set vertical line indicator for yaml & haml files
au FileType yaml,haml setlocal cursorcolumn

"copy selected area to system clipboard for cli vi
"+y :w !pbcopy<CR><CR>
noremap <leader>y :w !pbcopy<CR><CR>

set wildmenu " visual autocomplete for command menu
"set showmatch " highlight matching [{()}]

"set shell command options 'bash -ilc' so ~/.bash_profile get loaded
set shellcmdflag=-ilc

" set highlight style for quickfix & cursorcolumn
highlight! link QuickFixLine StatusLineNC
highlight! link CursorColumn StatusLineNC

" press // in visual mode will earch visual selected area
vnoremap // :<c-u>set hlsearch \| :call <SID>searchVirualSelected()<cr>
function! s:searchVirualSelected()
  let prev_saved_val = @"
  normal! `<v`>y
  let @/ = @"
  let @" = prev_saved_val
endfunction

" Map ctrl + a to navigate to beginning of command line
cnoremap <C-a> <Home>

" set fold method to syntax, default fold on top level
set foldmethod=syntax
set foldlevelstart=1
augroup customer_folding_autocmd
  autocmd InsertEnter * setl foldmethod=manual
  autocmd BufWritePost * setl foldmethod=syntax

  autocmd BufRead,BufNewFile *.html* setl foldmethod=indent
  autocmd BufWritePost *.html* setl foldmethod=indent

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
    echo l:result
    if l:result > &lines
      silent! normal za
    else
      silent! normal zO
    endif
  else
    silent! normal za
  endif
endfunction
