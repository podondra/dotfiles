" Used to be an example for a vimrc file.
"
" Maintainer: Ondrej Podsztavek

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" use spaces instead of tabs
set expandtab

" write the contents of the file, if it has been modified
set autowrite

" precede each line with its line number
set number

" highlight textwitdth + 1 column
set colorcolumn=+1