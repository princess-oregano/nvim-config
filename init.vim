"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" PLUGINS ---------------------------------------------------------------- {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"------------------------------------------------------------------

" Autocomplete
" main one
" Plugin 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
" Plugin 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**
" Plugin 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc

" Tokyonight colorscheme
Plugin 'ghifarit53/tokyonight-vim'

" Lightline
Plugin 'itchyny/lightline.vim'

" Yankstack
Plugin 'maxbrunsfeld/vim-yankstack'

" Smart commenting
Plugin 'preservim/nerdcommenter'

" NERDtree
Plugin 'preservim/nerdtree'

" Vim-fugitive
Plugin 'tpope/vim-fugitive'

" Easy replace
Plugin 'kqito/vim-easy-replace'

" far.vim - Find And Replace Vim plugin.
Plugin 'brooth/far.vim'

" Lines between parenthesises.
Plugin 'lukas-reineke/indent-blankline.nvim'

" Treesitter
Plugin 'nvim-treesitter/nvim-treesitter'

" Quick escape with 'jk'
Plugin 'max397574/better-escape.nvim'

" LSP configuration.
Plugin 'neovim/nvim-lspconfig'

" Markdown preview
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'ellisonleao/glow.nvim'

" Enhanced highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

" Undo tree
Plugin 'mbbill/undotree'

" COC
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'honza/vim-snippets'

"------------------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" }}}


" GENERAL ---------------------------------------------------------------- {{{

" Set charachters per line limit.
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Set colorscheme.
set termguicolors

let g:tokyonight_style = 'night' " Available: night, storm.
let g:tokyonight_enable_italic = 0
let g:tokyonight_transparent_background = 1
colorscheme tokyonight
let g:lightline = {'colorscheme' : 'tokyonight'}

" Using clipboard.
set clipboard=unnamedplus

" NERDCommenter setting.
filetype plugin on

" Don't show vim --MODE--.
set noshowmode

" Set blank lines.
 set scrolloff=999

" Tab settings.
 set tabstop=8 softtabstop=0 expandtab shiftwidth=8 smarttab

" Turn on the Wild menu.
 set wildmenu

" Ignore compiled files.
 set wildignore=*.o,*~,*.pyc
 if has("win16") || has("win32")
     set wildignore+=.git\*,.hg\*,.svn\*
 else
     set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
 endif

" Always show current position.
set ruler

" Height of the command bar.
set cmdheight=1

" A buffer becomes hidden when it is abandoned.
set hid

" Configure backspace so it acts as it should act.
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching.
set ignorecase

" When searching try to be smart about cases.
set smartcase

" Highlight search results.
set hlsearch

" Makes search act like search in modern browsers.
set incsearch

" Don't redraw while executing macros (good performance config).
set lazyredraw

" For regular expressions turn magic on.
set magic

" Show matching brackets when text indicator is over them.
set showmatch

" Set how many tenths of a second to blink when matching brackets.
set mat=2

" No annoying sound on errors.
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim.
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left.
set foldcolumn=1

" Enable syntax highlighting.
syntax enable

" Enable 256 colors palette in Gnome Terminal.
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Add auto-tab.
set autoindent

" Add numbers to each line on the left-hand side.
set number

" Disable scratch pop-up.
set completeopt-=preview

" Enhanced syntax settings
let g:cpp_posix_standard = 1

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Set map leader.
let mapleader = ','

" Disable arrow keys while using tabnine.
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']

" NERDTree settings.
nnoremap <C-o> :NERDTree<CR>
nnoremap <C-q> :NERDTreeClose<CR>

" Substitute(',r' - local, ',R' - global).
"nnoremap <leader>r gd[{V%::s/<C-R>///gc<left><left><left>
"nnoremap <leader>R gD:%s/<C-R>///gc<left><left><left>

" Change a read-only file.
cnoremap sudow w !sudo tee % >/dev/null

" Cycle through yanks.
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Remove trailing spaces.
cnoremap clean %s/\s\+$//e<cr>

"COC
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
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
        imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
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


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable code folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}


" LUA CODE---------------------------------------------------------------- {{{

lua << EOF

require('glow').setup()

require("better_escape").setup {
    mapping = {"jk", "jj"}, 
    timeout = vim.o.timeoutlen, 
    clear_empty_lines = false, 
    keys = "<Esc>", 
}

require('indent_blankline').setup {
        show_current_context = true,
        show_current_context_start = true,
        space_char_blankline = " ",
}

EOF

" }}}

