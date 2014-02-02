" Basic Options      {{{

set nocompatible
set runtimepath=$VIM/vim74,~/.vim/,~/.vim/bundle/neobundle.vim/,~/.vim/snippets/
let mapleader=','
set backspace=2
set autoread autowrite
set wrap textwidth=0 linebreak
set clipboard=unnamed
set ignorecase smartcase
set hlsearch
" Edit Vimrc and reload vimrc
nnoremap <Leader>ev <ESC>:e $myvimrc<CR>
nnoremap <Leader>o  <ESC>:so $myvimrc<CR>
nnoremap <Leader>af <ESC>:so %<CR>
" Indent
set autoindent smartindent
set tabstop=4 shiftwidth=4 expandtab
set shiftround
" fileencoding
set encoding=utf-8 fileencoding=utf-8
set ff=dos ffs=dos
" Keep selection while indent
vnoremap < <gv
vnoremap > >gv

" }}}
" Shortcut           {{{

nnoremap n nzz
" Resize
nnoremap <C-S-l> :vertical resize +5<CR>
nnoremap <C-S-h> :vertical resize -5<CR>
" Help coding
inoremap <C-v> ..
inoremap .. ->
noremap <Leader>a o<ESC><Up>
" Window
noremap wc  <C-w>h
noremap wt  <C-w>j
noremap ws  <C-w>k
noremap wr  <C-w>l
noremap wd  <Esc>:close<CR>
noremap w<Space> <Esc>:vsplit<CR>
noremap w<CR> <Esc>:split<CR>
" Clear Search
map <Leader><Leader><Space> :nohl<CR>
" Mouve lines
nnoremap <up> ddkkp
nnoremap <down> ddp
nnoremap <right> >>
nnoremap <left> <<
" Save
nnoremap <C-s> <ESC>:w!<CR>
inoremap <C-s> <ESC>:w!<CR>
vnoremap <C-s> <ESC>:w!<CR>
" Quit
nnoremap <C-w> <ESC>:q<CR>
inoremap <C-w> <ESC>:q<CR>
vnoremap <C-w> <ESC>:q<CR>

" }}}
" WildIgnore         {{{

set wildignore =*\\tmp\\*,**\\sass-cache\\**        " Temporay directory
set wildignore+=**\\node_modules\\**,**\\build\\**  " ******************
set wildignore+=**\\bower_components\\**            " ******************

set wildignore+=*.psd,*.ai,*.pdf                    " Adobe file

set wildignore+=*.html,*.js,*.css                   " Most of the time I use preprocessor so don't care

set wildignore+=.hg,.git,.svn                       " Version control
set wildignore+=*.aux,*.out,*.toc                   " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg      " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest    " compiled object files
set wildignore+=*.zip,*.tar.*,*.tar,*.rar,*.7z      " archive
set wildignore+=*.spl                               " compiled spelling word lists
set wildignore+=*.swp                               " Vim swap files
set wildignore+=*.DS_Store                          " OSX bullshit

set wildignore+=*.luac                              " Lua byte code

set wildignore+=migrations                          " Django migrations
set wildignore+=*.pyc                               " Python binary

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

"   NeoBundle          : The package manager                       {{{
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
let g:neobundle#install_max_processes = 2
" mapping
nnoremap <Leader>bi :Unite neobundle/install<CR>
nnoremap <Leader>bu :Unite neobundle/update<CR>
nnoremap <Leader>bc :NeoBundleClean<CR>
nnoremap <Leader>bs :Unite neobundle/search -start-insert<CR>
" }}}
"   Vimproc            : A dll for Shougo plugins                  {{{
NeoBundle 'Shougo/vimproc'
" }}}
"   CtrlP              : Fuzzy Finder                              {{{
NeoBundle 'kien/ctrlp.vim'
" }}}
"   YouCompleteMe      : AutoCompletion                            {{{
NeoBundle 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion   = ['<c-j>']
let g:ycm_key_list_previous_completion = ['<c-k>']
let g:ycm_key_invoke_completion        = '<C-Space>'
let g:ycm_use_ultisnips_completer      = 1
" }}}
"   UltiSnips          : The best snippets manager                 {{{
NeoBundle 'SirVer/ultisnips'
let g:UltiSnipsUsePythonVersion    = 2
let g:UltiSnipsEditSplit           = "vertical"
let g:UltiSnipsSnippetsDir         = expand("~/.vim/snippets/")
let g:UltiSnipsSnippetDirectories  = ["snippets"]
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
nnoremap <Leader>es <ESC>:UltiSnipsEdit<CR>
" }}}
"   Unite              : An incredible interface                   {{{
NeoBundle 'unite.vim'
let g:unite_source_history_yank_enable = 1
let g:unite_enable_short_source_names = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
nnoremap <leader>uh :<C-u>Unite history/yank -start-insert<CR>
"}}}
"   Tabular            : Automaticly align caracter                {{{
NeoBundle 'godlygeek/tabular'
vnoremap <Leader>= <ESC>:Tabular /=<CR>
vnoremap <Leader><Leader>= <ESC>:Tabular /=><CR>
vnoremap <Leader>: <ESC>:Tabular /:<CR>
vnoremap <Leader><Leader>: <ESC>:Tabular /:\zs<CR>
" }}}
"   NERDTree           : A sidebar filemanager                     {{{
NeoBundle 'scrooloose/nerdtree'
let g:NERDTreeMapOpenInTab="j"
let g:NERDTreeMapOpenVSplit="k"
noremap <Leader>nt <ESC>:NERDTreeToggle<CR>
noremap <F3> <ESC>:NERDTree<CR>
" }}}
"   Airline            : Display a beautiful statusline            {{{
NeoBundle 'bling/vim-airline'
set laststatus=2
" }}}
"   Emmet              : Expand HTML code                          {{{
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType jinja,html EmmetInstall
" }}}
"   MultipleCursor     : Provide MultiCursor of ST                 {{{
NeoBundle 'terryma/vim-multiple-cursors'
" }}}
"   Commantary         : Comment your files                        {{{
NeoBundle 'tpope/vim-commentary'
" }}}
"   EasyMotion         : Move quickly into your files              {{{
NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader><Leader><Leader>'
let g:EasyMotion_mapping_f = '<Leader>t'
let g:EasyMotion_mapping_F = '<Leader>s'
" }}}
"   IndentGuide        : Display indent guides                     {{{
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guide_start_level=2
let g:indent_guides_guide_size=1
" }}}
"   AutoClose          : Automaticly close everything              {{{
NeoBundle 'Townk/vim-autoclose'
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

set guifont=Source\ Code\ Pro\ Medium:h12
syntax on
set synmaxcol=800

" Display number and relative number
set relativenumber
set number

" Show invisible caracterset list
set nolist listchars=eol:¬
set lazyredraw
set matchtime=3

" }}}
" Filetype Options   {{{

"   Vim {{{
autocmd! BufRead,BufNewFile *.vim,vimrc,_vimrc set foldmethod=marker foldmarker={{{,}}} foldlevel=0 foldenable noautoindent
" autocmd! BufWrite *.vim,vimrc,_vimrc source %
autocmd FileType vim set commentstring=\"\ %s
" }}}

"   Text {{{
autocmd FileType text set filetype=markdown
" }}}
"   MarkDown {{{
NeoBundle 'tpope/vim-markdown'
" }}}

"   HTML {{{
NeoBundle 'othree/html5.vim'
" }}}
"   Jade {{{
NeoBundle 'digitaltoad/vim-jade'
au BufNewFile,BufRead,BufWrite *.jade set filetype=jade
autocmd FileType jade set commentstring=//-\ %s
autocmd FileType jade set tabstop=2 shiftwidth=2
" }}}
"   Json {{{
NeoBundle 'leshill/vim-json'
" }}}
"   PHP {{{
autocmd FileType php set commentstring=//\ %s
" }}}
"   Blade Template {{{
NeoBundle 'xsbeats/vim-blade'
" }}}
"   Twig Template {{{
NeoBundle 'lepture/vim-jinja'
autocmd BufWrite,BufRead,BufNewFile *.twig set filetype=jinja
" }}}
"   Sass {{{
NeoBundle 'tpope/vim-haml'
autocmd BufWrite,BufRead,BufNewFile *.sass set filetype=sass
" }}}
"   JS {{{
au BufNewFile,BufRead,BufWrite *.js set tabstop=2 shiftwidth=2
" }}}
"   CoffeeScript {{{
NeoBundle 'kchmck/vim-coffee-script'
au BufNewFile,BufRead,BufWrite *.coffee set filetype=coffee
autocmd FileType coffee set tabstop=2 shiftwidth=2
autocmd FileType coffee set commentstring=#\ %s
" }}}

"   PowerShell {{{
NeoBundle 'PProvost/vim-ps1'
autocmd BufWrite,BufRead,BufNewFile *.ps1 set filetype=ps1
autocmd FileType ps1 set commentstring=#\ %s
" }}}
"   DosIni {{{
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

" Need to test or configure
NeoBundle 'sjl/splice.vim'
