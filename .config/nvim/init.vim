call plug#begin()
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'ojroques/nvim-lspfuzzy'
	Plug 'SirVer/ultisnips'
	Plug 'altercation/vim-colors-solarized'
	Plug 'tpope/vim-fugitive'
	Plug 'itchyny/lightline.vim'
	Plug 'neovim/nvim-lspconfig'
call plug#end()

colorscheme solarized 
filetype plugin indent on

set noexpandtab
set tabstop=4
set shiftwidth=4
" set textwidth=78
set autoindent smartindent
set smarttab
set syntax=on
set noerrorbells
set relativenumber
set number
set nowrap
set smartcase
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set colorcolumn=80 
set noshowmode
set completeopt-=preview
set autowrite
set background=light
set clipboard=unnamedplus
set foldmethod=manual 
set cmdheight=1
set shortmess+=c
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set spell spelllang=ru_yo,en_us

lua << EOF
require('lspfuzzy').setup{}
local nvim_lsp = require('lspconfig')
nvim_lsp.terraformls.setup {
	filetypes = {'terraform','pkr.hcl','tf'};
}
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "terraformls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

let g:UltiSnipsExpandTrigger="<tab>"

" ---------------------- vim-go ----------------------------------------
let g:go_imports_autosave = 1
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 0
let g:go_list_type = "quickfix"
let g:go_highlight_function_calls = 0
let g:go_fmt_options = { 'gofmt': '-s' }
let g:go_doc_window_popup_window = 0 
let g:go_def_mapping_enabled = 1
let g:go_gopls_enabled = 1
let g:go_fmt_command = 'gopls'
let g:go_imports_mode = 'gopls'
let g:go_implements_mode = 'gopls'
let g:go_info_mode = 'gopls'
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
 
augroup Go
	au!
	silent autocmd FileType go
	setlocal ts=4 sts=4 sw=4 noexpandtab
	nmap <leader>a <Plug>(go-alternate-edit)
	nmap <leader>b <Plug>(go-build)
	nmap <leader>c <Plug>(go-coverage)
	nmap <leader>d <Plug>(go-doc-vertical)
	nmap <leader>f <Plug>(go-fmt)
	nmap <leader>l <Plug>(go-metalinter)
	nmap <leader>r <Plug>(go-run)
	nmap <leader>s <Plug>(go-implements)
	nmap <leader>t <Plug>(go-test)
	nmap <leader>tf <Plug>(go-test-func)
	nmap <leader>i <Plug>(go-info)
	nmap <C-n> :cnext<CR>
	nmap <C-m> :cprevious<CR>
	nnoremap <leader>q :cclose<CR>
augroup END

augroup YAML
	au!
	silent autocmd FileType yaml,yml
	setlocal ts=2 sts=2 sw=2 noexpandtab
augroup END

augroup Terminal
	autocmd!
	autocmd TermOpen * : set nonumber norelativenumber
augroup END

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> <Leader>fg :Rg<CR>
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>f: :History:<CR>
nnoremap <silent> <Leader>f/ :History/<CR>
nnoremap <silent> <Leader>fl :Lines<CR>
nnoremap <silent> <Leader>flb :BLines<CR>
nnoremap <silent> <Leader>fc :Commits<CR>
nnoremap <silent> <Leader>fcb :BCommits<CR>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
nnoremap <leader>` :vsplit $MYVIMRC<CR>
nnoremap <Leader>3 :split +terminal<CR>
tnoremap <Esc> <C-\><C-n>
" ---------------------------------------------------------------------------
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
	\	},
	\ }

function! LightlineGo()
  return exists('*go#statusline#Show') ? go#statusline#Show() : ''
endfunction

if has('nvim') && executable('nvr')
	let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

