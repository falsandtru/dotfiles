"---------------------------
" Start Neobundle Settings.
"---------------------------
" mkdir -p ~/.vim/bundle
" git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
"set runtimepath+=~/.vim/
"runtime! userautoload/*.vim

" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
" scheme
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'morhetz/gruvbox'
" component
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'AndrewRadev/gapply.vim'
" manipulator
NeoBundle 'Lokaltog/vim-easymotion'
" format
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=9
"let g:indent_guides_color_change_percent = 30
NeoBundle 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
"nmap <Leader>a <Plug>(EasyAlign)"
NeoBundle 'tomtom/tcomment_vim'
" assistant
NeoBundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
NeoBundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'
let $PATH = $PATH . ':' . expand('~/.cabal/bin')
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'clausreinke/typescript-tools'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'thinca/vim-quickrun'
"let g:quickrun_config={'*': {'split': 'vertical'}}


""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""


call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

syntax on
set nocompatible

autocmd ColorScheme * highlight LineNr ctermfg=5
autocmd ColorScheme * highlight SpecialKey ctermfg=1
autocmd ColorScheme * highlight NonText ctermfg=9

colorscheme jellybeans
"colorscheme hybrid
"colorscheme gruvbox


" 画面表示の設定

set number         " 行番号を表示する
set ruler
set cursorline     " カーソル行の背景色を変える
hi clear CursorLine
"set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
set nofoldenable

" 全角文字をハイライト表示
function! Zenkaku()
    highlight Zenkaku cterm=reverse ctermfg=9 gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup Zenkaku
        autocmd!
        autocmd ColorScheme       * call Zenkaku()
        autocmd VimEnter,WinEnter,BufRead * let w:m1 = matchadd("Zenkaku", '[　０１２３４５６７８９]')
        autocmd VimEnter,WinEnter,BufRead * let w:m2 = matchadd("Zenkaku", '[ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ]')
        autocmd VimEnter,WinEnter,BufRead * let w:m3 = matchadd("Zenkaku", '[ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ]')
    augroup END
    call Zenkaku()
endif

"set spell
"set spelllang=en,cjk

" カーソル移動関連の設定

set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
"set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=3                " 上下3行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   " 外部でファイルに変更がされた場合は読みなおす
"set nobackup   " ファイル保存時にバックアップファイルを作らない
"set noswapfile " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定

"set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

" タブ/インデントの設定

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" 動作環境との統合関連の設定

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a
" Windows でもパスの区切り文字を / にする
set shellslash
" インサートモードから抜けると自動的にIMEをオフにする
"set iminsert=2

" コマンドラインの設定

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

" ビープの設定

"ビープ音すべてを無効にする
"set visualbell t_vb=
"set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

" =======================================
" Boost your productivity with EasyMotion
" =======================================
" Disable default mappings
" If you are true vimmer, you should explicitly map keys by yourself.
" Do not rely on default bidings.
let g:EasyMotion_do_mapping = 0

" Or map prefix key at least(Default: <Leader><Leader>)
" map <Leader> <Plug>(easymotion-prefix)

" =======================================
" Find Motions
" =======================================
" Jump to anywhere you want by just `4` or `3` key strokes without thinking!
" `s{char}{char}{target}`
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
" Of course, you can map to any key you want such as `<Space>`
" map <Space>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" =======================================
" Line Motions
" =======================================
" `JK` Motions: Extend line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" keep cursor column with `JK` motions
let g:EasyMotion_startofline = 0

" =======================================
" General Configuration
" =======================================
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
" Show target key with upper case to improve readability
let g:EasyMotion_use_upper = 1
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1


" =======================================
" Search Motions
" =======================================
" Extend search motions with vital-over command line interface
" Incremental highlight of all the matches
" Now, you don't need to repetitively press `n` or `N` with EasyMotion feature
" `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
" :h easymotion-command-line
set nohlsearch
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"let g:EasyMotion_use_migemo = 1



" map f <Plug>(easymotion-fl)
" map t <Plug>(easymotion-tl)
" map F <Plug>(easymotion-Fl)
" map T <Plug>(easymotion-Tl)
"
" map w <Plug>(easymotion-wl)
" map e <Plug>(easymotion-el)
" map b <Plug>(easymotion-bl)
" map W <Plug>(easymotion-W)
" map E <Plug>(easymotion-E)
" map B <Plug>(easymotion-B)

