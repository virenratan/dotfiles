" Function to build YCM only if necessary (it's quite heavy, you know)
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --js-completer
  endif
endfunction

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-run-interactive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'janko-m/vim-test'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'prettier/prettier'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'vim-scripts/tComment'
Plug 'wakatime/vim-wakatime'
Plug 'w0rp/ale'

" language support
Plug 'elzr/vim-json'
Plug 'jelera/vim-javascript-syntax'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'nikvdp/ejs-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-jdaddy'
Plug 'tweekmonster/braceless.vim'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Plugins settings area               "
"                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""" Valloric/YouCompleteMe """""""
set encoding=utf-8
let g:ycm_extra_conf_globlist = ['~/*']
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_keep_logfiles = 1

""""""" pangloss/vim-javascript """""""
let g:javascript_plugin_jsdoc = 1

""""""" othree/javascript-libraries-syntax.vim """""""
let g:used_javascript_libs = 'underscore,react'

""""""" scrooloose/nerdtree """""""
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.DS_Store$']

""""""" w0rp/ale """""""
let g:ale_lint_on_text_changed = 'never'

""""""" mxw/vim-jsx """""""
let g:jsx_ext_required = 0
