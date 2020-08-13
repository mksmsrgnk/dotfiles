call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'SirVer/ultisnips'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
call plug#end()

set syntax=on
set noerrorbells
set smartindent
set nowrap
set smartcase
set noswapfile
set relativenumber
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set colorcolumn=80 
set noshowmode
set completeopt-=preview
set autowrite
set number
set background=light
set clipboard=unnamedplus
set foldmethod=manual 
set cmdheight=1
set shortmess+=c
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set spell spelllang=ru_yo,en_us
colorscheme solarized 
let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
	\		['go'] ]
	\ },
        \ 'component': {
        \   'go': '%#goStatuslineColor#%{LightlineGo()}',
        \ },
        \ 'compoent_type': {
        \   'go': 'raw',
      \ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead',
	\ 	},
	\ }
function! LightlineGo()
  return exists('*go#statusline#Show') ? go#statusline#Show() : ''
endfunction

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" ---------------------- Go settings ----------------------------------------
let g:go_fmt_command = 'gopls'
let g:go_imports_mode = 'gopls'
let g:go_rename_command = 'gopls'
let g:go_echo_command_info = 0
let g:go_term_enabled = 0
let g:go_term_close_on_exit = 0
let g:go_metalinter_command = 'golangci-lint'
let g:go_metalinter_enabled = [
            \'vet',
            \'ineffassign',
            \'typecheck',
            \'gosimple',
            \'staticcheck',
            \'structcheck',
            \'varcheck',
            \'golint',
            \'errcheck',
            \'unused',
            \'deadcode',
            \'gosec',
            \'gocognit',
            \'goconst',
            \'lll',
            \'unparam',
            \'gocritic',
            \'funlen',
            \'whitespace',
            \'goerr113',
            \'nestif',
            \'nakedret']

let g:go_imports_autosave = 1
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 0
let g:go_list_type = "quickfix"
let g:go_highlight_function_calls = 0
let g:go_fmt_options = {
	\'gofmt': '-s',
	\ }
let g:go_doc_window_popup_window = 0 
let g:go_def_mapping_enabled = 1
augroup Golang
    au!
    silent autocmd FileType go
                nmap <leader>r <Plug>(go-run)
                nmap <leader>b <Plug>(go-build)
                nmap <leader>t <Plug>(go-test)
                nmap <leader>c <Plug>(go-coverage)
                nmap <leader>gd <Plug>(go-doc)
                nmap <leader>gv <Plug>(go-doc-vertical)
                nmap <leader>s <Plug>(go-implements)
                nmap <leader>i <Plug>(go-info)
                nmap <leader>l <Plug>(go-metalinter)
                nmap <leader>f <Plug>(go-fmt)
		map <C-n> :cnext<CR>
		map <C-m> :cprevious<CR>
		nnoremap <leader>a :cclose<CR>
augroup END
autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
" ---------------------------------------------------------------------------
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:UltiSnipsExpandTrigger="<tab>"
nnoremap <Leader>rg :Rg<Space>
nnoremap <silent> <Leader>mod :FZFMru<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>bu :Buffers<CR>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" ------------------------- Terminal ----------------------------------------
nnoremap <Leader>tt :tabnew +terminal<CR>
nnoremap <Leader>tv :vsplit +terminal<CR>
tnoremap <Esc> <C-\><C-n>
augroup neovimTerminal
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * : set nonumber norelativenumber
augroup END
" ---------------------------------------------------------------------------

