set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching

set incsearch
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set tabstop=4               " number of columns occupied by a tab character
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab
set smarttab
set cindent

set ruler
set encoding=UTF-8
set showmatch
set cino+=j1,(0,ws,Ws " enable partial c++11 (lambda) support")
set cursorline
set scrolloff=5
set relativenumber

set showcmd
"大小写不敏感查找
set ignorecase
"有一个大写字母即大小写敏感
set smartcase

filetype on
filetype plugin on
filetype plugin indent on   " allows auto-indenting depending on file type
syntax enable



" key map

let mapleader=" "

"edit vimrc
nnoremap <LEADER>rc <Esc>tu <LEADER>e ~/.vimrc<CR>
"将tab换位为空格
nmap <LEADER><LEADER>t :%s/\t/    /g<CR> <C-o>
nnoremap <LEADER><LEADER>s /
noremap <LEADER><CR> :nohlsearch<CR>
nmap S :w<CR>
nmap Q :q<CR>
"快速移动
noremap J 5j
noremap K 5k
noremap H 7h
noremap L 7l
noremap W 5w
noremap B 5b
"设置分屏
noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sj :set splitbelow<CR>:split<CR>
"分屏切换
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
"分屏大小控制
nnoremap <UP> :res +5<CR>
nnoremap <DOWN> :res -5<CR>
nnoremap <RIGHT> :vertical resize+5<CR>
nnoremap <LEFT> :vertical resize-5<CR>

"打开新标签页
nnoremap tu :tabe<CR>
"标签页切换
nnoremap tj :+tabnext<CR>
nnoremap tk :-tabnext<CR>
"标签页移动
nnoremap tmj :-tabmove<CR>
nnoremap tmk :+tabmove<CR>
"打开新文件
nnoremap <LEADER>e :e 

""快速查找替换
map <LEADER><LEADER>r <Esc>/<++><CR>:nohlsearch<CR>c4l

"Y->y$
nnoremap Y y$
"去除空行
nnoremap <F2> :g/^\s*$/d<CR>
"拷贝到系统剪贴板
vnoremap Y "+y

"open terminal
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

"remove space int the  end of line
nnoremap <LEADER><LEADER>s :%s/\s\+$//<CR>


"line visual mode 
noremap vv V

"cursor format
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" === Restore Cursor Position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" rn键用于重命名
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)



" Compile function
noremap <LEADER>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        set splitbelow
        :sp
        :res -5
        term gcc -ansi -Wall % -o %< && time ./%<
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -15
        :term ./%<
    elseif &filetype == 'java'
        set splitbelow
        :sp
        :res -5
        term javac % && time java %<
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    endif
endfunc



"plugin
call plug#begin('$HOME/.config/nvim/plugged')
" align
Plug 'junegunn/vim-easy-align'

" Treesitter 高亮
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" status bar
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/Lokaltog/vim-powerline'

" color scheme
Plug 'connorholyday/vim-snazzy'

" enhence
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'kshenoy/vim-signature'
" comment
Plug 'manasthakur/vim-commentor'

" tag list
Plug 'liuchengxu/vista.vim'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'https://github.com/sunowsir/NewFileTitle'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/vim-scripts/grep.vim'

Plug 'justinmk/vim-sneak'
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/gcmt/wildfire.vim'   


"git
Plug 'https://github.com/airblade/vim-gitgutter'

"cpp
Plug 'octol/vim-cpp-enhanced-highlight'

" json
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

call plug#end()

" ===================== Start of Plugin Settings =====================

"airline setting
let g:airline_theme='angr'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

"cpp highlight setting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1



let g:gitgutter_max_signs = 500  " default value"

let g:SnazzyTransparent = 1
colorscheme snazzy


"ale setting
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

let g:ale_sign_error = 'x'
let g:ale_sign_warning = '⚠'

highlight ALEWarning ctermbg=DarkMagenta
let g:airline#extensions#ale#enabled = 1



let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1


"for go
let g:ale_linters = {
    \ 'go': ['gopls'],
    \}



"sp to previous error
"sn to next error
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)


let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

"coc setting
"解决coc.nvim大文件卡死状况
let g:trigger_size =1 * 1048576


"延迟启动
let g:coc_start_at_startup=0
function! CocTimerStart(timer)
    exec "CocStart"
endfunction
call timer_start(500,'CocTimerStart',{'repeat':1})

set updatetime=300

let g:coc_global_extensions = ['coc-tsserver','coc-html','coc-css', 'coc-json',
            \ 'coc-java','coc-python','coc-flutter', 'coc-cmake', 'coc-explorer',
            \ 'coc-emmet','coc-snippets','coc-xml','coc-yaml',
            \ 'coc-markdownlint','coc-highlight','coc-clangd']


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <LEADER>D to show documentation in preview window
nnoremap <silent> <LEADER>d :call <SID>show_documentation()<CR>

" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>

" coc-translator
nmap ts <Plug>(coc-translator-p)



" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()



"ultisnips
"" Trigger configuration. Do not use <tab> if you use ycm
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"set layout
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 1
endif


" ===
" === Vista.vim
" ===
noremap tl :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


"vim sneak setting
"replace f and F with Sneak
let g:sneak#label = 1
map <LEADER>f <Plug>Sneak_s
map <LEADER>F <Plug>Sneak_S

"indented lines setting
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 1


" ===
" === vim-go golang
" ===

autocmd FileType go nmap <LEADER>b  <Plug>(go-build)
autocmd FileType go nmap <LEADER>r  <Plug>(go-run)

let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0
