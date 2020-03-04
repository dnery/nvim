syntax on


" Plugin selection "{

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

call plug#begin(plugged_path)
Plug 'junegunn/vim-plug'

" Active assistance
Plug 'merlinrebrovic/focus.vim'         " <leader>fmt       -> Toggle focus mode
Plug 'ctrlpvim/ctrlp.vim'               " <c-p>             -> Fuzzy file finding
Plug 'scrooloose/nerdtree'              " <c-b>             -> Toggle NERDTree sidebar
Plug 'tpope/vim-surround'               " https://github.com/tpope/vim-surround#surroundvim
Plug 'terryma/vim-multiple-cursors'     " <c-n>             -> Start/add multicursor in next match
"Plug 'majutsushi/tagbar'

" Passive assistance
Plug 'scrooloose/syntastic'             " LINTING
Plug 'Rip-Rip/clang_complete'           " COMPLETION
Plug 'gioele/vim-autoswap'              " Less headache with swap files
Plug 'tpope/vim-git'                    " Gitgutter pt. 1
Plug 'tpope/vim-fugitive'               " Gitgutter pt. 2
Plug 'hynek/vim-python-pep8-indent'     " Literally PEP8 compliant Python indentation
Plug 'Xuyuanp/nerdtree-git-plugin'      " NERDTree also displays info on git flags
"Plug 'jiangmiao/auto-pairs'            " Insert pairs to commong markers. Mixed feelings...
"Plug 'chrisbra/NrrwRgn'
"Plug 'SirVer/ultisnips'
"Plug 'ervandew/supertab'
"Plug 'honza/vim-snippets'

" Code colors & syntax
Plug 'mxw/vim-jsx'
Plug 'lervag/vimtex'
Plug 'jalvesaq/Nvim-R'
Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'jvirtanen/vim-octave'
Plug 'vim-airline/vim-airline'
Plug 'neovimhaskell/haskell-vim'
Plug 'justinmk/vim-syntax-extra'
Plug 'mfukar/robotframework-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/groovy.vim'
Plug 'cespare/vim-toml'

call plug#end()

"}


" Vim basics "{

filetype plugin indent on

" Leader key "{
let mapleader = ","
let localleader = ";"
"}

" Enable mouse "{
if has('mouse')
    set mouse=a
endif
"}

" Caret configs "{
" Check my github gist!!!
if executable("gnome-terminal-cursor")
    au VimEnter,InsertLeave * silent execute "!gnome-terminal-cursor block"
    au InsertEnter *
        \ if v:insertmode == 'i' |
        \   silent execute "!gnome-terminal-cursor ibeam" |
        \ elseif v:insertmode == 'r' |
        \   silent execute "!gnome-terminal-cursor underline" |
        \ endif
    au VimLeave * silent execute "!gnome-terminal-cursor block"
endif
"}

"}


" Mappings "{

" Case insensitive :wq
command! W w
command! Q q
command! Wq wq
command! WQ wq

"" Consider long lines separate lines
nnoremap j gj
nnoremap k gk
nnoremap <UP> g<UP>
nnoremap <DOWN> g<DOWN>

"" Edit or Source Vimrc file
nnoremap <silent> <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>vs :source $MYVIMRC<CR>

"" Highlight trailing whiteSpace
nnoremap <silent> <leader>hs /\s$<CR>

"" Space to turn off highlighting and clear any messages
"nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <silent> <space> :nohl<bar>:echo<CR>

"" Using H and L as 0 and $
nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $

"" Spelling
nnoremap <silent> <leader>l :setlocal spell!<CR>

"" Create Fold
"nnoremap <silent> <leader>f :set foldmethod=marker<CR>

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

set tags=./tags;                        " description
set laststatus=2                        " description
set noshowmode                          " description
set whichwrap=b,s,<,>,[,]               " description
set tabstop=4                           " description
set shiftwidth=4                        " description
set softtabstop=4                       " description
set smartindent                         " description
set expandtab                           " description
set hlsearch incsearch                  " description
set ignorecase smartcase                " description
"set nowrap                             " Do I not want this???
set secure                              " description
set exrc                                " description
set nu                                  " description
set list listchars=tab:»·,trail:·       " description
set completeopt=menu,menuone,longest    " description
set pumheight=15                        " description
set foldmethod=marker                   " description
set foldmarker={,}                      " description
set foldopen-=block                     " description
set guicursor=                          " description

"}


" Coloring "{

" Termcolors
set t_Co=256
colorscheme default
set background=dark

" Highlight 120 col mark IF violated
au BufNewFile,BufRead * highlight ColorColumn ctermbg=90
au BufNewFile,BufRead * call matchadd('ColorColumn', '\%121v', 100)

"}


" AuGroups "{

augroup DevHelp "{
    autocmd!
    au FileType c nnoremap <silent> <buffer> <leader>k :! devhelp -s "<cword>" 2>/dev/null 1>&2 &<CR><CR>
augroup END "}

augroup HTMlAbbrevs "{
    autocmd!
    au BufNewFile,BufRead *.html iabbrev << &lt;
    au BufNewFile,BufRead *.html iabbrev >> &gt;
augroup END "}

"augroup ICMC ASM Syntax "{
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
    au FileType gitcommit setlocal spell spelllang=en
augroup END "}

"}


" Plugin configs "{

" vim-focus "{
let g:focusmode_width=120
"}

" vim-airline "{
let g:airline_theme='raven'
let g:airline_powerline_fonts=0
"}

" CtrlP "{
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
"}

" NerdTree "{
map <c-b> :NERDTreeToggle<CR>
"}

" Tagbar "{
"nnoremap <silent> <leader>t :TagbarOpenAutoClose<CR>
"}

" Clang "{
""Set Clang to complete macros (useful for OpenGL wranglers)
""When using Glew, rememer:
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

" Syntastic: disabled checkers "{
let g:syntastic_disabled_filetypes=['asm']
"}

" Syntastic: C linting "{
""Remember default name!
""  g:syntastic_clang_check_config_file (string; default: '.syntastic_clang_check_config')
let g:syntastic_c_checkers=['clang_check', 'cppcheck']
let g:syntasitc_c_remove_include_errors=1
"let g:syntastic_c_clang_check_args='-fixit'
"}

" Syntastic: C++ linting "{
""Remember default name!
""  g:syntastic_clang_check_config_file (string; default: '.syntastic_clang_check_config')
let g:syntastic_cpp_checkers=['clang_check', 'cppcheck']
let g:syntasitc_cpp_remove_include_errors=1
"let g:syntastic_cpp_clang_check_args='-fixit'
"}

" Syntastic: GLSL linting "{
""Don't forget the magic comment!
""  // profile: (glslv|glslg|glslf)
let g:syntastic_glsl_options='-oglsl -strict'
"}

" Syntastic: Python linting "{
let g:syntastic_python_checkers=['pycodestyle', 'frosted']
let g:syntastic_python_pycodestyle_args='--ignore=E501,E128,E226,E231'
"}

"}
