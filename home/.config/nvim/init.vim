
" =============================================================================================================
"                                       Alfie Richards nvim config
" =============================================================================================================

" 	Initial
" Set default shell to zsh
set shell=/bin/zsh

"	Plugins
" Start vimplug
call plug#begin()

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

let g:airline_theme='solarized'

" Editing
" -------

filetype plugin on

" Files
" -----

" Semantic language support
" -------------------------
" Language server support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Completion support
Plug 'lifepillar/vim-mucomplete'

" Syntactic language support
" --------------------------
" Languages under active use
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'

" Other languages Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'lervag/vimtex'
Plug 'matze/vim-tex-fold'
" Extra tools
Plug 'godlygeek/tabular'
Plug 'rhysd/vim-clang-format'

" Utility
" -------
" Protection against modeline vulnerability
Plug 'ciaranm/securemodelines'
" Plugin for live prieview of latex pdf output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()

" ===============
" PLUGIN SETTINGS
" ===============

" coc.nvim
" --------
" List of language server extensions to install if they aren't already
let g:coc_global_extensions = [
    \ "coc-clangd",
    \ "coc-git",
    \ "coc-html",
    \ "coc-json",
    \ "coc-markdownlint",
    \ "coc-omnisharp",
    \ "coc-rust-analyzer",
    \ "coc-sourcekit",
    \ "coc-yaml",
    \ ]
" Shorten the update time of nvim to help with delays
set updatetime=100

let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'
let g:livepreview_previewer = 'open -a Preview'

" vim-mucomplete
" --------------
" mucomplete says this option is required
set completeopt=menu
set completeopt+=menuone
set completeopt+=noinsert
" Turn off completion messages
set shortmess+=c
" Turn off auto-completion at startup
let g:mucomplete#enable_auto_at_startup = 0
" Set up completion chains
let g:mucomplete#chains = {
\   'default': ['tags', 'nsnp'],
\   'rust': {
\     'default': ['omni', 'nsnp'],
\     'rustString.*': [],
\     'rustComment.*': ['spel'],
\   },
\   'vim' : {
\     'default': ['cmd', 'nsnp', 'keyn'],
\     'vimComment.*': [],
\     'vimString.*': ['spel']
\   },
\ }

" =================
" LANGUAGE SETTINGS
" =================

filetype on

" Markdown
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" ===============
" EDITOR SETTINGS
" ===============

" Text Editing
" ------------
" Turn on filetype detection and plugin/indent info loading
filetype plugin indent on
" set tabs to have 2 spaces
set ts=2
" Use 4-space indentation
set shiftwidth=2
set softtabstop=2
set expandtab
" Auto-indent on new lines
set autoindent
" Don't insert two spaces after certain characters when using a join command
set nojoinspaces
" Wrap to 100 characters
set textwidth=80
" Format options (default fo=jcroql)
set fo=ca " Auto-wrap comments to textwidth
set fo+=r " Auto-insert the current comment leader when pressing enter in insert mode
set fo+=o " Auto-insert the current comment leader when entering new lines with o
set fo+=q " Allow `gq` to format comments
set fo+=w " Use a single trailing whitespace character to indicate continuing paragraphs
set fo+=n " Format numbered lists as well
set fo+=j " Auto-remove comment characters when joining lines

" Make Clipboard work
set clipboard=unnamed

" Text Display
" ------------
" Set the number of lines to keep visible above and below the cursor at the top and bottom of the 
" screen
set scrolloff=2
" Don't soft-wrap long lines to display them in the buffer
set nowrap
" Display line numbers in the sidebar
set number
" Display line numbers for every line but the current one as an offset
set relativenumber
