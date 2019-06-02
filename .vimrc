" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
" This is my options below

" 自己的插件
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe'
" YCM的配置
" 设定开始补全的最小输入字符数
let g:ycm_min_num_of_chars_for_completion = 2
" 最大候选字符个数
let g:ycm_max_num_candidates = 10
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
Plug 'w0rp/ale'
" 在保存的时候进行检查
let g:ale_fix_on_save = 1
"关闭ALE的补全
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
"保持下面的显示窗口始终打开
let g:ale_keep_list_window_open = 1
let g:ale_list_window_size = 10
"使用quickfix
let g:ale_set_quickfix = 1
"主动打开显示窗口
let g:ale_open_list = 1

Plug 'SirVer/ultisnips'
"使用Python3
let g:UltiSnipsUsePythonVersion = 3

Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256 
syntax enable
set background=dark
colorscheme solarized

if $COLORTERM == 'truecolor'
    set termguicolors
    colorscheme solarized
else
    set term=xterm
    set t_Co=256
    colorscheme solarized
endif

" 自己的vim设定
" Show 5 lines of errors (default: 10)
set fo-=r
set nu



call plug#end()
