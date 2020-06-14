"  __  __        __     _____ __  __ ____   ____ 
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |    
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___ 
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/                                  

" Author : @ImAmelie , @theniceboy

" vim : ~/.vim/vimrc or ~/.vimrc
" neovim : ~/.config/nvim/init.vim

" ===
" === 第一次使用 VIM 时加载插件
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === 基本设置
" ===

set clipboard=unnamedplus
set autochdir
set cursorline
set list
set listchars=tab:▸\ ,trail:▫
set viewoptions=cursor,folds,slash,unix
set ttyfast " 表明使用的是快速终端连接，会提高重画的平滑度
set visualbell
set scrolloff=4
set nocompatible
set wildmenu
set t_Co=256
set laststatus=2
set ruler
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
set backspace=indent,eol,start
set number
set norelativenumber
set mouse=a
set autoindent
set smartindent
set background=dark
set encoding=utf-8
set hlsearch
set incsearch
set smartcase
set ignorecase
exec "noh"
set shiftround
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set showcmd
set showmode
set showtabline=2
" set splitbelow
" set splitright
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set syntax=on
" set wrap
set nowrap
set textwidth=0
" color default
let &t_ut=''
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ===
" === 按键绑定
" ===

" https://yianwillis.github.io/vimcdoc/doc/quickref.html#Q_km
" ma[p] {lhs} {rhs}   在普通及可视模式下将 {rhs} 映射为 {lhs}
" ma[p]! {lhs} {rhs}  在插入及命令行模式下将 {rhs} 映射为 {lhs}
" no[remap][!] {lhs} {rhs}  同 ":map"，但不对 {rhs} 重新映射
" unm[ap] {lhs}       清除普通及可视模式下 {lhs} 的映射
" unm[ap]! {lhs}      清除插入及命令行模式下 {lhs} 的映射
" cmap/cunmap/cnoremap  同"map!"/"unmap!"/"noremap!"，但仅作用于命令行模式(Command-line)
" imap/iunmap/cnoremap  同"map!"/"unmap!"/"noremap!"，但仅作用于插入模式(Insert)
" nmap/nunmap/nnoremap  同"map"/"unmap"/"noremap"，但仅作用于普通模式(Normal)
" vmap/vunmap/vnoremap  同"map"/"unmap"/"noremap"，但仅作用于可视模式(Visual)
" omap/ounmap/onoremap  同"map"/"unmap"/"noremap"，但仅作用于操作符等待模式(Operator-pending)
"
" 取消一个键的默认作用可以用如下方法：
" noremap <某个键> <nop>

" 设置leader键
let mapleader=";"

" 保存
nnoremap <F2> :w<CR>
inoremap <F2> <ESC>:w<CR>a

noremap S :w<CR>
noremap Q :q<CR>

" 打开 vimrc
nnoremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" 重新加载 vimrc
map R :source $MYVIMRC<CR>

" 导航
noremap i k
noremap k j
noremap j h
noremap h i
noremap H I
noremap <C-i> 5k
noremap <C-k> 5j

" 普通模式下，使 Y 复制到行尾
nnoremap Y y$

" 可视模式下，使 Y 复制到系统剪贴板
vnoremap Y "+y

" 缩进
nnoremap < <<
nnoremap > >>

" 取消搜索高亮
noremap <LEADER><CR> :noh<CR>

" Space to Tab
nnoremap <LEADER>stt :%s/    /\t/g
vnoremap <LEADER>stt :s/    /\t/g

" 分屏
map <LEADER>sl :set splitright<CR>:vsplit<CR>
map <LEADER>sj :set nosplitright<CR>:vsplit<CR>
map <LEADER>si :set nosplitbelow<CR>:split<CR>
map <LEADER>sk :set splitbelow<CR>:split<CR>

" 窗口跳转
" 默认 <C-w> + h/j/k/l
" 将当前窗口与后一个窗口对调：<C-w>x
noremap <LEADER>w <C-w><C-w>
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j
noremap <LEADER>j <C-w>h
noremap <LEADER>l <C-w>l

" 更改分屏大小
" 调整成等高等宽大小：<C-w>=
map <S-up> :res +5<CR>
map <S-down> :res -5<CR>
map <S-left> :vertical resize-5<CR>
map <S-right> :vertical resize+5<CR>

" 分屏横向纵向转换
" 垂直
map <LEADER>sv <C-w>t<C-w>H
" 水平
map <LEADER>sh <C-w>t<C-w>K

" 搜索查找
noremap n nzz
noremap N Nzz

" 标签页
" :tabe 打开新的标签页
map <LEADER>tn :tabe<CR>
map <tab> :tabnext<CR>
map <S-tab> :-tabnext<CR>
" :tabmove 移动标签到右边
" ：-tabmove 移动标签到左边

" placeholder
map <LEADER><LEADER> <Esc>/<++><CR>:noh<CR>c4l

" ===
" === Markdown 设置
" ===
"source ~/.config/nvim/md-snippets.vim

" 自动更改目录到当前目录
autocmd BufEnter * silent! lcd %:p:h

" set wrap
noremap <LEADER>sw :set wrap!<CR>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ % -o %<"
        :sp
        :res -5
        :term ./%<
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'dart'
        exec "CocCommand flutter.run -d ".g:flutter_default_device
        CocCommand flutter.dev.openDevLog
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    endif
endfunc

noremap <LEADER>g :call CompileRunG()<CR>
func! CompileRunG()
    exec "w"
    if &filetype == 'cpp'
        set splitbelow
        exec "!g++ %"
        :sp
        :res -5
        :term ./a.out
    endif
endfunc

noremap <LEADER>c :call CompileRunC()<CR>
func! CompileRunC()
    exec "w"
    if &filetype == 'cpp'
        set splitbelow
        exec "!clang++ %"
        :sp
        :res -5
        :term ./a.out
    endif
endfunc

" Call figlet
noremap tx :r !figlet 

" ===
" === Install Plugins with vim-plug
" ===

call plug#begin('~/.config/nvim/plugged')

" tabline
Plug 'mg979/vim-xtabline'
" emoji
" 需要安装 nerd 字体
" AUR搜索 : nerd-fonts
Plug 'ryanoasis/vim-devicons'

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'liuchengxu/eleline.vim'
Plug 'bling/vim-bufferline'

" 配色
Plug 'connorholyday/vim-snazzy'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }

" undo tree
Plug 'mbbill/undotree'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 检查语法错误并在行号处提示
Plug 'dense-analysis/ale'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" 主题透明背景
let g:SnazzyTransparent = 1
color snazzy

" tabline
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
if !empty(glob('~/.config/nvim/plugged/vim-xtabline'))
    autocmd VimEnter * :XTabTheme dracula
endif

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'

" gitgutter
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1

map <F3> :NERDTreeToggle<CR>

nmap <F4> :TagbarToggle<CR>

" ===
" === Markdown
" ===
let g:mkdp_open_to_the_world = 1
let g:mkdp_browser = 'google-chrome-stable'
let g:mkdp_page_title = '「${name}」'
" vim-table-mode
map <LEADER>tm :TableModeToggle<CR>

" undo tree
noremap <F5> :UndotreeToggle<CR>
silent !mkdir -p ~/.config/nvim/tmp/undo
if has("persistent_undo")
    set undodir=~/.config/nvim/tmp/undo,.
    set undofile
endif

" Auto Complete : neoclide/coc.nvim
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-cmake',
    \ 'coc-git',
    \ 'coc-go',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-markdownlint',
    \ 'coc-python',
    \ 'coc-rls',
    \ 'coc-snippets',
    \ 'coc-sql',
    \ 'coc-texlab',
    \ 'coc-translator',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-xml',
    \ 'coc-yaml',
    \ 'coc-yank'
\ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Snippets
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
