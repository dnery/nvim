syntax on

" Plug and plugins "{

"" Autoinstall Plug
let vimrc=expand('~/.config/nvim/init.vim')
let plugged_path=expand('~/.config/nvim/plugged/')
if !isdirectory(plugged_path)
    echo "Installing plug..."
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "Creating 'plugged' path..."
    silent execute '!mkdir -p ' . plugged_path
    echo "Re-sourcing the configuration file..."
    silent source $MYVIMRC
    echo "All done! Just run :PlugInstall when inside nvim to install the plugins!"
    finish
endif

"" Init Plug
call plug#begin(plugged_path)

"" Plugins
Plug 'junegunn/vim-plug'

" Floobits
Plug 'floobits/floobits-neovim'

" Code analysis
Plug 'scrooloose/syntastic'
Plug 'Rip-Rip/clang_complete'

" Code navigation
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'

" Code editing-boosters
"Plug 'vim-scripts/c.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'Townk/vim-autoclose'
Plug 'hynek/vim-python-pep8-indent'
Plug 'terryma/vim-multiple-cursors'

" Code & tool integration
Plug 'tpope/vim-git'
"Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'gioele/vim-autoswap'
Plug 'airblade/vim-gitgutter'

" Code colors & syntax
Plug 'lervag/vimtex'
"Plug 'othree/xml.vim'
Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'jvirtanen/vim-octave'
Plug 'vim-airline/vim-airline'
Plug 'neovimhaskell/haskell-vim'
"Plug 'suan/vim-instant-markdown'
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-airline/vim-airline-themes'
"Plug 'altercation/vim-colors-solarized'
"" End Plugins

call plug#end()
filetype plugin indent on
" Plug Done

" Leader key "{
let mapleader = ","
let localleader = ";"
"}

" Case insensitive :wq "{
command! W w
command! Q q
command! Wq wq
command! WQ wq
"}

" Mappings "{
"" Consider long lines separate lines
nnoremap j gj
nnoremap k gk
nnoremap <UP> g<UP>
nnoremap <DOWN> g<DOWN>

"" edit and source vimrc file
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

"" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"" Find trailing whitespace
nnoremap <silent> <leader>hs /\s$<CR>

"" NOT SURE I WANT THIS
"" Using H and L as 0 and $
"nnoremap H 0
"nnoremap L $
"vnoremap H 0
"vnoremap L $

"" Spelling
nnoremap <silent> <leader>l :setlocal spell!<CR>

"" Create Fold
"nnoremap <silent> <leader>f :set foldmethod=marker<CR>

"" NerdTree
nnoremap \ :NERDTreeToggle<CR>

" Tagbar toggle
nnoremap <silent> <leader>t :TagbarOpenAutoClose<CR>

"" Better Scrolling
nnoremap <C-J> <C-E>
nnoremap <C-K> <C-Y>

"" I DON'T USE TABS
"nnoremap <C-S><C-W> :tabclose<CR>
"nnoremap <C-S><C-O> :tabnew<CR>

"" Save as root
cmap w!! w !sudo tee % > /dev/null

"" Ident entire file
nnoremap <silent> <leader>= gg=G<C-O><C-O>
"}

" Settings "{
set tags=./tags;
set laststatus=2
set noshowmode
set whichwrap=b,s,<,>,[,]
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set hlsearch incsearch
set ignorecase smartcase
set nowrap
set secure
set exrc
set nu
set list listchars=tab:»·,trail:·
set completeopt=menu,menuone,longest
set pumheight=15
set foldmethod=marker
set foldmarker={,}
set foldopen-=block
"}

" Set coloring stuff "{
set t_Co=256
set background=dark
colorscheme default
"}

" Highlight 80 col's onward "{
au BufNewFile,BufRead * highlight ColorColumn ctermbg=90
au BufNewFile,BufRead * call matchadd('ColorColumn', '\%81v', 100)
"}

" AuGroups "{
augroup DevHelp "{
    autocmd!
    au FileType c nnoremap <silent> <buffer> <leader>k :! devhelp -s "<cword>" 2>/dev/null 1>&2 &<CR><CR>
augroup END "}

augroup HTMlAbbrevs "{
    autocmd!
    autocmd BufNewFile,BufRead *.html iabbrev << &lt;
    autocmd BufNewFile,BufRead *.html iabbrev >> &gt;
augroup END "}

"" NOT SURE I WANT THIS
"augroup Syntaxes "{
"        autocmd!
"        au FileType python setl et sw=4 sts=4
"        au BufNewFile,BufRead *.asm setlocal syntax=icmc
"augroup END "}

augroup Comments "{
    autocmd!
    au BufNewFile,BufRead *.c nnoremap <silent> <buffer> <leader>q I//<esc>:s/\v(\/\/+)\1+//e<CR>
    au BufNewFile,BufRead *.java nnoremap <silent> <buffer> <leader>q I//<esc>:s/\v(\/\/+)\1+//e<CR>
    au BufNewFile,BufRead *.js nnoremap <silent> <buffer> <leader>q I//<esc>:s/\v(\/\/+)\1+//e<CR>
    au BufNewFile,BufRead *.rb nnoremap <silent> <buffer> <leader>q I#<esc>:s/\v(#+)\1+//e<CR>
    au BufNewFile,BufRead *.py nnoremap <silent> <buffer> <leader>q I#<esc>:s/\v(#+)\1+//e<CR>
    au Syntax vim nnoremap <silent> <buffer> <leader>q I"<esc>:s/\v("+)\1+//e<CR>
augroup END "}

augroup PlantUML "{
    autocmd!
    au BufNewFile,BufRead *.uml setlocal syntax=plantuml
    au BufNewFile,BufRead *.puml setlocal syntax=plantuml
    au BufNewFile,BufRead *.puml nnoremap <silent> <leader>w :!plantuml -tsvg %<CR><CR>
augroup END "}

augroup CommitSpelling "{
    " Git commits.
    autocmd FileType gitcommit setlocal spell
augroup END "}
"}

" Enable mouse "{
if has('mouse')
    set mouse=a
endif "}

" Plugin related configs "{
" vim-airline config {
let g:airline_theme='raven'
let g:airline_powerline_fonts=0
"}

"CtrlP configs "{
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_use_caching=0
"}

"Configure Supertab with Ultisnips & Clang Complete "{
let g:SuperTabDefaultCompletionType='context'
let g:clang_complete_auto=0
let g:clang_complete_copen=1
let g:clang_snippets=1
let g:clang_snippets_engine='ultisnips'
let g:clang_auto_select=2
"}

"Ultisnips using tab to expand "{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
"}

"Clang to complete macros also (A.K.A. The GLEW Case) "{
""When using Glew, rememer!
""  #ifdef CLANG_COMPLETE_ONLY
""      #define GL_GLEXT_PROTOTYPES
""      #include <GL/gl.h>
""      #include <GL/glext.h>
""  #else
""      #include <GL/glew.h>
""  #endif
let g:clang_user_options='-DCLANG_COMPLETE_ONLY'
let g:clang_complete_macros=1
"}

"Disable checkers for special cases "{
let g:syntastic_disabled_filetypes=['asm']
"}

"Set up proper linting for Python projects "{
let g:syntastic_python_checkers=['pycodestyle', 'frosted']
let g:syntastic_python_pycodestyle_args='--ignore=E501,E128'
"}

"Set up proper linting for C projects "{
""Remember default name!
""  g:syntastic_clang_check_config_file (string; default: '.syntastic_clang_check_config')
let g:syntastic_c_checkers=['clang_check', 'cppcheck']
let g:syntasitc_c_remove_include_errors=1
"let g:syntastic_c_clang_check_args='-fixit'
"}

"Set up proper linting for C++ projects "{
""Remember default name!
""  g:syntastic_clang_check_config_file (string; default: '.syntastic_clang_check_config')
let g:syntastic_cpp_checkers=['clang_check', 'cppcheck']
let g:syntasitc_cpp_remove_include_errors=1
"let g:syntastic_cpp_clang_check_args='-fixit'
"}

"Set up proper linting for GLSL files "{
""Don't forget the magic comment!
""  // profile: (glslv|glslg|glslf)
let g:syntastic_glsl_options='-oglsl -strict'
"}
"}

"" Functions {
" Bubble lines (unimpaired) {
function! s:Move(cmd, count, map) abort
    normal! m`
    silent! exe 'move'.a:cmd.a:count
    norm! ``
    silent! call repeat#set("\<Plug>unimpairedMove".a:map, a:count)
endfunction

function! s:MoveSelectionUp(count) abort
    normal! m`
    silent! exe "'<,'>move'<--".a:count
    norm! ``
    silent! call repeat#set("\<Plug>unimpairedMoveSelectionUp", a:count)
endfunction

function! s:MoveSelectionDown(count) abort
    normal! m`
    norm! ``
    exe "'<,'>move'>+".a:count
    silent! call repeat#set("\<Plug>unimpairedMoveSelectionDown", a:count)
endfunction
"}

nnoremap <silent> <Plug>unimpairedMoveUp            :<C-U>call <SID>Move('--',v:count1,'Up')<CR>
nnoremap <silent> <Plug>unimpairedMoveDown          :<C-U>call <SID>Move('+',v:count1,'Down')<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionUp   :<C-U>call <SID>MoveSelectionUp(v:count1)<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionDown :<C-U>call <SID>MoveSelectionDown(v:count1)<CR>

nmap [e <Plug>unimpairedMoveUp
nmap ]e <Plug>unimpairedMoveDown
xmap [e <Plug>unimpairedMoveSelectionUp
xmap ]e <Plug>unimpairedMoveSelectionDown
"}
"}
