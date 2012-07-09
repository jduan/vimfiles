" vim-pathogen
call pathogen#infect()

" p4 commands
nnoremap @p4a :!p4 add %
" nnoremap @p4e :!p4 edit %
nnoremap @p4r :!p4 revert %
nnoremap @p4d :!p4 diff %
map <C-n> :tn<cr>
map <F8> :!p4 edit %<cr>
map <F7> :!p4 diff %<cr>
map <F6> :!p4 revert %<cr>

" Other command mappings
map <C-p> :pwd<cr>

set ignorecase " set ic
set incsearch
" set hlsearch " highlight all matches for the pattern
syntax on
set cindent
set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%08O:%02B]
set laststatus=2
" map F10 to add a new word entry
abbr jj \bi<CR>\item<CR>\ei<Esc>kA
" tab completion: longest only
set wildmode=longest,list
" set wrap
set textwidth=80

"
" To make my own life easier, here's the list of keymappings provided by my
" setup:
"
" F1 - Previous file in buffer list
" F2 - Next file in buffer list
" F3 - Perldoc on the selected module
" F4 - Perldoc on the selected function
" F5 - Run the Perl compiler on the current file
" F6 - List all Perl compiler errors
" F7 - Previous Perl compiler error
" F8 - Next Perl compiler error
"
" (F9 and above are used by OS X to control various interface elements, namely
" Expose' and Dashboard).
"
" (these don't work in Terminal, and right now, I don't care why)
" Shift-F1   - Toggles paste mode
" Shift-F2   - Toggles the project browser
" Shift-F3   - Toggles the tabbed explorer bar
" Shift-F4   - Toggles the taglist (using ctags)
" Control-F1 - Run perltidy on the currently edited file or selection
"
" (these do work in Terminal though...)
" ,pb - Toggles the project browser
" ,tb - Toggles the tabbed explorer bar
" ,tl - Toggles the taglist (using ctags)
" ,pt - Run Perltidy on the currently edited file or selection
"
" Other useful commands:
" Control-A-# - Switch to buffer #
" Control-C - Comment selected lines
" Control-X - Uncomment selected lines
" --n - Insert name
" --e - Insert email address
" --w - Insert work email address
" --r - Insert revision tag
"
" Most of this was shamelessly stolen from rjbs.  Extra help from David Hand.
"
" Plugins used:
" - comments.vim (block commenting made easy)
" - minbufexpl (for a tab-like interface to buffers)
" - perl.vim (another interface to the Perl compiler)
" - perlhelp (Perldoc interface)
" - perl_synwrite (syntax-checks Perl before saving - use :W)
" - project (provides a project/tree explorer)
" - screen.vim (for screen-like buffer bindings)
" - taglist.vim (provides selectable list of subs using ctags)
"

"
" Set vim options
"
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
set laststatus=2         " always show status line
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
set title                " do set the xterm title (see 'titleold', set below)
set undolevels=1000      " LOTS of undo history
set wildignore+=*/CVS/   " don't try to descend into CVS directories
set wildignore+=*/SVN/   " don't try to descend into SVN directories
set wildmenu             " enable menu of completions
" set wildmode=longest:full,full
                         " complete only as much as is common,
                         " then show menu
set writeany             " avoid constant ! to overwrite. . .

colorscheme railscasts   " use railscasts color scheme
filetype plugin on       " use ftplugins, mostly for those in ~
filetype on
syntax on                " enable syntax highlighting
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

set statusline=[%n]\ %{ModifiedFlag()}%f\ %=%h%r%w\ (%l,%v)\ %P\

"
" Perl code folding options
"
" let perl_fold=1
" let perl_include_pod=1

"
" Because I don't like to type much. . .
"
iabbr --r -- Jason, <C-R>=strftime("%Y-%m-%d")<CR>
iabbr --n Jason A. Crome
iabbr --e cromedome@cpan.org
iabbr --w crome@devnetinc.com

"
" Version 7 things
"
if v:version >= 700
    nnoremap @ :set cursorcolumn! cursorline!<CR>
    let loaded_matchparen = 1
endif

"
" Plugin configuration!
"

" perl_synwrite
silent call system("perl -e0 -MVi::QuickFix=silent")
let perl_synwrite_qf = ! v:shell_error   " use Vi::QuickFix if it can be used

" Perl compiler settings
autocmd BufNewFile,BufRead *.p? compiler perl
autocmd BufNewFile,BufRead *.t  compiler perl

map <F5> :CtrlPClearAllCaches<CR>
" map <F6> :clist<CR>
" map <F7> :cprevious<CR>
" map <F8> :cnext<CR>

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
nnoremap <leader>l :TlistToggle<CR>
" added by jduan
" If you have multiple tag files (across different projects), or your
" current working directory changes, it is useful to have vim search
" recursively upwards for the tags file.
" set tags=tags;/
set tags+=tags;
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

let mapleader = ","
nnoremap <leader>a :Ack\ 
nnoremap <leader>q gqip "format paragraph

" NERD_tree
" show list on the right side
" let g:NERDTreeWinPos = "right"
" Press '\n' to toggle NERDTree
map <Leader>n :NERDTreeToggle<CR>
" close vim when the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" use solarized.vim color scheme
" set background=dark
" colorscheme solarized

" Press ;; to exit insert mode
:imap ;; <Esc>

" turn on cursor line
" set cursorline

" bufferexplorer: use relative path
let g:bufExplorerShowRelativePath=1

" restore cursor position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" <leader>W to remove all trailing white spaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" auto remove trailing spaces upon save
" autocmd BufWritePre * :%s/\s\+$//e

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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
