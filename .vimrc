if !has('nvim')
    " Change Your Vim Cursor from a Block to Line in Insert Mode
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
    " write as sudo
    "cmap w!! w !sudo tee > /dev/null %
    command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
endif
if has('win32')
    set ff=dos
endif

color industry
set timeoutlen=400
set mouse=a clipboard=unnamedplus
set number relativenumber nocursorline
set ts=4 sw=4 sts=4 autoindent smartindent expandtab smarttab
set ignorecase smartcase incsearch hlsearch showmatch
set enc=utf-8 fenc=utf-8 nobackup nowritebackup noswapfile
set iskeyword+=- backspace=indent,eol,start
set wrap linebreak showbreak=↪ whichwrap+=<,>,[,],h,l
set nolist listchars=tab:→\ ,nbsp:␣,trail:•,space:⋅,extends:▶,precedes:◀,eol:↴
set shortmess+=c scrolloff=8 sidescrolloff=8

let mapleader = " "
let localmapleader = " "
nnoremap ; :
inoremap jk <ESC>
nmap J <Nop>
nmap K <Nop>
"nmap <C-s> <Nop>
"nmap <C-e> <Nop>
nnoremap - <C-x>
nnoremap = <C-a>
nnoremap <silent> <C-q><C-s> :write<CR>
nnoremap <silent> <C-q><C-x> :q!<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>x :bd!<CR>
nnoremap <silent> <leader>q :q!<CR>
nnoremap <silent> <leader>fe :e .<CR>
nnoremap <leader>oo :e $MYVIMRC<CR>
nnoremap <leader>ll :so $MYVIMRC<CR>
nnoremap <ESC> :nohl<CR>

" Buffer
nnoremap > :bn<CR>
nnoremap < :bp<CR>
nnoremap <C-Tab> :b#<CR>

" Better move through wrap line
nnoremap j gj
nnoremap k gk

" Move around text in InsertMode & CommandMode
noremap! <C-h> <LEFT>
noremap! <C-l> <RIGHT>
noremap! <C-j> <DOWN>
noremap! <C-k> <UP>

" Move around windows
nnoremap <C-h> <C-w><LEFT>
nnoremap <C-l> <C-w><RIGHT>
nnoremap <C-j> <C-w><DOWN>
nnoremap <C-k> <C-w><UP>

" Indent
vnoremap L >gv
vnoremap H <gv
nnoremap L v>
nnoremap H v<

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nnoremap J mz:m+<cr>`z
nnoremap K mz:m-2<cr>`z
vnoremap J :m'>+<cr>`<my`>mzgv`yo`z
vnoremap K :m'<-2<cr>`>my`<mzgv`yo`z


" yank & paste
noremap! <C-r><C-r> <C-r>"
nnoremap <C-e><C-a> ggVG
"vnoremap p "_dP
nnoremap x "_x
vnoremap LL :<C-U>normal mtg_v`t<CR>
omap LL :normal vLL<CR>
vnoremap HH :<C-U>normal mt^v`t<CR>
omap HH :normal vHH<CR>
vnoremap al :<C-U>normal 0v$h<CR>
omap al :normal val<CR>
vnoremap il :<C-U>normal ^vg_<CR>
omap il :normal vil<CR>

" Search & Replace
vnoremap <C-f> y<ESC>/<C-r>"<CR>
vnoremap <C-r><C-e> "hy:%s/<C-r>h//gc<LEFT><LEFT><LEFT>

" Status line
set showmode
set laststatus=2
set statusline=\ %{&paste==1?'[PASTE\ MODE]\ \ ':''}\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

