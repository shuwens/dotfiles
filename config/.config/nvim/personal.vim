" -----------------------------
"  My additional config
" -----------------------------
"
" python pyenv
let g:python_host_prog=expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog=expand('~/.pyenv/versions/neovim3/bin/python')

" Neat X clipboard integration {{{
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>pp :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>
" }}}
" C++ reference look up  {{{
" https://stackoverflow.com/questions/2272759/looking-up-c-documentation-inside-of-vim?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
command! -nargs=+ Cppman silent! call system("tmux split-window cppman " . expand(<q-args>))
autocmd FileType cpp nnoremap <silent><buffer> K <Esc>:Cppman <cword><CR>
" }}}
" map wincmd {{{
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
" using ctrl hj"
"nmap <leader>j :wincmd j<CR>
"nmap <leader>k :wincmd k<CR>
"nmap <leader>h :wincmd h<CR>
"nmap <leader>l :wincmd l<CR>
" The right windcmd (I like it the most..
nmap <silent>J :wincmd j<CR>
nmap <silent>K :wincmd k<CR>
nmap <silent>H :wincmd h<CR>
nmap <silent>L :wincmd l<CR>
"}}}

noremap <C-b> :CtrlP<CR>
