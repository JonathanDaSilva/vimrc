" Basic Options      {{{
set nocompatible
set hidden
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
if has('vim_starting')
  set encoding=utf-8 fileencoding=utf-8
endif
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
noremap <leader>nt <Esc>:tabnew<CR>
noremap <C-t> <Esc>:tabnew<CR>
noremap <C-Tab> <Esc>:tabnext<CR>
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
set wildignore+=**\\typings\\**                     " *******************
set wildignore+=**\\jspm_packages\\**               " *******************
set wildignore+=**\\vendor\\**,**\\packages\**      " *******************
set wildignore+=**\\lib\\**                         " *******************
set wildignore+=**\\build\\**,**\\build-*\\**       " *******************

set wildignore+=*.psd,*.ai,*.pdf                    " Adobe files

set wildignore+=.hg,.git,.svn,*.orig                " Version control
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

"   Plug               : The package manager                                  {{{
set runtimepath+=~/.vim/
call plug#begin(expand('~/.vim/bundle'))
nnoremap <Leader>bi :PlugInstall<CR>
nnoremap <Leader>bu :PlugUpdate<CR>
nnoremap <Leader>bc :PlugClean<CR>
"   }}}
"   Vimproc            : A dll for Shougo plugins                             {{{
Plug 'Shougo/vimproc.vim', { 'do': 'mingw32-make' }
"   }}}
"   Unite              : An incredible interface                              {{{
Plug 'unite.vim'
let g:unite_source_history_yank_enable = 1
let g:unite_enable_short_source_names = 1
let g:unite_winheight = 15
let g:unite_split_rule = 'botright'
nnoremap <leader>uh :<C-u>Unite history/yank -start-insert<CR>
noremap  <C-y> <Esc>:Unite file -start-insert<CR>
"   }}}
"   CtrlP              : Fuzzy Finder                                         {{{
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0

noremap <C-i> <ESC>:CtrlPLine<CR>
noremap <C-u> <ESC>:CtrlPBufTag<CR>
noremap <Leader>at <ESC>:CtrlPBufTagAll<CR>
noremap <C-p> <ESC>:CtrlP<CR>
"   }}}
"   YouCompleteMe      : AutoCompletion                                       {{{
Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --omnisharp-completer --tern-completer --clang-completer' }
let g:ycm_key_list_select_completion               = ['<c-j>', '<Down>']
let g:ycm_key_list_previous_completion             = ['<c-k>', '<Up>']
let g:ycm_key_invoke_completion                    = '<C-Space>'
let g:ycm_complete_in_comments                     = 1
let g:ycm_use_ultisnips_completer                  = 1
let g:ycm_collect_identifiers_from_tags_files      = 0
let g:ycm_confirm_extra_conf                       = 0
let g:ycm_global_ycm_extra_conf                    = '~/.vim/.ycm_extra_conf.py'
let g:ycm_cache_omnifunc                           = 1
let g:ycm_enable_diagnostic_signs                  = 1
let g:ycm_min_num_of_chars_for_completion          = 0
let g:ycm_autoclose_preview_window_after_insertion = 0

noremap <leader>d <ESC>:YcmCompleter GetDoc<CR>
noremap <leader>l <ESC>:YcmCompleter GoToDefinition<CR>
"   }}}
"   Zeal               : Documentation                                        {{{
Plug 'KabbAmine/zeavim.vim'
let g:zv_zeal_executable = "C:\\Program Files (x86)\\Zeal\\zeal.exe"
let g:zv_file_types = {
            \ 'typescript'            : 'javascript,typescript',
            \ '^(G|g)runtfile\.'      : 'grunt',
            \ '^(G|g)ulpfile\.'       : 'gulp',
            \ '^(md|mdown|mkd|mkdn)$' : 'markdown',
        \ }
"   }}}
"   Grepper            : Grep                                                 {{{
Plug 'mhinz/vim-grepper'
noremap <leader>gt <Esc>:Grepper -tool git -query TODO:<CR>
noremap <leader>gt <Esc>:Grepper -tool git -query FIXME:<CR>
noremap <leader>gg <Esc>:Grepper -tool git<CR>

"   }}}

"   GitGutter          : Show sign for change in files                        {{{
Plug 'airblade/vim-gitgutter'
"   }}}

"   EditorConfig       : Synchronise configuration between multiple editor    {{{
Plug 'editorconfig/editorconfig-vim'
autocmd VimEnter,BufEnter,BufLeave,BufNewFile,BufWrite,Filetype * EditorConfigReload
let g:EditorConfig_exec_path = "C:\Program Files (x86)\editorconfig\bin\editorconfig.exe"
let g:EditorConfig_verbose = 0
"   }}}
"   Syntastic          : Synthax Checker                                      {{{
Plug 'scrooloose/syntastic', { 'commit': '663fea9dc9371d574f1a4a6ba15cc9e60ebbe510' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
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
Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit           = "vertical"
let g:UltiSnipsSnippetsDir         = expand("~/.vim/ultisnips/")
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
set runtimepath+=~/.vim/ultisnips/ " Need to point to the parent pythonx directory script
nnoremap <Leader>es <ESC>:UltiSnipsEdit<CR>
"   }}}
"   Tabular            : Automaticly align caracter                           {{{
Plug 'godlygeek/tabular'
vnoremap <Leader>= <ESC>:Tabular /=<CR>
vnoremap <Leader><Leader>= <ESC>:Tabular /=><CR>
vnoremap <Leader>: <ESC>:Tabular /:<CR>
vnoremap <Leader><Leader>: <ESC>:Tabular /:\zs<CR>
"   }}}
"   Emmet              : Expand HTML code                                     {{{
Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType * EmmetInstall
let g:user_emmet_expandabbr_key = '<C-l>'
"   }}}
"   Commantary         : Comment your files                                   {{{
Plug 'tpope/vim-commentary'
silent! unmap cgc
"   }}}

"   MultipleCursor     : Provide MultiCursor of ST                            {{{
Plug 'terryma/vim-multiple-cursors'
"   }}}
"   EasyMotion         : Move quickly into your files                         {{{
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_skipfoldedline = 0
let g:EasyMotion_smartcase = 1
map <Leader>t <Plug>(easymotion-bd-f)
map <Leader>s <Plug>(easymotion-bd-jk)
map <Leader>n <Plug>(easymotion-sn)
"   }}}
"   ChooseWin          : Easy switching between tabs and split                {{{
Plug 't9md/vim-choosewin'
noremap - <ESC>:ChooseWin<CR>
vnoremap - <ESC>:ChooseWin<CR>
"   }}}

"   IndentGuide        : Display indent guides                                {{{
Plug 'nathanaelkane/vim-indent-guides'
autocmd VimEnter,BufEnter,BufLeave,BufNewFile,BufWrite,Filetype * IndentGuidesEnable
let g:indent_guide_start_level=2
let g:indent_guides_guide_size=1
"   }}}
"   DelimitMate        : Automaticly close everything                         {{{
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr    = 1
let delimitMate_expand_space = 1
"   }}}
"   Airline            : Display a beautiful statusline                       {{{
Plug 'bling/vim-airline'
set laststatus=2
"   }}}
"   WhiteSpace         : Showing whitespace and delete it automitcly          {{{
Plug 'ntpeters/vim-better-whitespace'
autocmd VimEnter * ToggleStripWhitespaceOnSave
autocmd VimEnter,VimLeave unite ToggleWhitespace

noremap <Leader>ww <Esc>:StripWhitespace<CR>
"   }}}

" }}}
" Apparence Options  {{{

Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'nanotech/jellybeans.vim'

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
Plug 'PProvost/vim-ps1'
autocmd BufRead,BufNewFile *.ps1m set filetype=ps1
autocmd BufRead,BufNewFile *.ps1  set filetype=ps1
autocmd FileType ps1 set commentstring=#%s
autocmd FileType ps1 set tabstop=2 shiftwidth=2
"   }}}

"   Avisynth {{{
autocmd BufRead,BufNewFile *.avs set filetype=avs
autocmd FileType avs set commentstring=#%s
autocmd FileType avs set tabstop=2 shiftwidth=2
"   }}}

"   MarkDown && Text {{{
Plug 'tpope/vim-markdown'
autocmd FileType text set filetype=markdown
autocmd FileType markdown let b:delimitMate_matchpairs   = "(:)"
autocmd FileType markdown let delimitMate_nesting_quotes = ['"']
"   }}}

"   CMake {{{
Plug 'jansenm/vim-cmake'
autocmd FileType cmake set commentstring=#%s
autocmd FileType cmake set tabstop=2 shiftwidth=2
"   }}}
"   C++ {{{
Plug 'peterhoeg/vim-qml'
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
Plug 'othree/html5.vim'
autocmd FileType html set commentstring=<!--\ %s\ -->
autocmd FileType html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
autocmd FileType html let delimitMate_nesting_quotes = ['"', "'"]
autocmd FileType html set tabstop=2 shiftwidth=2
"   }}}
"   Twig Template {{{
Plug 'lepture/vim-jinja'
autocmd BufRead,BufNewFile,BufWrite *.twig set filetype=jinja
autocmd FileType jinja set commentstring={#\ %s\ #}
autocmd FileType jinja let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
autocmd FileType jinja let delimitMate_nesting_quotes = ['"', "'"]
autocmd FileType jinja set tabstop=2 shiftwidth=2
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

"   Scss {{{
autocmd BufRead,BufNewFile *.scss set filetype=scss
autocmd FileType scss set commentstring=//%s
autocmd FileType scss set tabstop=2 shiftwidth=2
autocmd FileType scss set foldmethod=marker
autocmd FileType scss set foldmarker={{{,}}}
"   }}}

"   JavaScript {{{
autocmd FileType javascript set commentstring=//%s
autocmd FileType javascript set tabstop=2 shiftwidth=2
"   }}}
"   TypeScript {{{
Plug 'leafgarland/typescript-vim'
autocmd BufRead,BufNewFile *.ts set filetype=typescript
autocmd FileType typescript set tabstop=4 shiftwidth=4
autocmd FileType typescript set commentstring=//%s
autocmd FileType typescript set foldmethod=syntax
autocmd FileType typescript set foldlevel=1
autocmd FileType typescript set foldnestmax=2
autocmd BufRead,BufNewFile *.spec.ts set foldnestmax=3
autocmd FileType typescript set foldenable

" let g:syntastic_typescript_checkers       = ['tsc', 'tslint']
" let g:syntastic_typescript_checkers       = ['tsc']
let g:syntastic_typescript_checkers       = []
let g:syntastic_typescript_tsc_args       = '--project '.getcwd()
let g:syntastic_typescript_tsc_fname      = ""
let g:syntastic_typescript_tsc_args_after = ""
"   }}}

"   Grunt {{{
autocmd BufRead,BufNewFile Gruntfile.js set filetype=grunt.javascript
"   }}}
"   Gulp {{{
autocmd BufRead,BufNewFile Gulpfile.js set filetype=gulp.javascript
"   }}}

"   Json {{{
Plug 'leshill/vim-json'
autocmd BufRead,BufNewFile .babelrc set filetype=json
autocmd BufRead,BufNewFile *.json   set filetype=json
autocmd FileType json set tabstop=2 shiftwidth=2

let g:syntastic_json_checkers = ['jsonlint']
"   }}}
"   Yaml {{{
Plug 'pearofducks/ansible-vim'
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
"    Macro
noremap j q


" }}}
call plug#end()

if has('vim_starting')
  try
  colorscheme Tomorrow-Night-Eighties
    catch
  endtry
endif
