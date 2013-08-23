" vim-pathogen
call pathogen#infect()

" disable 'highlighting the matching paren'
let loaded_matchparen=1

let mapleader = ","
" Ack the word under cursor
nnoremap <leader>a :Ack! --ignore-dir coverage --ignore-dir node_modules --ignore-dir build <cword><CR>
  \ 'dir':  'build$\|node_modules$\|coverage$\|\.pyc$\|\.swp$\|\.git$\|\.hg$\|\.svn$',
nnoremap <leader>be :BufExplorer<CR>
" capslock.vim: turn caps on and off
" default behavior is to disable caps lock when leaving insert mode
imap <leader>c <Plug>CapsLockToggle
" Switch CWD to the directory of the open buffer:
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" foreplay.vim
nmap <leader>e :Eval<cr>
nnoremap <leader>eb :EasyBuffer<CR>
nnoremap <leader>g :Git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gc :Gcommit
" gundo plugin
nnoremap <leader>gu :GundoToggle<CR>
map <Leader>n :NERDTreeToggle<CR>
map <leader>p :set paste<CR>
map <leader>pp :set nopaste<CR>
nnoremap <leader>q gqip
nnoremap <leader>t :Tabularize /
vnoremap <leader>t :Tabularize /
" make file read only
nnoremap <leader>ro :set nomodifiable<CR>
" <leader>W to remove all trailing white spaces
nnoremap <leader>rs :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>rw :set modifiable<CR>
" open up a shell inside vim
nnoremap <leader>sh :ConqueTerm zsh<CR>
" saveas to the path of the current file
command! -nargs=1 SaveasSamePath exe "sav " . expand("%:p:h") . "/" .  expand("<args>")
nmap <leader>ss :SaveasSamePath
nnoremap <leader>tl :TlistToggle<CR>
" tagbar
nnoremap <leader>tb :TagbarToggle<CR>
" in command mode, double leader to go to previous file
nnoremap <leader><leader> <c-^>
" fast save a buffer
nmap <leader>w :w<cr>
nmap <leader>wa :wa<cr>



" Other command mappings
map <C-p> :pwd<cr>

" make searches case-sensitive only if they contain upper-case letters
set ignorecase smartcase
set incsearch
set hlsearch " highlight all matches for the pattern
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <Space> :nohlsearch<cr>
endfunction"
call MapCR()
autocmd! CmdwinEnter * :unmap <cr>
autocmd! CmdwinLeave * :call MapCR()
set cindent
set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %{fugitive#statusline()}\ %a%=\ [%l,%c%V](%P)\ [%08O:%02B]
set laststatus=2
" mappings
imap jj \bi<CR>\item<CR>\ei<Esc>kA

set autoindent           " carry over indenting from previous line
set backspace=2          " allow backspace beyond insertion point
set background=dark      " console bg is dark
set backupdir=/tmp       " put backups in /tmp
set backupdir-=.         " ...and not in cwd
set cinkeys-=0#          " don't unindent cpp stuff (perl comments!)
set clipboard+=unnamed   " put yanks/etc on the clipboard
set comments=b://,b:#    " by default allow C++ (JS) and generic unixy comments
set com+=s1:/*,mb:*,ex:*/  " ...and also C-style comments
set copyindent           " make autoindent use the same characters to indent
set directory=/tmp       " store temp files someplace out of the way
set directory-=.         " . . .and don't store temp files in cwd
set encoding=utf-8       " unicode
set foldcolumn=0         " no fold column
set foldlevelstart=0     " start with all folds closed
set formatoptions=r      " r - re-insert comment leader on newline
set formatprg=par        " use 'par' to format text with 'gq'
set guioptions+=agimrLt  " make vim act like a gui when started like one
set hidden               " hide, don't close, undisplayed buffers
set history=50           " keep 50 lines of command history
set more                 " page on extended output
set novb                 " disable visual bell
set nowrap               " don't automatically wrap lines
set number               " turn on line numbering
set path=.,$HOME,,       " for editing with :find
set pastetoggle=<S-F1>   " Shift-F1 to toggle paste
set report=1             " Always report changes
set ruler                " display cursor position
set showcmd              " show command-in-progress
set showmode             " show the current input mode
set showmatch            " Automagically show matching brackets
set expandtab            " spaces, not tabs!
set softtabstop=4        " make four spaces act like tabs
set tabstop=4            " The One True Tab (as of latest revision)
set shiftwidth=4         " affects what happens when you press >>, << etc
set terse
set timeout              " allow keys to timeout
set timeoutlen=500       " millisecs, time out between 2 keystrokes
set title                " do set the xterm title (see 'titleold', set below)
set undolevels=1000      " LOTS of undo history
set wildignore+=*/CVS/   " don't try to descend into CVS directories
set wildignore+=*/SVN/   " don't try to descend into SVN directories
set wildignorecase       " When set case is ignored when completing file names and directories.
set wildmenu             " enable menu of completions
" set wildmode=longest:full,full
                         " complete only as much as is common,
                         " then show menu
" tab completion: longest only
set wildmode=longest,list
" set wrap
set textwidth=80
set writeany             " avoid constant ! to overwrite. . .

set t_Co=256             " 256 colors
colorscheme railscasts   " use railscasts color scheme
au BufNewFile,BufRead *.wsdl set filetype=xml

if has("win32")
    let Tlist_Ctags_Cmd='C:\Progra~1\ctags\ctags.exe'
    map <M-Space> :simalt ~<CR>
elseif has("macunix")
    " the Carbon clipboard is screwed up, and messes up newlines
    set cb=
endif

" exec'd because ... could it work otherwise?
exec "set titleold=" . matchstr(hostname(), "^[^.]\\+")

" use a UTF-8 term if you can
if $TERM_PROGRAM == "Apple_Terminal"
  set tenc=utf-8
endif

"
" Arrow macros
"
map! ^K ^VESCO
map! ^VESC^B ESCbi
map! ^VESC^F ESCEa
map! ^VESCOA ^VESCka
map! ^VESCOB ^VESCja
map! ^VESCOC ^VESClli
map! ^VESCOD ^VESCi
map ^V^? x
map ^VESCOH 0
map ^VESCOF $
map ^VESC[H 0
map ^VESC[F $
map [H I
map [F A

"
" Use fonts that don't make my eyes bleed
"
if has("gui_running")
    if has("macunix")
        set guifont=ProFont:h9
    elseif has("win32")
        set guifont=ProFontWindows:h11:b:cANSI,Lucida_Console:h11:b:cANSI
    elseif has("x11")
        set guifont=-jmk-neep-bold-r-normal--15-*-*-*-*-*-*-*
    endif
endif

"
" Act more like a pager when invoked as one
"
if (v:progname == "view")
    nmap <Space> <PageDown>
    nmap b       <PageUp>
    nmap q       :q<CR>
endif

"
" Configure status line
"
function ModifiedFlag()
    if (&modified)
        return "*"
    else
        return " "
    endif
endfunc

" create shortcuts
"iabbr --r -- Jason, <C-R>=strftime("%Y-%m-%d")<CR>
"iabbr --n Jason A. Crome
"iabbr --e cromedome@cpan.org
"iabbr --w crome@devnetinc.com

" perl_synwrite
silent call system("perl -e0 -MVi::QuickFix=silent")
let perl_synwrite_qf = ! v:shell_error   " use Vi::QuickFix if it can be used

" Perl compiler settings
autocmd BufNewFile,BufRead *.p? compiler perl
autocmd BufNewFile,BufRead *.t  compiler perl

" ctrlp
map <F5> :CtrlPClearAllCaches<CR>
let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_mruf_exclude = '/tmp/.*\|*build*'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'build$\|coverage$\|\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.class$\|\.exe$\|\.swp$\|\.pyc$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" minibufexplorer settings
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplSplitBelow=0
let g:miniBufExplDebugLevel=0
map <F1> :MBEbp<cr>
"map <F2> :MBEbn<cr>
map <S-F3> :TMiniBufExplorer<cr>
map <silent> ,tb :TMiniBufExplorer<CR>

" Project settings
let g:proj_window_width = 50
nmap <silent> <S-F2> <Plug>ToggleProject
map <silent> ,pb <Plug>ToggleProject

" ctags settings
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Inc_Winwidth=0
let Tlist_Show_One_File=1
let Tlist_Exist_OnlyWindow=1
let Tlist_Use_Right_Window=0
let Tlist_Sort_Type="name"
let Tlist_Display_Prototype=0
let Tlist_Compact_Format=1 " Compact?
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Display_Tag_Scope=1
let Tlist_Close_On_Select=0
let Tlist_Enable_Fold_Column=0
let TList_WinWidth=50
map <F4> :TlistToggle<CR>
" added by jduan
" If you have multiple tag files (across different projects), or your
" current working directory changes, it is useful to have vim search
" recursively upwards for the tags file.
" set tags=tags;/
set tags+=tags;
" map Ctrl-n to finding the next tag
map <C-n> :tnext<CR>

" Along those same lines, I like for vim to change directory to
" whatever file I'm currently editing. This makes it easier to search
" for related files in the same directory - and so that :n .<Enter>
" does what's expected. It also allows the recursive tag searching
" (just mentioned above) to work properly if you edit multiple
" projects - just put the tags file at the top of each project.
" autocmd BufEnter * lcd %:p:h

" perldoc settings
let perlhelp_prog='/usr/bin/perldoc'
nmap <silent> <unique> ,pf <Plug>PerlHelpFuncNormal
vmap <silent> <unique> ,pf <Plug>PerlHelpFuncVisual
nmap <silent> <unique> ,pm <Plug>PerlHelpModNormal
vmap <silent> <unique> ,pm <Plug>PerlHelpModVisual
"nmap <silent> <unique> <F3> <Plug>PerlHelpModNormal
"vmap <silent> <unique> <F3> <Plug>PerlHelpModVisual
"nmap <silent> <unique> <F4> <Plug>PerlHelpFuncNormal
"vmap <silent> <unique> <F4> <Plug>PerlHelpFuncVisual

" perltidy settings
nnoremap <silent> ,pt :%!perltidy -q<Enter>
vnoremap <silent> ,pt :!perltidy -q<Enter>
nnoremap <silent> <C-F1> :%!perltidy -q<Enter>
vnoremap <silent> <C-F1> :!perltidy -q<Enter>


" vim-ruby
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby

" load cscope
cscope add cscope.out

" NERD_tree
" show list on the right side
" let g:NERDTreeWinPos = "right"

" close vim when the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" ignore node_modules/ directory
let NERDTreeIgnore=['node_modules$[[dir]]']

" use solarized.vim color scheme
set background=light
colorscheme solarized

" Press ;; to exit insert mode
:imap ii <Esc>

" turn on cursor line
set cursorline

" bufferexplorer: use relative path
let g:bufExplorerShowRelativePath=1

" restore cursor position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" auto remove trailing spaces upon save
" autocmd BufWritePre * :%s/\s\+$//e

" rainbow parentheses: this plugin conflicts with VimClojure
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" vim-slime
let g:slime_target = "tmux"

" vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" 1. highlight trailing whitespace in red
" 2. have this highlighting not appear whilst you are typing in insert mode
" 3. have the highlighting of whitespace apply when you open new buffers
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" use w! save with sudo
cmap w! w !sudo tee % >/dev/null

" coffeetags for coffeescript
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" clear screen before running a command
map :! :!clear;

" switch to previous window in insert mode
inoremap <C-^> <Esc><C-^>

"Here is an example that can be added to your .vimrc which will setup the
"supertab chaining for any filetype that has a provided |omnifunc| to
"first try that, then fall back to supertab's default, <c-p>, completion:
  autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
    \ endif

" create ~/.vim_undodir if it doesn't exist yet
silent !mkdir ~/.vim_undodir > /dev/null 2>&1
" persistent undo
set undodir=~/.vim_undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" make 'crontab -e' work on Mac
au FileType crontab set nobackup nowritebackup

" vimclojure
let g:vimclojure#HighlightBuiltins=1
let g:vimclojure#ParenRainbow=1
let g:vimclojure#DynamicHighlighting=1
" let vimclojure#NailgunClient = "/home/babilen/bin/ng"
" let vimclojure#WantNailgun = 1
let vimclojure#SplitPos = "right"
let vimclojure#FuzzyIndent = 1
" use clojure plugin to format Racket files
au BufNewFile,BufRead,BufReadPost *.rkt,*.rktl set filetype=clojure

" swap the current word with the next one without changing cursor position
:nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
" swap the current word with the previous, keeping cursor on current word
:nnoremap <silent> gb "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

" disable c-n mapping for the multichange plugin
let g:multichange_mapping = ''

" This lets me set a macro by first wacking qq, then q to finish, and then
" replay it by wacking space.
" noremap <Space> @q

" make the gutter space cleaner
highlight clear SignColumn

" syntastic coffeelint
let g:syntastic_coffee_coffeelint_args="--csv -f /Users/jingjing.duan/.coffeelint.json"
let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_javascript_jslint_conf = "--sloppy --vars"

" scala format
au BufEnter *.scala setl formatprg=java\ -jar\ ~/scripts/scalariform.jar\ --stdin\ --stdout

" EasyMotion
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade  Comment
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" vim-session
" automatically save the current session when quiting vim
:let g:session_autosave = 'yes'
" don't open the "default" or prompt for anything when starting vim
:let g:session_autoload = 'no'
" Enable aliases from SessionOpen to OpenSession and etc
:let g:session_command_aliases = 1

" show vertical line for column 80
set colorcolumn=80

" use relative number
set relativenumber

" format json: visually select a region and hit j
vmap <leader>j !python -m json.tool<CR>

" Avoid scrolling when switch buffers
" When switching buffers, preserve window view.
" http://vim.wikia.com/wiki/Avoid_scrolling_when_switch_buffers
if v:version >= 700
  au BufLeave * if !&diff | let b:winview = winsaveview() | endif
  au BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | endif
endif
