" General Things
set title titlestring=
set clipboard=unnamed
set nocompatible
set backspace=indent,eol,start
set encoding=utf-8
set showmatch
set laststatus=2
set t_Co=256
set hlsearch
set incsearch
filetype off
filetype plugin indent on
syntax on
execute pathogen#infect()
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_theme = 'jellybeans'
let g:tmuxline_preset = {
      \'a'    : '#h',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%R'}
let g:bufferline_active_highlight = 'bufferline_selected'
let g:bufferline_inactive_highlight = 'airline_c'
let g:bufferline_solo_highlight = 1
let g:bufferline_show_bufnr = 0
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" Buffer Keys for Next & Previous
let mapleader=","
nmap <leader>= :n<cr>
nmap <leader>- :N<cr>

" Show the column
highlight ColorColumn ctermbg=red guibg=darkred
call matchadd('ColorColumn', '\%135v', 100)

" Highlight matches when jumping to next 
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>
function! HLNext (blinktime)
set invcursorline
redraw
exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
set invcursorline
redraw
endfunction

" Swap v and CTRL-V, because Block mode is more useful that Visual mode
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" Visual map plugin settings
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
let g:DVB_TrimWS = 1

" Markdown Settings
let g:markdown_enable_spell_checking = 0

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Make tabs, trailing whitespace, and non-breaking spaces visible
"exec 'set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~'
"set list

" Define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.yaml,*.yml,*.sh,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Python Stuff
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" YAML Stuff
au BufNewFile,BufRead *.yml,*.yaml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Json Stuff
au BufNewFile,BufRead *.json
    \ set tabstop=8 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Spell Checks
au BufRead,BufNewFile gitcommit setlocal spell

augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END
