" ==========================================================
" vundle
" ==========================================================
set nocompatible                " required
filetype off 			" required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bad-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/nvie/vim-flake8'
Plugin 'blueyed/vim-diminactive'
Plugin 'Raimondi/delimitMate'
Plugin 'gmarik/Vundle.vim'
call vundle#end()            " 필수

filetype plugin indent on   " 필수

" ==========================================================
" Shortcuts
" ==========================================================
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
command! Q :q

" ===========================================================
" Basic Settings
" ==========================================================
syntax on
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set nu " line 표시를 해줍니
set showmatch " 현재
set cursorline " 커서가 있는 라인을 강조 표시. (= cul)
set ruler              " 상태표시줄에 커서의 위치 표시
set clipboard=unnamed " 복사시 추가로 클립보드에 저장
set showcmd
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#ffffff ctermbg=234

" ===========================================================
" Searching options
" ===========================================================
set hlsearch " 검색된 결과 강조 표시. (= hls) <-> nohlsearch (= nohls)
" Press Space to turn off highlighting and clear any message already displayed. space+enter
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set incsearch " 검색어를 입력할 때마다 일치하는 문자열을 강조해서 표시. (= is) <-> noincsearch (= nois)
set ignorecase " 검색시 대소문자를 구분하지 않음. (= ic) <-> noignorecase (= noic)
set smartcase " 검색어에 대문자가 있다면 정확히 일치하는 문자열을 찾음. ignorecase 옵션이 on이어도 됨. (= scs) <-> nosmartcase (= noscs)

" ===========================================================
" Indentation options
" ===========================================================
set autoindent " 새로운 라인이 추가될 때, 이전 라인의 들여쓰기에 자동으로 맞춤. (= ai)
set expandtab  " Tab을 Space로 변경. (= et)
set nocindent

" ===========================================================
" Input options
" ===========================================================
set history=1000 " 편집한 내용 저장 개수 (되돌리기 제한 설정)

" ===========================================================
"split navigations
" ===========================================================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ===========================================================
" FileType specific changes
" ============================================================
" Javascript
au BufRead *.js set makeprg=jslint\ %
" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
autocmd filetype javascript set sw=2 ts=2 expandtab
let g:acp_completeoptPreview=1

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au FileType python set foldmethod=indent foldlevel=99


" *********************************************************************************************************
" plugin settings
" *********************************************************************************************************

" ===========================================================
" delimiMate
" ===========================================================
let delimiMate_expand_cr=1

" ===========================================================
" diminactive
" ===========================================================
hi ColorColumn ctermbg=0 guibg=#eee8d5

" ===========================================================
" flake8
" ===========================================================
autocmd FileType python map <buffer> <F5> :call Flake8()<CR>

" ===========================================================
" nerd tree
" ===========================================================
" 해당 위치에서 nerdTree 열기
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" F3으로 토글
map <F3> :NERDTreeToggle<cr>

" 숨겨진 파일까지 NERDTree에 표시
let NERDTreeShowHidden=0

" 디렉토리를 vim으로 여는 경우 NERD Tree 실행.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" nerdTree로 열었을 때 자동으로 nerdTree 닫힘
let NERDTreeQuitOnOpen = 1

" ===========================================================
" ctags
" ===========================================================
set tags=tags

" ===========================================================
" TagList
" ===========================================================
" vim을 열면 자동으로 오픈
let Tlist_Auto_Open=1
" 분할 창을 오른쪽에 배치
let Tlist_Use_Right_Window=1
" 토글
map <F4> :TlistToggle<cr>
" 오픈 너비
let Tlist_WinWidth = 40

" ===========================================================
" source explorer
" ===========================================================
map <F2> :SrcExplToggle<CR><CR>
let SrcExpl_winHeight = 15

