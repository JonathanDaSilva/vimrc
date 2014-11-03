" Basic Options      {{{
set nocompatible
set runtimepath=$VIM/vim74,~/.vim/
let mapleader=','
set backspace=2
set autoread autowrite
set wrap textwidth=0 linebreak
set clipboard=unnamed
set ignorecase smartcase
set nohlsearch
" Edit Vimrc and reload vimrc
nnoremap <Leader>ev <ESC>:e $myvimrc<CR>
nnoremap <Leader>o  <ESC>:so $myvimrc<CR>
nnoremap <Leader>af <ESC>:so %<CR>
" Indent
set autoindent smartindent
set tabstop=2 shiftwidth=2 expandtab
set shiftround
" fileencoding
set encoding=utf-8 fileencoding=utf-8
set ff=dos ffs=dos
" Keep selection while indent
vnoremap < <gv
vnoremap > >gv
let $profile = "D:/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"

" }}}
" Shortcut           {{{

" Search and center
nnoremap n nzz
" Alphabetical sorting selection
vnoremap <leader><leader>s :sort<cr>
" Resize
nnoremap <C-S-l> :vertical resize +5<CR>
nnoremap <C-S-h> :vertical resize -5<CR>
" Help coding
inoremap .. ->
inoremap ... ..
" Window Spliting
noremap wc  <C-w>h
noremap wt  <C-w>j
noremap ws  <C-w>k
noremap wr  <C-w>l
noremap wd  <Esc>:close<CR>
noremap w<Space> <Esc>:vsplit<CR>
noremap w<CR> <Esc>:split<CR>
" New Tab shortcut
noremap <leader>nt :tabnew<CR>
" Switching between highlight search or not
map <Leader><Leader><Space> :set hlsearch!<CR>
" Save
nnoremap <C-s> <ESC>:w!<CR>
inoremap <C-s> <ESC>:w!<CR>
vnoremap <C-s> <ESC>:w!<CR>
" Quit
nnoremap <C-w> <ESC>:q<CR>
inoremap <C-w> <ESC>:q<CR>
vnoremap <C-w> <ESC>:q<CR>
" CTags
noremap <F10> <ESC>:silent call vimproc#system('ctags -R')<CR>

" }}}
" WildIgnore         {{{

set wildignore =*\\tmp\\*,**\\sass-cache\\**        " Temporary directory
set wildignore+=**\\node_modules\\**,**\\build\\**  " *******************
set wildignore+=**\\bower_components\\**            " *******************
set wildignore+=**\\vendor\\**,**\\packages\**      " *******************

set wildignore+=*.psd,*.ai,*.pdf                    " Adobe files

set wildignore+=.hg,.git,.svn                       " Version control
set wildignore+=*.aux,*.out,*.toc                   " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg      " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest    " compiled object files
set wildignore+=*.zip,*.tar*,*.rar,*.7z             " archive
set wildignore+=*.spl                               " compiled spelling word lists
set wildignore+=*.swp                               " Vim swap files
set wildignore+=.DS_Store                           " OSX bullshit
set wildignore+=Thumbs.db                           " Windows bullshit

set wildignore+=*.luac                              " Lua byte code

set wildignore+=migrations                          " Django migrations
set wildignore+=*.pyc                               " Python byte code

"}}}
" Fold Options       {{{

set foldtext=MyFoldText()
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap <silent> <Leader><space> zm

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount. "…"
endfunction " }}}

" }}}
" Plugins Options    {{{

"   NeoBundle          : The package manager                                  {{{
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
call neobundle#end()
NeoBundleFetch 'Shougo/neobundle.vim'
let g:neobundle#types#git#clone_depth=1
nnoremap <Leader>bi :Unite neobundle/install<CR>
nnoremap <Leader>bu :Unite neobundle/update<CR>
nnoremap <Leader>bc :NeoBundleClean<CR>
nnoremap <Leader>bs :Unite neobundle/search -start-insert<CR>
" }}}
"   Vimproc            : A dll for Shougo plugins                             {{{
NeoBundle 'Shougo/vimproc'
" }}}
"   CtrlP              : Fuzzy Finder                                         {{{
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mattn/ctrlp-git'
let ctrlp#git#system_function = 'vimproc#system'
let g:ctrlp_cmd = 'CtrlPGit'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
noremap <C-i> <ESC>:CtrlPGitFiles<CR>
noremap <C-u> <ESC>:CtrlPTag<CR>
" }}}
"   YouCompleteMe      : AutoCompletion                                       {{{
NeoBundle 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion   = ['<c-j>']
let g:ycm_key_list_previous_completion = ['<c-k>']
let g:ycm_key_invoke_completion        = '<C-Space>'
let g:ycm_use_ultisnips_completer      = 1
" }}}
"   UltiSnips          : The best snippets manager                            {{{
NeoBundle 'SirVer/ultisnips'
let g:UltiSnipsEditSplit           = "vertical"
let g:UltiSnipsSnippetsDir         = expand("~/.vim/ultisnips/")
set runtimepath+=~/.vim/ultisnips/ " Need to point to the parent pythonx directory script
nnoremap <Leader>es <ESC>:UltiSnipsEdit<CR>
" }}}
"   Unite              : An incredible interface                              {{{
NeoBundle 'unite.vim'
let g:unite_source_history_yank_enable = 1
let g:unite_enable_short_source_names = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
nnoremap <leader>uh :<C-u>Unite history/yank -start-insert<CR>
noremap  <C-y> <Esc>:Unite file -start-insert<CR>
"}}}
"   Tabular            : Automaticly align caracter                           {{{
NeoBundle 'godlygeek/tabular'
vnoremap <Leader>= <ESC>:Tabular /=<CR>
vnoremap <Leader><Leader>= <ESC>:Tabular /=><CR>
vnoremap <Leader>: <ESC>:Tabular /:<CR>
vnoremap <Leader><Leader>: <ESC>:Tabular /:\zs<CR>
" }}}
"   Airline            : Display a beautiful statusline                       {{{
NeoBundle 'bling/vim-airline'
set laststatus=2
" }}}
"   Emmet              : Expand HTML code                                     {{{
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType jinja,html EmmetInstall
let g:user_emmet_leader_key='<C-l>'
" }}}
"   MultipleCursor     : Provide MultiCursor of ST                            {{{
NeoBundle 'terryma/vim-multiple-cursors'
" }}}
"   Commantary         : Comment your files                                   {{{
NeoBundle 'tpope/vim-commentary'
" }}}
"   EasyMotion         : Move quickly into your files                         {{{
NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader><Leader><Leader>'
let g:EasyMotion_mapping_f = '<Leader>t'
let g:EasyMotion_mapping_F = '<Leader>s'
" }}}
"   IndentGuide        : Display indent guides                                {{{
NeoBundle 'nathanaelkane/vim-indent-guides'
autocmd VimEnter * IndentGuidesToggle
let g:indent_guide_start_level=2
let g:indent_guides_guide_size=1
" }}}
"   DelimitMate        : Automaticly close everything                         {{{
NeoBundle 'Raimondi/delimitMate'
" }}}
"   MatchTagAlways     : Always found the closing tag                         {{{
NeoBundle 'Valloric/MatchTagAlways'
" }}}
"   ChooseWin          : Easy switching between tabs and split                {{{
NeoBundle 't9md/vim-choosewin'
nnoremap - <ESC>:ChooseWin<CR>
vnoremap - <ESC>:ChooseWin<CR>
" }}}
"   WhiteSpace         : Showing whitespace and delete it automitcly          {{{
NeoBundle 'ntpeters/vim-better-whitespace'
autocmd VimEnter * ToggleStripWhitespaceOnSave
autocmd VimEnter,VimLeave unite ToggleWhitespace
" }}}

" }}}
" Apparence Options  {{{

NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'nanotech/jellybeans.vim'

if has('vim_starting')
    colorscheme Tomorrow-Night-Eighties
endif

" No interface, just the frame
set go=""
" Hide my mouse I don't use it
set mousehide

set guifont=Source\ Code\ Pro\ Medium:h14
syntax on
set synmaxcol=800

" Display number and relative number
set relativenumber
set number

" }}}
" Filetype Options   {{{

"   Vim {{{
autocmd! BufRead,BufNewFile *.vim,vimrc,_vimrc set foldmethod=marker foldmarker={{{,}}} foldlevel=0 foldenable noautoindent
autocmd FileType vim set commentstring=\"\ %s
" }}}

"   Text {{{
autocmd FileType text set filetype=markdown
" }}}
"   MarkDown {{{
NeoBundle 'tpope/vim-markdown'
" }}}

"   QML {{{
NeoBundle 'peterhoeg/vim-qml'
" }}}

"   HTML {{{
NeoBundle 'othree/html5.vim'
autocmd FileType html set commentstring=<!--\ %s\ -->
" }}}
"   Jade {{{
NeoBundle 'digitaltoad/vim-jade'
au BufNewFile,BufRead,BufWrite *.jade set filetype=jade
autocmd FileType jade set commentstring=//-\ %s
" }}}
"   Json {{{
NeoBundle 'leshill/vim-json'
autocmd BufWrite,BufRead,BufNewFile *.json set filetype=json
" }}}
"   PHP {{{
autocmd FileType php set commentstring=//\ %s
autocmd FileType php set tabstop=4 shiftwidth=4
" }}}
"   Ruby {{{
autocmd BufWrite,BufRead,BufNewFile Berksfile   set filetype=ruby
autocmd BufWrite,BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd FileType ruby set commentstring=#\ %s
" }}}
"   Twig Template {{{
NeoBundle 'lepture/vim-jinja'
autocmd BufWrite,BufRead,BufNewFile *.twig set filetype=jinja
autocmd FileType jinja set commentstring={#\ %s\ #}
" }}}
"   Sass {{{
NeoBundle 'tpope/vim-haml'
autocmd BufWrite,BufRead,BufNewFile *.sass set filetype=sass
autocmd FileType sass set commentstring=//\ %s
" }}}
"   JS {{{
autocmd FileType javascript set commentstring=//\ %s
" }}}
"   CoffeeScript {{{
NeoBundle 'kchmck/vim-coffee-script'
au BufNewFile,BufRead,BufWrite *.coffee set filetype=coffee
autocmd FileType coffee set commentstring=#\ %s
" }}}
"   Grunt {{{
au BufNewFile,BufRead,BufWrite Gruntfile.* set filetype=grunt.coffee
" }}}

"   PowerShell {{{
NeoBundle 'PProvost/vim-ps1'
autocmd BufWrite,BufRead,BufNewFile *.ps1 set filetype=ps1
autocmd BufWrite,BufRead,BufNewFile *.psm1 set filetype=ps1
autocmd FileType ps1 set commentstring=#\ %s
" }}}
"   DosIni {{{
autocmd BufWrite,BufRead,BufNewFile *.ini set filetype=dosini
autocmd FileType dosini set commentstring=;%s
"   }}}

" }}}
" BackUp             {{{

set history=1000
set undolevels=500
set backup noswapfile undofile

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

" }}}
" BÉPO KeyBoard      {{{

"    Escape
inoremap <C-c> <Esc>
"    Navigation
noremap c h
noremap t gj
noremap s gk
noremap r l
"    Mouvement
noremap e e
noremap a b
noremap A ^
noremap æ ^
noremap E $
"    Change Motion
noremap v c
noremap V C
"    Delete Motion
noremap d d
noremap D D
"    Till Motion
noremap l t
noremap L T
"    Visual Mode
noremap q v
noremap Q V
"    Replace Motion
noremap h r
noremap H R
"    UP/Down
noremap T <C-D>
noremap S <C-U>
"    Undo/Redo
noremap b <ESC>:redo<CR>
noremap é <ESC>:undo<CR>
"    Insert Mode
noremap u a
noremap U A
noremap i i
noremap I I
vnoremap i I

" }}}
