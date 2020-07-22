call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
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
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set colorcolumn=80 
highlight ColorColumn ctermbg=0 guibg=lightgray
set completeopt-=preview
set autowrite
set number
set background=light
set clipboard=unnamedplus
set foldmethod=manual 

let mapleader = ","
let maplocalleader = ","
colorscheme solarized 
let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ],['go'] ]
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
let g:go_echo_command_info = 1
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
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_options = {
	\'gofmt': '-s',
	\ }
let g:go_doc_window_popup_window = 0 
let g:go_def_mapping_enabled = 0
augroup Golang
    au!
    silent autocmd FileType go
                nmap <buffer> <localleader>r <Plug>(go-run)
                nmap <buffer> <localleader>b <Plug>(go-build)
                nmap <buffer> <localleader>t <Plug>(go-test)
                nmap <buffer> <localleader>c <Plug>(go-coverage)
                nmap <buffer> <localleader>gd <Plug>(go-doc)
                nmap <buffer> <localleader>gv <Plug>(go-doc-vertical)
                nmap <buffer> <localleader>s <Plug>(go-implements)
                nmap <buffer> <localleader>i <Plug>(go-info)
                nmap <buffer> <localleader>l <Plug>(go-metalinter)
                nmap <buffer> <localleader>f <Plug>(go-fmt)
augroup END
autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
" ---------------------------------------------------------------------------
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:UltiSnipsExpandTrigger="<tab>"
nnoremap <Leader>rg :Rg<Space>
nnoremap <silent> <Leader>mod :FZFMru<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>buf :Buffers<CR>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :wq<CR>

" ------------------------- Terminal ----------------------------------------
nnoremap <Leader>tt :tabnew +terminal<CR>
augroup neovimTerminal
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * : set nonumber norelativenumber
augroup END
" ---------------------------------------------------------------------------

" --------------------- CoC settings ----------------------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

