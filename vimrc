"source ~/.vimrc.vundle

" Don't load matchparens standard plugin
"let loaded_matchparen = 1
"autocmd VimEnter * NoMatchParen
"Call :DoMatchParen to enable it again
let g:matchparen_timeout=150

call plug#begin('~/.vim/plugged')
"Plug 'andymass/vim-matchup'
Plug 'tpope/vim-fugitive'
"Plug 'bling/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'nanotech/jellybeans.vim'
"Plug 'int3/vim-extradite'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'mbbill/undotree'
"Plug 'lilydjwg/colorizer' slow down large file
"Plug 'henrik/vim-ruby-runner'
"Plug 'cantin/vim-ruby-runner'
"Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
"Plug 'vim-scripts/ZoomWin'
"Plug 'regedarek/ZoomWin' "v25
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdcommenter'
"Plug 'majutsushi/tagbar'
"Plug 'kien/ctrlp.vim'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
"Plug 'tpope/vim-endwise'
Plug 'honza/vim-snippets'
"Plug 'jeetsukumaran/vim-buffergator'
Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'skywind3000/asyncrun.vim'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'danchoi/ri.vim'
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-bundler'

"Plug 'BrandonRoehl/auto-omni'

"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
" (Optional) Multi-entry selection UI.
"Plug 'junegunn/fzf'

"Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'google/vim-searchindex'

"Plug 'ncm2/ncm2-snipmate'
"Plug 'ncm2/ncm2-syntax'
"Plug 'Shougo/neco-syntax'
"Plug 'ncm2/ncm2-tagprefix'
"Plug 'fgrsnau/ncm2-otherbuf', { 'branch': 'ncm2' }
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-cssomni'
"Plug 'ncm2/ncm2-path'

"Plug 'ncm2/ncm2-ultisnips'
"Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
"Plug 'jiangmiao/auto-pairs'

"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'ncm2/ncm2-vim-lsp'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set hidden
set background=dark
set lazyredraw

set shortmess-=S

hi link EasyMotionTarget Search

"let g:extradite_resize=0
"let g:extradite_diff_split='belowright vertical split'
"let g:extradite_showhash=1


"let g:lightline = {
      "\ 'component_function': {
      "\   'filename': 'LightlineFilename',
      "\ }
      "\ }

function! LightlineFilename()
  return expand('%:.')
endfunction

" Use K to show documentation in preview window
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=500
" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap keys for gotos
nmap <silent> <leader>gh :call CocActionAsync('highlight')<cr>
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
imap <C-b> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <cr> pumvisible() && coc#expandable() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <d-i> coc#refresh()
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<c-k>"

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
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

"au User Ncm2Plugin call ncm2#register_source({
      "\ 'name' : 'ruby',
      "\ 'priority': 6,
      "\ 'scope': ['ruby'],
      "\ 'mark': 'ruby',
      "\ 'word_pattern': '[\w_]+',
      "\ 'complete_pattern': '\.',
      "\ 'on_complete': ['ncm2#on_complete#delay', 180, 'ncm2#on_complete#omni', 'rubycomplete#Complete'],
      "\ })

"au User Ncm2Plugin call ncm2#register_source({
      "\ 'name' : 'javascript',
      "\ 'priority': 6,
      "\ 'scope': ['javascript', 'javascript.jsx.html', 'javascript.jsx', 'js'],
      "\ 'mark': 'javascript',
      "\ 'word_pattern': '[\w_]+',
      "\ 'complete_pattern': '\.',
      "\ 'on_complete': ['ncm2#on_complete#delay', 180', ncm2#on_complete#omni', 'javascriptcomplete#CompleteJS'],
      "\ })

"**********************Plugin

" Required for operations modifying multiple buffers like rename.
"set hidden

"let g:LanguageClient_serverCommands = {
    "\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    "\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    "\ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
    "\ 'javascript.jsx.html': ['/usr/local/bin/javascript-typescript-stdio'],
    "\ 'python': ['/usr/local/bin/pyls'],
    "\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    "\ }

"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
"autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
"autocmd FileType javascript.jsx setlocal omnifunc=LanguageClient#complete
"autocmd FileType javascript.jsx.html setlocal omnifunc=LanguageClient#complete


"gem install solargraph
"if executable('solargraph')
  "" gem install solargraph
  "au User lsp_setup call lsp#register_server({
        "\ 'name': 'solargraph',
        "\ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        "\ 'initialization_options': {"diagnostics": "true"},
        "\ 'whitelist': ['ruby'],
        "\ })
"endif

"if executable('javascript-typescript-stdio')
  "au User lsp_setup call lsp#register_server({
        "\ 'name': 'javascript support using typescript-language-server',
        "\ 'cmd': { server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio --trace --logfile /Volumes/kude/fsdirect/jslangserver.log']},
        "\ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        "\ 'whitelist': ['javascript', 'javascript.jsx', 'javascript.jsx.html']
        "\ })
"endif

"npm install -g typescript typescript-language-server
"\ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio --tsserver-log-file /Volumes/kude/fsdirect/jslangserver.log']},
"if executable('typescript-language-server')
    "au User lsp_setup call lsp#register_server({
      "\ 'name': 'javascript support using typescript-language-server',
      "\ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      "\ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      "\ 'whitelist': ['javascript', 'javascript.jsx', 'javascript.jsx.html']
      "\ })
"endif

"let g:lsp_diagnostics_enabled = 0         " disable diagnostics support

"autocmd FileType ruby setlocal omnifunc=lsp#complete
"autocmd FileType javascript setlocal omnifunc=lsp#complete
"autocmd FileType javascript.jsx setlocal omnifunc=lsp#complete
"autocmd FileType javascript.jsx.html setlocal omnifunc=lsp#complete


"inoremap <silent> <expr> <CR> ncm2_snipmate#expand_or("\<CR>", 'n')
" wrap <Plug>snipMateTrigger so that it works for both completin and normal snippet
"inoremap <expr> <c-b> ncm2_snipmate#expand_or("\<Plug>snipMateTrigger", "m")
"let g:snips_no_mappings = 1
"vmap <c-j> <Plug>snipMateNextOrTrigger
"vmap <c-k> <Plug>snipMateBack
"imap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<Plug>snipMateNextOrTrigger"
"imap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<Plug>snipMateBack"
" c-j c-k for moving completion & snippet

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
"imap <silent> <expr> <CR> pumvisible() ? ncm2_ultisnips#expand_or("\<Plug>(MyCR)", 'im') : "\<CR>"

" c-j c-k for moving in snippet
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
"let g:UltiSnipsJumpForwardTrigger	= "<c-]>"
"let g:UltiSnipsJumpBackwardTrigger	= "<c-[>"
"let g:UltiSnipsExpandTrigger="<c-b>"
"let g:UltiSnipsRemoveSelectModeMappings = 0
"inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : UltiSnips#JumpForwards()
"inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : UltiSnips#JumpBackwards()

" Map ctrl-x_ctrl-p to keyword completin in complete, so that it matches words in other buffers.
inoremap <expr> <c-x><c-p> pumvisible() ? "\<c-e>\<c-p>" : "\<c-p>"

"let g:ncm2#complete_delay=60
"let g:ncm2#popup_delay=100


"inoremap <silent> <Plug>(MyCR) <CR><C-R>=AutoPairsReturn()<CR>
"inoremap <silent> <Plug>(MyCR) <CR>
"imap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<Plug>(MyCR)", 'im')
"inoremap <silent> <Plug>(MyCR) <C-R>=AutoPairsReturn()<CR> "without noselect
" example
"imap <expr> <CR> (pumvisible() ? "\<C-Y>\<Plug>(MyCR)" : "\<Plug>(MyCR)")
"imap <silent> <expr> <CR> pumvisible() ? ncm2_ultisnips#expand_or("\<Plug>(MyCR)", 'im') : "\<CR>"
"imap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>\<C-R>=AutoPairsReturn()<CR>", 'im')
"imap <silent> <expr> <CR> pumvisible() ? ncm2_ultisnips#expand_or("\<Plug>(MyCR)", 'im') : "\<CR>"
"inoremap <silent> <expr> <CR> ((pumvisible() && empty(v:completed_item)) ?  "\<c-y><c-\>" : (!empty(v:completed_item) ? ncm2_ultisnips#expand_or("\<Plug>(MyCR)", 'im') : "\<CR>" ))

"inoremap <silent> <expr> <c-\> ncm2_ultisnips#expand_or("\<Plug>(MyCR)", 'im')


"let g:ncm2#complete_length=[[1,2],[7,2]]
"autocmd BufEnter * call ncm2#enable_for_buffer()
"au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
"au User Ncm2PopupClose set completeopt=menuone
"set shortmess+=c
set dictionary+=/usr/share/dict/words

"inoremap <Tab> <C-R>=CleverTab()<CR>
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"noremap <leader>lc :LspWorkspaceSymbol<CR>
"noremap <leader>ls :LspDocumentSymbol<CR>
"noremap <leader>lh :LspHover<CR>
"noremap <leader>ld :LspDefinition<CR>
"noremap <leader>ll :LspReferences<CR>
"noremap <leader>ln :LspNextReference<CR>
"noremap <leader>lp :LspPreviousReference<CR>
autocmd WinEnter * if &buftype == 'quickfix' | nnoremap <buffer> <silent> q :ccl<CR> | endif

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

imap <expr> <TAB> pumvisible() ? "\<C-N>" : "\<C-R>=CleverTab('omni')<CR><C-R>=CleverTab('keyword')<CR><C-R>=CleverTab('next')<CR>"
"imap <c-o> <C-X><C-O>

nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1


"function! CleverTab()
  "if pumvisible()
    "return "\<C-N>"
  "endif
  "if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    "return "\<Tab>"
  "elseif exists('&omnifunc') && &omnifunc != ''
    "return "\<C-X>\<C-O>"
  "else
    "return "\<C-N>"
  "endif
"endfunction

noremap <c-p> :Files<cr>
noremap <leader>cp :Tags<CR>
"function! s:ag_with_opts(arg, bang)
  "let tokens  = split(a:arg)
  "let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"'))
  "let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
  "call fzf#vim#ag(query, ag_opts, a:bang ? {} : {'down': '40%'})
"endfunction

"function! s:AgOperator(type)
  "let prev_saved_val = @@
  "if a:type ==# 'v'
    "normal! `<v`>y
  "elseif a:type ==# 'char'
    "normal! `[v`]y
  "else
    "return
  "endif

  "silent execute "Ag! " . shellescape(@@) . ""
  "let @@ = prev_saved_val
"endfunction
"nnoremap <leader>a  :call s:ag_with_opts(expand("<cword>")
"nnoremap <leader>a  :exec "call fzf#vim#ag(expand('<cword>'))"<cr>
"vnoremap <leader>a  :<c-u>call <SID>AgOperator(visualmode())<cr>
"nnoremap <leader>A :Ag!<space>
nnoremap <leader>fd :set foldmethod=syntax<cr>
nnoremap <leader>fl :BLines<cr>
nnoremap <leader>fL :Lines<cr>
nnoremap <leader>m :Marks<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>ft :BTags<cr>
nnoremap <leader>fT :Tags<cr>
let g:fzf_history_dir = '~/.vim/fzf-history'
"autocmd VimEnter * command! -nargs=* -bang Ag call s:ag_with_opts(<q-args>, <bang>0)

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'IncSearch'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'TabLine'],
  \ 'hl+':     ['fg', 'IncSearch'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Cursor'],
  \ 'pointer': ['fg', 'Cursor'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:SuperTabDefaultCompletionType = "context"
"autocmd FileType *
      "\ if &omnifunc != '' |
      "\   call SuperTabChain(&omnifunc, "<c-p>", 1) |
      "\ endif
" open omni completion menu closing previous if open and opening new menu without changing the text
"inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            "\ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
"" open user completion menu closing previous if open and opening new menu without changing the text
"inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            "\ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

"function MyTagContext()
  "if filereadable(expand('%:p:h') . '/tags')
    "return "\<c-x>\<c-]>"
  "endif
  "" no return will result in the evaluation of the next
  "" configured context
"endfunction
"let g:SuperTabCompletionContexts = ['MyTagContext', 's:ContextText', 's:ContextDiscover']

"let g:SuperTabDefaultCompletionType = "context"
  "autocmd FileType *
    "\ if &omnifunc != '' |
    "\   call SuperTabChain(&omnifunc, "<c-p>") |
    "\ endif

colorscheme jellybeans
"color jellybeans+

"let g:syntastic_ruby_exec = 'ruby20'
"let g:syntastic_html_tidy_exec = 'tidy5'

"let g:ctrlp_by_filename = 1
"let g:ctrlp_root_markers = ['']
"let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = 'ag %s -l -U -g ""' " Use custom user command for list files, use .ignore in project to ignore files
let g:ctrlp_match_window = 'min:0,max:20,results:50'
let g:ctrlp_working_path_mode = 0
" g:ctrlp_custom_ignore is not working if g:ctrlp_user_command is set.
"let g:ctrlp_custom_ignore = {
      "\ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/]tmp$|\v[\/]node_modules$|\v[\/]public/packs|\v[\/]storage$',
      "\ 'file': '\.gz$\|\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
      "\ }

"Airline, always open status bar
set laststatus=2

noremap gb <c-^>
noremap ]b :bn<cr>
noremap [b :bp<cr>
noremap <leader>fw :FixWhitespace<CR>
noremap <leader>ct :!ctags -R .<CR>
noremap <leader>cT :!ctags -R -f gems.tags $(bundle show --paths)<CR>
noremap <leader>n :NERDTreeToggle<CR>
"noremap <leader>rt :TagbarToggle<CR>
noremap <leader>rl :set relativenumber!<CR>
"noremap <leader>cp :let g:ctrlptag_type='project' <bar> CtrlPTag<CR>
"noremap <leader>cP :let g:ctrlptag_type='all' <bar> CtrlPTag<CR>
"run rake default task, default is running test in current file
noremap <leader>rk :.Rake<CR>

command! Vimrc :vs $MYVIMRC
command! Terminal :terminal /bin/bash -il

"set shell=/bin/bash\ -il

augroup numbertoggle
  autocmd BufEnter,FocusGained,InsertLeave * if &l:number == 1 | set relativenumber | endif
  autocmd BufLeave,FocusLost,InsertEnter   * if &l:number == 1 | set norelativenumber | endif
augroup END

" ALE don't linting on every changes
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
"let g:ale_open_list= 1
" disable rubocop & erb check
let g:ale_linters = {
\   'ruby': ['brakeman', 'rails_best_practices', 'reek', 'ruby'],
\   'eruby': []
\}

let g:jsx_ext_required = 1

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
  "autocmd BufRead,BufNewFile *.js set ft=javascript
  "autocmd BufRead,BufNewFile *.jsx set ft=javascript.jsx.html
  autocmd BufRead,BufNewFile *.jsx set ft=javascript.jsx
  autocmd BufRead,BufNewFile *.rdoc setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd BufRead,BufNewFile *.rdoc set complete+=kspell
  autocmd BufRead,BufNewFile *.md set complete+=kspell

  autocmd BufRead,BufNewFile *.md setlocal omnifunc=
  au FileType markdown setlocal omnifunc=
augroup END



" Open ag.vim
nnoremap <leader>a  :Ag! <cword><cr>
vnoremap <leader>a  :<c-u>call <SID>AgOperator(visualmode())<cr>
nnoremap <leader>A :Ag!<space>
" Open quickfix widnow & type AsyncRun in command line
let g:asyncrun_open = 16
nnoremap <d-A> :AsyncRun -raw<space>
"vnoremap <d-r> :<c-u>'<,'>AsyncRun -raw ruby<cr>
"vnoremap <leader>R :<c-u>'<,'>AsyncRun -raw ruby<cr>
"nnoremap <leader>R :call asyncrun#quickfix_toggle(8)<cr>:AsyncRun<space>

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
"let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

"let g:airline_extensions = []
" cache airline highlight
"let g:airline_highlighting_cache = 1
"let g:airline#extensions#tagbar#enabled = 0
"**********************Plugin

"set undofile
set undodir=~/.vim/_undodir
set undofile
set undolevels=500 "maximum number of changes that can be undone

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

"html indent for vim 7.4
let g:html_indent_inctags = "html,body,head,tbody"

"D + j/k to move entire line down/up
nnoremap <D-j> :m .+1<CR>
nnoremap <D-k> :m .-2<CR>

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
  set guifont=Anonymous\ Pro:h15
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

  "set shell command options 'bash -ilc' so ~/.bash_profile get loaded
  set shellcmdflag=-ilc
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

function ExitCb(job, status)
  "exec 'keepjumps' bufwinnr('Asynccmdbuf') 'wincmd W'
  "normal gg
  "exec 'wincmd p'
endfunction
function! s:RunCommandAsync(cmd)
	if exists('s:async_job')
    if job_status(s:async_job) == 'run'
      if job_stop(s:async_job, 'term')
        unlet s:async_job
      end
    endif
  endif
  "echom '/bin/bash -ilc ' . escape(a:cmd) . '"'
  echom ['/bin/bash -ilc', a:cmd]
  let s:async_job = job_start(['/bin/bash', '-ilc', a:cmd], {'out_io': 'buffer', 'out_name': 'Asynccmdbuf', 'err_io': 'buffer', 'err_name': 'Asynccmdbuf', 'exit_cb': 'ExitCb'})
  if bufwinnr('Asynccmdbuf') > 0
    exec 'keepjumps' bufwinnr('Asynccmdbuf') 'wincmd W'
    exec 'normal! ggdG'
    silent put=('$ '. a:cmd)
    silent put=''
    exec 'wincmd p'
  else
    sbuffer Asynccmdbuf
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent normal gg
    silent put=('$ '. a:cmd)
    silent put=''
    noremap <buffer> q ZZ
    exec 'wincmd p'
  endif
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
"command! RunRuby call <SID>RunCommand('!ruby %:p')
command! RunRuby call <SID>RunCommandAsync('ruby '. expand('%:p'))
au FileType ruby nnoremap <buffer> <D-r> :RunRuby<CR>
vnoremap <D-r> :<c-u>call <SID>RunCommandAsync('ruby -e "' . escape(VisualSelection(), '"') . '"')<cr>

"Redirect output of ri to buffer when pressing K
if has("gui_running") && !has("gui_win32")
  au FileType ruby,haml setlocal keywordprg=:SHELL\ ri\ -T\ -f\ markdown

  "Generate ri documentation for gems in Gemfile. Note: bundler list --name-only is not working
  "let g:ri_command='for gem in $(bc ruby -e "Bundler.load.specs.each {|s| puts s.name.to_s + ''&'' + s.version.to_s }"); do name=$(cut -d''&'' -f1 <<< $gem); version=$(cut -d''&'' -f2 <<< $gem); gem rdoc --ri $name -v $version ;done'
  "command! Ri call asyncrun#quickfix_toggle(8) | execute "AsyncRun " . g:ri_command
  command! Ri :SHELL for gem in $(bc ruby -e "Bundler.load.specs.each {|s| puts s.name.to_s + ''&'' + s.version.to_s }"); do name=$(cut -d''&'' -f1 <<< $gem); version=$(cut -d''&'' -f2 <<< $gem); gem rdoc --ri $name -v $version ;done
  command! RubyDoc setlocal keywordprg=:SHELL\ ri\ -T\ -f\ markdown
endif

"run rails runner by CMD + R
"command! RunRailsRunner call <SID>RunCommand('!bundle exec rails r %:p')
command! RunRailsRunner call <SID>RunCommandAsync('bundle exec rails r ' . expand('%:p'))
au FileType ruby nnoremap <buffer> <D-R> :RunRailsRunner<CR>
vnoremap <D-R> :<c-u>call <SID>RunCommandAsync('bundle exec rails r "' . escape(VisualSelection(), '"') . '"')<cr>

"'SHELL shellcommand', redirect output to buffer
"command! -nargs=* -complete=shellcmd SH new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
"command! -nargs=* -complete=shellcmd SHELL call <SID>RunCommand('!<args>')
command! -nargs=* -complete=shellcmd SHELL call <SID>RunCommandAsync('<args>')
noremap <D-H> :SHELL<space>

command! LcdToCurrentFilePath lcd %:p:h
noremap <leader>cd :LcdToCurrentFilePath<CR>

nnoremap <leader>fn :!echo -n %:. \| pbcopy<cr>
nnoremap <leader>fN :!echo -n %:p \| pbcopy<cr>

" Comment it out because of slowness even less than 100 lines
"Set vertical line indicator for yaml & haml files
"au FileType yaml,haml setlocal cursorcolumn

"copy selected area to system clipboard for cli vi
"+y :w !pbcopy<CR><CR>
noremap <leader>y :w !pbcopy<CR><CR>

set wildmenu " visual autocomplete for command menu
"set showmatch " highlight matching [{()}]

" set highlight style for quickfix & cursorcolumn
highlight! link QuickFixLine StatusLineNC
highlight! link CursorColumn StatusLineNC

" press // in visual mode will search visual selected area
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


" jump to split without press ctrl-w
"nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" don't highlight search
nnoremap <Leader><space> :nohlsearch<Enter>

" Profile shortcut
"nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
"nnoremap <silent> <leader>DP :exe ":profile pause"<cr>
"nnoremap <silent> <leader>DC :exe ":profile continue"<cr>
"nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

nnoremap <D-g> :GoRun %<cr>

