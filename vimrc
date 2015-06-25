source ~/.vimrc.vundle

set background=dark

"**********************Plugin
colorscheme base16-default
"color jellybeans+

"let g:syntastic_ruby_exec = 'ruby20'

let g:ctrlp_max_depth = 40
"let g:ctrlp_by_filename = 1
"let g:ctrlp_root_markers = ['']
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\.gz$\|\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
      \ }


"Airline, always open status bar
set laststatus=2

map <leader>fw :FixWhitespace<CR>
map <leader>ct :!ctags -R .<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>rt :TagbarToggle<CR>

let g:syntastic_html_tidy_exec = 'tidy5'

let g:ragtag_global_maps = 1

"**********************Plugin

"color bigbang
let did_load_csvfiletype=0

function Rand()
  let s:color_file_list = split(substitute(globpath(&runtimepath, 'colors/*.vim'), '\', '/', 'g'), '\n')

  redir => s:b
  ruby print "#{rand(Time.now.to_i % 60)}"
  redir END

  let s:b = split(s:b, '\n')[0]
  let s:file = s:color_file_list[s:b]

  exec 'source' s:file
  unlet! s:color_file_list
  unlet! s:b
  unlet! s:file
endfunction

set undofile
set undodir=~/.vim/_undodir
set undolevels=1000 "maximum number of changes that can be undone

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


autocmd BufRead,BufNewFile *.rdoc setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rdoc set complete+=kspell
autocmd BufRead,BufNewFile *.md set complete+=kspell

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
  set go=aAce              " 去掉难看的工具栏和滑动条
  "set showtabline=2        " 开启自带的tab栏
  set transparency=20       "设置透明度
  set linespace=2

  "call Rand()
  "hi Normal guibg=Black guifg=White
  "hi Normal guibg=White guifg=Black

  " Don't beep
  set visualbell
endif


