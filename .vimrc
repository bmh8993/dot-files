set nocompatible              " Vi와 호환 불가 설정, 필수
filetype off                  " 필수

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Bundle 'matchparenpp'
Bundle 'neocomplcache'
Plugin 'blueyed/vim-diminactive'
Plugin 'bad-whitespace'
Bundle 'https://github.com/vim-scripts/Align'
Bundle 'https://github.com/nathanaelkane/vim-indent-guides'
call vundle#end()

filetype plugin indent on

set number            " line 표시를 해줍니다.
set showcmd " 사용자가 입력한 명령어 표시
set showmatch " 현재 선택된 괄호의 쌍을 표시
set cursorline " 커서가 있는 라인을 강조 표시. (= cul)
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
set ruler              " 상태표시줄에 커서의 위치 표시
set clipboard=unnamed " 복사시 추가로 클립보드에 저장
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set showmatch
set nu

" Searching options
set hlsearch " 검색된 결과 강조 표시. (= hls) <-> nohlsearch (= nohls)
set incsearch " 검색어를 입력할 때마다 일치하는 문자열을 강조해서 표시. (= is) <-> noincsearch (= nois)
set ignorecase " 검색시 대소문자를 구분하지 않음. (= ic) <-> noignorecase (= noic)
set smartcase " 검색어에 대문자가 있다면 정확히 일치하는 문자열을 찾음. ignorecase 옵션이 on이어도 됨. (= scs) <-> nosmartcase (= noscs)

" Indentation options
set autoindent " 새로운 라인이 추가될 때, 이전 라인의 들여쓰기에 자동으로 맞춤. (= ai)
set expandtab  " Tab을 Space로 변경. (= et)
set tabstop=4 " 탭으로 들여쓰기시 사용할 스페이스바 개수. (= ts)
set shiftwidth=4 " <<, >> 으로 들여쓰기시 사용할 스페이스바 개수. (= sw)
set softtabstop=4 " 스페이스바 n개를 하나의 탭으로 처리. (= sts)
" ex) 스페이스바 4개가 연속으로 있다면 백스페이스로 스페이스바를 지우면 스페이스바 4개를 하나의 탭으로 인식해 삭제
set textwidth=100
set nocindent

" Input options
set history=1000 " 편집한 내용 저장 개수 (되돌리기 제한 설정)

" Plugin configuration
"
" NERD Tree
"
" <F3> NERDTree
map <F3> :NERDTreeToggle<cr>

" 숨겨진 파일까지 NERDTree에 표시
let NERDTreeShowHidden=1

" 디렉토리를 vim으로 여는 경우 NERD Tree 실행.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Vim-airline
" 가장 윗 줄에 tabline 보이게 하는 옵션
let g:airline#extensions#tabline#enabled = 1
"tab라인에 파일 이름만 보이게 하는 옵션. 경로 표시가 안된다.
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='gruvbox'
set laststatus=2 " turn on bottom bar
set ttimeoutlen=50

"neocomplcache
let g:neocomplcache_enable_at_startup = 1

"theme gruvbox
colorscheme gruvbox
set bg=dark

"powerline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

"ctags
set tags=tags
