

source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/vimrc


call plug#begin('~/.config/nvim/plugged')
" coding
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': '~/.yarn/bin/yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': '~/.yarn/bin/yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': '~/.yarn/bin/yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': '~/.yarn/bin/yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutFastWrap = '<C-e>'
Plug 'preservim/nerdcommenter'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1           " enable tabeline features
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like 'tabs' to denote tabes (I clear it so nothing is shown)
let g:airline#extensions#tabline#show_buffers = 0      " remove 'buffers' label on the rigit
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers whcih indicates the number of buffers opened
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tab_min_count = 0     " minimum of 2 tabs needed to display the tabline
let g:airline_theme='dark_minimal'
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" ctags
" Plug 'ludovicchabant/vim-gutentags'
" Ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'kevinhwang91/rnvimr'
let g:rnvimr_enable_picker = 1
let g:ranger_replace_netrw = 1
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': float2nr(round(0.8 * &columns)),
            \ 'height': float2nr(round(0.8 * &lines)),
            \ 'col': float2nr(round(0.1 * &columns)),
            \ 'row': float2nr(round(0.1 * &lines)),
            \ 'style': 'minimal' }

Plug 'airblade/vim-rooter'
"theme
" Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-fugitive'
call plug#end()







