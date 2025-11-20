set number
set autoindent
set smartindent
set encoding=UTF-8
set clipboard=unnamedplus

call plug#begin()

set guifont=CaskaydiaMono\ Nerd\ Font\ 12


Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'

call plug#end()

let g:coc_disable_startup_warning = 1

nmap <C-n> :NERDTreeToggle<CR>
augroup nerdtree_open
    autocmd!
    autocmd VimEnter * NERDTree | wincmd p
augroup END

map <F4> :NERDTreeToggle<CR>
map <F5> :w<CR>
map <F1> :qa!<CR>
map <F2> :wq<CR>
map <F4> :wincmd p <CR>
map <F6> :NERDTreeToggle <CR>
let g:NERDTreeColorMapCustom = {
	\ "Staged" : "#0ee375", 
	\ "Modified" : "#d9bf91",
	\ "Renamed" : "#51c9fc",
	\ "Untracked" : "#fce77c", 
	\ "Unmerged" : "#fc51e6",
	\ "Dirty" : "#ffbd61"
	\ }

inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1) :
	\ CheckBackspace() ? "\<Tab>" :
	\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

nnoremap <silent> <space>s :<C-u>CocList diagnostics<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

let g:coc_global_extension = [
	\ 'coc-json',
	\ 'coc-css',
	\ 'coc-prettier',
	\ 'coc-c'
	\ 
]
