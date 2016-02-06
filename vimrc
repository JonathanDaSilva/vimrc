" Basic Options      {{{
set nocompatible
let mapleader=','
set backspace=2
set autoread autowrite
set wrap textwidth=0 linebreak
set clipboard=unnamed
set ignorecase smartcase
set nohlsearch
set scrolloff=7
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

let $profile = $PSProfile

" }}}
" Shortcut           {{{

" Search and center
nnoremap n nzz
" Alphabetical sorting selection
vnoremap <leader><leader>s :sort<cr>
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
noremap <F10> <ESC>:silent call vimproc#system('ctags -R --fields=+l')<CR>

" }}}
" WildIgnore         {{{

set wildignore =*\\tmp\\*,**\\sass-cache\\**        " Temporary directory
set wildignore+=**\\node_modules\\**                " *******************
set wildignore+=**\\bower_components\\**            " *******************
set wildignore+=**\\typing\\**                      " *******************
set wildignore+=**\\jspm_packages\\**               " *******************
set wildignore+=**\\vendor\\**,**\\packages\**      " *******************
set wildignore+=**\\lib\\**                         " *******************
set wildignore+=**\\build\\**,**\\build-*\\**       " *******************

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
NeoBundleFetch 'Shougo/neobundle.vim'
nnoremap <Leader>bi :Unite neobundle/install<CR>
nnoremap <Leader>bu :Unite neobundle/update<CR>
nnoremap <Leader>bc :NeoBundleClean<CR>
nnoremap <Leader>bs :Unite neobundle/search -start-insert<CR>
"   }}}
"   Vimproc            : A dll for Shougo plugins                             {{{
NeoBundle 'Shougo/vimproc'
"   }}}

"   Unite              : An incredible interface                              {{{
NeoBundle 'unite.vim'
let g:unite_source_history_yank_enable = 1
let g:unite_enable_short_source_names = 1
let g:unite_winheight = 15
let g:unite_split_rule = 'botright'
nnoremap <leader>uh :<C-u>Unite history/yank -start-insert<CR>
noremap  <C-y> <Esc>:Unite file -start-insert<CR>
"   }}}
"   CtrlP              : Fuzzy Finder                                         {{{
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
noremap <C-i> <ESC>:CtrlPLine<CR>
noremap <C-u> <ESC>:CtrlPBufTag<CR>
noremap <Leader>at <ESC>:CtrlPBufTagAll<CR>
noremap <C-p> <ESC>:CtrlP<CR>
"   }}}
"   YouCompleteMe      : AutoCompletion                                       {{{
NeoBundle 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion               = ['<c-j>', '<Down>']
let g:ycm_key_list_previous_completion             = ['<c-k>', '<Up>']
let g:ycm_key_invoke_completion                    = '<C-Space>'
let g:ycm_complete_in_comments                     = 1
let g:ycm_use_ultisnips_completer                  = 1
let g:ycm_collect_identifiers_from_tags_files      = 1
let g:ycm_confirm_extra_conf                       = 0
let g:ycm_global_ycm_extra_conf                    = '~/.vim/.ycm_extra_conf.py'
let g:ycm_cache_omnifunc                           = 1
let g:ycm_enable_diagnostic_signs                  = 1
let g:ycm_min_num_of_chars_for_completion          = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

noremap <Leader>d <ESC>:YcmDiags<CR>
"   }}}
"   Zeal               : Documentation                                        {{{
NeoBundle 'KabbAmine/zeavim.vim'
let g:zv_zeal_executable = "C:\\Program Files (x86)\\Zeal\\zeal.exe"
"   }}}

"   Fugitive           : Git Manager                                          {{{
NeoBundle 'tpope/vim-fugitive'
"   }}}
"   GitGutter          : Show sign for change in files                        {{{
NeoBundle 'airblade/vim-gitgutter'
noremap <Leader>gt <Esc>:GitGutterLineHighlightsToggle<CR>
noremap <Leader>gs <Esc>:GitGutterStageHunk<CR>
"   }}}
"   Unite-giti         : Show sign for change in files                        {{{
NeoBundle 'kmnk/vim-unite-giti'
noremap <Leader>gg <Esc>:Unite giti -start-insert<CR>
"   }}}

"   EditorConfig       : Synchronise configuration between multiple editor    {{{
NeoBundle 'editorconfig/editorconfig-vim'
autocmd VimEnter,BufEnter,BufLeave,BufNewFile,BufWrite,Filetype * EditorConfigReload
let g:EditorConfig_exec_path = "C:\Program Files (x86)\editorconfig\bin\editorconfig.exe"
let g:EditorConfig_verbose = 0
"   }}}
"   Syntastic          : Synthax Checker                                      {{{
NeoBundle 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        Errors
    endif
endfunction
nnoremap <silent> <Leader>r :<C-u>call ToggleErrors()<CR>
"   }}}
"   UltiSnips          : The best snippets manager                            {{{
NeoBundle 'SirVer/ultisnips'
let g:UltiSnipsEditSplit           = "vertical"
let g:UltiSnipsSnippetsDir         = expand("~/.vim/ultisnips/")
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
set runtimepath+=~/.vim/ultisnips/ " Need to point to the parent pythonx directory script
nnoremap <Leader>es <ESC>:UltiSnipsEdit<CR>
"   }}}
"   Tabular            : Automaticly align caracter                           {{{
NeoBundle 'godlygeek/tabular'
vnoremap <Leader>= <ESC>:Tabular /=<CR>
vnoremap <Leader><Leader>= <ESC>:Tabular /=><CR>
vnoremap <Leader>: <ESC>:Tabular /:<CR>
vnoremap <Leader><Leader>: <ESC>:Tabular /:\zs<CR>
"   }}}
"   Emmet              : Expand HTML code                                     {{{
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType * EmmetInstall
let g:user_emmet_expandabbr_key = '<C-l>'
"   }}}
"   Commantary         : Comment your files                                   {{{
NeoBundle 'tpope/vim-commentary'
"   }}}

"   MultipleCursor     : Provide MultiCursor of ST                            {{{
NeoBundle 'terryma/vim-multiple-cursors'
"   }}}
"   EasyMotion         : Move quickly into your files                         {{{
NeoBundle 'easymotion/vim-easymotion'
let g:EasyMotion_skipfoldedline = 0
let g:EasyMotion_smartcase = 1
map <Leader>t <Plug>(easymotion-bd-f)
map <Leader>s <Plug>(easymotion-bd-jk)
map <Leader>n <Plug>(easymotion-sn)
"   }}}
"   ChooseWin          : Easy switching between tabs and split                {{{
NeoBundle 't9md/vim-choosewin'
noremap - <ESC>:ChooseWin<CR>
vnoremap - <ESC>:ChooseWin<CR>
"   }}}

"   IndentGuide        : Display indent guides                                {{{
NeoBundle 'nathanaelkane/vim-indent-guides'
autocmd VimEnter,BufEnter,BufLeave,BufNewFile,BufWrite,Filetype * IndentGuidesEnable
let g:indent_guide_start_level=2
let g:indent_guides_guide_size=1
"   }}}
"   DelimitMate        : Automaticly close everything                         {{{
NeoBundle 'Raimondi/delimitMate'
let delimitMate_expand_cr    = 1
let delimitMate_expand_space = 1
"   }}}
"   Airline            : Display a beautiful statusline                       {{{
NeoBundle 'bling/vim-airline'
set laststatus=2
"   }}}
"   WhiteSpace         : Showing whitespace and delete it automitcly          {{{
NeoBundle 'ntpeters/vim-better-whitespace'
autocmd VimEnter * ToggleStripWhitespaceOnSave
autocmd VimEnter,VimLeave unite ToggleWhitespace

noremap <Leader>ww <Esc>:StripWhitespace<CR>
"   }}}

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
set number
set norelativenumber

" }}}
" Filetype Options   {{{
"   Vim {{{
autocmd BufRead,BufNewFile *.vim,vimrc,_vimrc set filetype=vim
autocmd FileType vim set foldmethod=marker
autocmd FileType vim set foldmarker={{{,}}}
autocmd FileType vim set foldlevel=0
autocmd FileType vim set foldenable
autocmd FileType vim set noautoindent
autocmd FileType vim set nosmartindent
autocmd FileType vim set commentstring=\"%s
"   }}}
"   PowerShell {{{
NeoBundle 'PProvost/vim-ps1'
autocmd BufRead,BufNewFile *.ps1,*.psm1 set filetype=ps1
autocmd FileType ps1 set commentstring=#%s
autocmd FileType ps1 set tabstop=2 shiftwidth=2
"   }}}

"   Avisynth {{{
autocmd BufRead,BufNewFile *.avs set filetype=avs
autocmd FileType avs set commentstring=#%s
autocmd FileType avs set tabstop=2 shiftwidth=2
"   }}}

"   MarkDown && Text {{{
NeoBundle 'tpope/vim-markdown'
autocmd FileType text set filetype=markdown
autocmd FileType markdown let b:delimitMate_matchpairs   = "(:)"
autocmd FileType markdown let delimitMate_nesting_quotes = ['"']
"   }}}

"   CMake {{{
NeoBundle 'jansenm/vim-cmake'
autocmd FileType cmake set commentstring=#%s
autocmd FileType cmake set tabstop=2 shiftwidth=2
"   }}}
"   C++ {{{
NeoBundle 'peterhoeg/vim-qml'
autocmd BufRead,BufNewFile *.hpp set filetype=hpp.cpp
autocmd BufRead,BufNewFile *.qml set filetype=qml
autocmd BufRead,BufNewFile *.qrc set filetype=qrc.xml
autocmd FileType cpp set commentstring=//%s
autocmd FileType qml set commentstring=//%s
autocmd FileType cpp let b:delimitMate_matchpairs   = "(:),{:}"
autocmd FileType cpp let delimitMate_nesting_quotes = ['"']
autocmd FileType cpp set tabstop=2 shiftwidth=2
autocmd FileType qml set tabstop=2 shiftwidth=2
"   }}}

"   HTML {{{
NeoBundle 'othree/html5.vim'
autocmd FileType html set commentstring=<!--\ %s\ -->
autocmd FileType html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
autocmd FileType html let delimitMate_nesting_quotes = ['"', "'"]
autocmd FileType html set tabstop=2 shiftwidth=2
"   }}}
"   Twig Template {{{
NeoBundle 'lepture/vim-jinja'
autocmd BufRead,BufNewFile,BufWrite *.twig set filetype=jinja
autocmd FileType jinja set commentstring={#\ %s\ #}
autocmd FileType jinja let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
autocmd FileType jinja let delimitMate_nesting_quotes = ['"', "'"]
autocmd FileType jinja set tabstop=2 shiftwidth=2
"   }}}
"   Jade {{{
NeoBundle 'digitaltoad/vim-jade'
autocmd BufRead,BufNewFile *.jade set filetype=jade
autocmd FileType jade set commentstring=//-%s
autocmd FileType jade set tabstop=2 shiftwidth=2
"   }}}

"   PHP {{{
autocmd FileType php set commentstring=//%s
autocmd FileType php set tabstop=4 shiftwidth=4
"   }}}
"   Ruby {{{
autocmd BufRead,BufNewFile Vagrantfile set filetype=vagrant.ruby
autocmd FileType ruby set commentstring=#%s
autocmd FileType ruby set tabstop=4 shiftwidth=4
"   }}}
"   Python {{{
autocmd FileType python set commentstring=#%s
autocmd FileType python set tabstop=4 shiftwidth=4
"   }}}

"   Sass {{{
NeoBundle 'tpope/vim-haml'
autocmd BufRead,BufNewFile *.sass set filetype=sass
autocmd FileType sass set commentstring=//%s
autocmd FileType sass set tabstop=2 shiftwidth=2
autocmd FileType sass set foldmethod=marker
autocmd FileType sass set foldmarker={{{,}}}
"   }}}

"   JavaScript {{{
NeoBundle 'othree/yajs.vim'
autocmd FileType javascript set commentstring=//%s
autocmd FileType javascript set tabstop=2 shiftwidth=2
"   }}}
"   CoffeeScript {{{
NeoBundle 'kchmck/vim-coffee-script'
autocmd BufRead,BufNewFile *.coffee set filetype=coffee
autocmd FileType coffee set commentstring=#%s
autocmd FileType coffee set tabstop=2 shiftwidth=2
"   }}}
"   TypeScript {{{
NeoBundle 'leafgarland/typescript-vim'
autocmd BufRead,BufNewFile *.ts set filetype=typescript
autocmd FileType typescript set tabstop=4 shiftwidth=4
autocmd FileType typescript set commentstring=//%s
autocmd FileType typescript set foldmethod=syntax
autocmd FileType typescript set foldlevel=1
autocmd FileType typescript set foldnestmax=2
autocmd BufRead,BufNewFile *.spec.ts set foldnestmax=3
autocmd FileType typescript set foldenable

let g:syntastic_typescript_tsc_args       = '--project '.getcwd()
let g:syntastic_typescript_tsc_fname      = ""
let g:syntastic_typescript_tsc_args_after = ""
"   }}}

"   Grunt {{{
autocmd BufRead,BufNewFile Gruntfile.coffee set filetype=grunt.coffee
autocmd BufRead,BufNewFile Gruntfile.js set filetype=grunt.javascript
"   }}}
"   Gulp {{{
autocmd BufRead,BufNewFile Gulpfile.coffee set filetype=gulp.coffee
autocmd BufRead,BufNewFile Gulpfile.js set filetype=gulp.javascript
"   }}}

"   Json {{{
NeoBundle 'leshill/vim-json'
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd FileType json set tabstop=2 shiftwidth=2
"   }}}
"   Yaml {{{
NeoBundle 'chase/vim-ansible-yaml'
autocmd FileType yaml set tabstop=2 shiftwidth=2
autocmd FileType yaml set commentstring=#\ %s
"   }}}
"   DosIni {{{
autocmd BufRead,BufNewFile *.ini set filetype=dosini
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
call neobundle#end()
