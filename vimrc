autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,perl,tex set shiftwidth=2
 
autocmd FileType c,cpp,java,javascript,python,xml,xhtml,html set shiftwidth=2
 
augroup filetypedetect
  au! BufNewFile,BufRead *.ch setf cheat
  au BufNewFile,BufRead *.liquid setf liquid
  au! BufRead,BufNewFile *.haml setfiletype haml
  autocmd BufNewFile,BufRead *.yml setf eruby
  autocmd BufRead,BufNewFile *.prawn set filetype=ruby
  autocmd BufRead,BufNewFile *.rsel set filetype=ruby
augroup END
 
" autocmd BufNewFile,BufRead *_test.rb source ~/.vim/ftplugin/shoulda.vim

autocmd BufNewFile,BufRead *.mxml compiler flex 
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript

augroup END
 
autocmd BufNewFile,BufRead *_test.rb source ~/.vim/ftplugin/shoulda.vim
"use \rci in normal mode to indent ruby code,should install kode ,sudo gem
"install kode
nmap <leader>rci :%!ruby-code-indenter<cr>
 
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" Load matchit (% to bounce from do to end, etc.)
runtime! plugin/matchit.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Command for spec execution with <leader>
let g:rubytest_cmd_spec = "spec -f specdoc %p" 
 
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
 
set nocompatible          " We're running Vim, not Vi!
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
set guitablabel=%M%t
set nobackup
set noswapfile
set guifont=Monaco:h12
set guitablabel=%M%t
set nobackup
set nowritebackup
set path=$PWD/public/**,$PWD/**
filetype plugin indent on " Enable filetype-specific indenting and plugins
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set guioptions-=m
set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,%n%Y%)\%P
set laststatus=2

map <C-q> :mksession! ~/.vim/.session <cr>
map <C-//> map ,# :s/^/#/<CR>
map <S-//> :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR><Esc>:nohlsearch<CR>
imap <M-Up> :tabn<CR>
imap <M-Down> :tabp<CR>
imap <c-s> <esc><c-s>

"set guioptions-=T
set guioptions-=T
if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256
  colorscheme ir_black 
  set lines=57
  set columns=237
  set transparency=8
else
  let g:CSApprox_loaded = 0
  colorscheme ir_black
endif


if $COLORTERM == 'gnome-terminal'
  set term=ansi "gnome-256color
  set term=gnome-256color
  colorscheme ir_black
else
  colorscheme ir_black
endif

syntax on                 " Enable syntax highlighting
 
" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim
set nonumber
 
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

nmap <F2> :NERDTreeToggle<CR>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <C-B> :BufExplorer<cr>

"map to fuzzy finder text mate stylez
nnoremap <c-f> :FuzzyFinderTextMate<CR>

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

map <leader>b :FuzzyFinderBuffer<CR>
map <leader>] :FuzzyFinderMruFile<CR>
map <leader>r :ruby finder.rescan!<CR>
map ,t :Rake<CR>

let g:proj_flags="imstg"
let g:fuzzy_ceiling=20000
let g:fuzzy_matching_limit=25
let g:fuzzy_ignore = "gems/*, log/*"
set cursorline

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
set foldlevel=1

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
 
" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" BEGIN rails-toolkit settings
runtime debian.vim
runtime macros/rails-toolkit.vim
" " END rails-toolkit setting

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list
" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
 
" gvim specific
set mousehide  " Hide mouse after chars typed
"set mouse=a  " Mouse in all modes

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>


"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal g`\""
        endif
    end
endfunction

"define :Lorem command to dump in a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum

"define :HighlightExcessColumns command to highlight the offending parts of
"lines that are "too long". where "too long" is defined by &textwidth or an
"arg passed to the command
command! -nargs=? HighlightExcessColumns call s:HighlightExcessColumns('<args>')
function! s:HighlightExcessColumns(width)
    let targetWidth = a:width != '' ? a:width : &textwidth
    if targetWidth > 0
        exec 'match Todo /\%>' . (targetWidth+1) . 'v/'
    else
        echomsg "HighlightExcessColumns: set a &textwidth, or pass one in"
    endif
endfunction

"simple template system
command! -complete=customlist,<SID>AvailableTemplates -n=1
            \ Template :call <SID>InsertTemplate('<args>')

function! <SID>InsertTemplate(name)
    "read in the template
    execute 'read ~/.vim/templates/' . &filetype . '/' . a:name

    "if the cursor was previously on a blank line, delete it
    if getline(line(".")-1) =~ '^\s*$'
        exec line(".")-1 . 'd'
    endif
endfunction

function! <SID>AvailableTemplates(lead, cmdline, cursorpos)
    let templateDir = expand('~/.vim/templates/' . &filetype . '/')
    let files = split(globpath(templateDir, a:lead . '*'), '\n')

    "chop off the templateDir from each file
    return map(files, 'strpart(v:val,strlen(templateDir))')
endfunction

" CTRL-R reloads the ~/.vimrc file
nnoremap <C-R> :source ~/.vimrc
inoremap <C-R> <C-O>:source ~/.vimrc
vnoremap <C-R> <C-C>:source ~/.vimrc

"  reloads the snippets definitions
nnoremap <C-N> :source ~/.vim/after/plugin/snipMate.vim
inoremap <C-R> <C-O>:source ~/.vim/after/plugin/snipMate.vim
vnoremap <C-R> <C-C>:source ~/.vim/after/plugin/snipMate.vim

" CTRL-T and CTRL-D indent and unindent blocks
inoremap <C-D> <C-O><LT><LT>
nnoremap <C-D> <LT><LT>
vnoremap <C-T> >
vnoremap <C-D> <LT>

" CTRL-Z undoes even in visual/selection mode
vnoremap <C-Z> <C-C>

" Run Rspec for the current spec file
function! RunRspec()
ruby << EOF
  buffer = VIM::Buffer.current
  spec_file=VIM::Buffer.current.name
  command = "ruby ~/.vim/bin/run_rspec.rb #{spec_file}"
  print "Running Rspec for #{spec_file}. Results will be displayed in Firefox."
  system(command)
EOF
endfunction
map <F7> :call RunRspec()<cr>

let g:browser = 'firefox -new-tab '     
" Open the Ruby ApiDock page for the word under cursor, in a new Firefox tab
function! OpenRubyDoc(keyword)
  let url = 'http://apidock.com/ruby/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction           
noremap RB :call OpenRubyDoc(expand('<cword>'))<CR>

" Open the Rails ApiDock page for the word under cursos, in a new Firefox tab
function! OpenRailsDoc(keyword)
  let url = 'http://apidock.com/rails/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap RR :call OpenRailsDoc(expand('<cword>'))<CR>

" Change the word under cursor
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" To save, ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a


" Reload SnipMate snippets!!
function! ReloadSnippets( snippets_dir, ft )
    if strlen( a:ft ) == 0
        let filetype = "_"
    else
        let filetype = a:ft
    endif

    call ResetSnippets()
    call GetSnippets( a:snippets_dir, filetype )
endfunction
source ~/.vim/snippets/support_functions.vim

nmap <F13> :call ReloadSnippets(snippets_dir, &filetype)<CR>

" Align Ruby hashes
vmap ah :Align =><CR>

" Execute open rspec buffer
" Thanks to Ian Smith-Heisters
function! RunSpec(args)
 if exists("b:rails_root") && filereadable(b:rails_root . "/script/spec")
   let spec = b:rails_root . "/script/spec"
 else
   let spec = "spec"
 end 
 let cmd = ":! " . spec . " % -cfn " . a:args
 execute cmd 
endfunction

" Mappings
" run one rspec example or describe block based on cursor position
map <leader>! :call RunSpec("-l " . <C-r>=line('.')<CR>)
" run full rspec file
map <leader>!! :call RunSpec("")

set statusline+=%{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" NeoComplCache options
" Use neocomplcache.
let g:NeoComplCache_EnableAtStartup = 0
" Use smartcase.
let g:NeoComplCache_SmartCase = 1
" Use camel case completion.
let g:NeoComplCache_EnableCamelCaseCompletion = 1
" Use underbar completion.
let g:NeoComplCache_EnableUnderbarCompletion = 1
" Set minimum syntax keyword length.
let g:NeoComplCache_MinSyntaxLength = 6
" Max results
let g:NeoComplCache_MaxList = 6 
let g:NeoComplCache_KeywordCompletionStartLength = 6
let g:NeoComplCache_IgnoreCase = 0
let g:NeoComplCache_EnableWildCard = 0

" Define dictionary.
let g:NeoComplCache_DictionaryFileTypeLists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:NeoComplCache_KeywordPatterns')
    let g:NeoComplCache_KeywordPatterns = {}
endif
let g:NeoComplCache_KeywordPatterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-l>     <Plug>(neocomplcache_snippets_expand)
smap <C-l>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

