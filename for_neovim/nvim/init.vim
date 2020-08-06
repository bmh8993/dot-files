call plug#begin("~/.vim/plugged")
  " Plugin Section
" ----- javascript & typescript ---------------------------
" IntelliSense and Syntax Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" ----- python --------------------------------------------
" Syntax Highlighting
" Plug 'vim-python/python-syntax'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'nvie/vim-flake8'
" ----- golang --------------------------------------------
Plug 'fatih/vim-go'
" ---------------------------------------------------------
" theme
Plug 'dracula/vim'
" nerd tree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" File Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ["coc-eslint", 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', "coc-go", "coc-python"]
" base
Plug 'vim-scripts/taglist.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'thaerkh/vim-indentguides'
call plug#end()

" ***************************************************************************************
" base settings
" ***************************************************************************************
" ===========================================================
" basic settings
" ==========================================================
set nu " line 표시를 해줍니
set showmatch " 현재
set cursorline " 커서가 있는 라인을 강조 표시. (= cul)
set ruler              " 상태표시줄에 커서의 위치 표시
set clipboard=unnamed " 복사시 추가로 클립보드에 저장
set showcmd
set encoding=utf-8
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#ffffff ctermbg=234
let g:vim_json_conceal = 0
set conceallevel=0
" ===========================================================
" vim-indent-guides options
" ===========================================================
let g:indent_guides_enable_on_vim_startup = 1
" ===========================================================
" Input options
" ===========================================================
set history=1000 " 편집한 내용 저장 개수 (되돌리기 제한 설정)
" ===========================================================
" Searching options
" ===========================================================
set hlsearch " 검색된 결과 강조 표시. (= hls) <-> nohlsearch (= nohls)
" Press Space to turn off highlighting and clear any message already displayed. space+enter
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set incsearch " 검색어를 입력할 때마다 일치하는 문자열을 강조해서 표시. (= is) <-> noincsearch (= nois)
set ignorecase " 검색시 대소문자를 구분하지 않음. (= ic) <-> noignorecase (= noic)
set smartcase " 검색어에 대문자가 있다면 정확히 일치하는 문자열을 찾음. ignorecase 옵션이 on이어도 됨. (= scs) <-> nosmartcase (= noscs)

" =========================================================
" theme dracula
" =========================================================
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula
" ===========================================================
"split navigations 분할된 화면 사이에서 커서 이동하기
" ===========================================================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" ===========================================================
" In insert or command mode, move normally by using Ctrl
" ===========================================================
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
" ==========================================================
" Shortcuts
" ==========================================================
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
command! Q :q
" ==========================================================
" insert/nomar mode change cursor shape
" ===========================================================
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" ===========================================================
" Indentation options
" ===========================================================
set autoindent " 새로운 라인이 추가될 때, 이전 라인의 들여쓰기에 자동으로 맞춤. (= ai)
set expandtab  " Tab을 Space로 변경. (= et)
set tabstop=2
set softtabstop=2
set shiftwidth=2
" auto delete whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" ===========================================================
" for python3
" ===========================================================
let g:python3_host_prog = expand('/Users/baemh/anaconda3/bin/python3')

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=88 |
    \ set expandtab |
    \ set autoindent |
" ===========================================================
" for go
" ===========================================================
" use golang language server
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" Highlight more info
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" highlight same variable in view
let g:go_auto_sameids = 1
" show type info in statusbar
let g:go_auto_type_info = 1
" disable gd mapping of vim-go
let g:go_def_mapping_enabled = 0
" auto import
let g:go_fmt_command = "goimports"
" ===========================================================
" code fold
" ===========================================================
"set foldmethod=indent
" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END
" za: Toggle code folding at the current line. The block that the current line belongs to is folded (closed) or unfolded (opened).
" zo: Open fold.
" zc: Close fold.
" zR: Open all folds.
" zM: Close all folds.
" ***************************************************************************************
" plug settings
" ***************************************************************************************

" =========================================================
" NerdTree
" =========================================================
" 해당 위치에서 nerdTree 열기
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" F3으로 토글
map <F3> :NERDTreeToggle<cr>

" 숨겨진 파일까지 NERDTree에 표시
let NERDTreeShowHidden=0 " shortcut => shift + i

" 디렉토리를 vim으로 여는 경우 NERD Tree 실행.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" nerdTree로 열었을 때 자동으로 nerdTree 닫힘
let NERDTreeQuitOnOpen = 1


" =========================================================
" fzf
" =========================================================
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" ==========================================================
" vim-javascript
" ===========================================================
let g:javascript_plugin_flow = 1

" ===========================================================
" vim-jsx
" ===========================================================
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1

" ===========================================================
" ctags
" ===========================================================
set tags=tags
" ===========================================================
" flake8
" ===========================================================
autocmd FileType python map <buffer> <F5> :call Flake8()<CR>
" ===========================================================
" TagList
" ===========================================================
" vim을 열면 자동으로 오픈
" let Tlist_Auto_Open=1
" 분할 창을 오른쪽에 배치
let Tlist_Use_Right_Window=1
" 토글
map <F4> :TlistToggle<cr>
" 오픈 너비
let Tlist_WinWidth = 40
