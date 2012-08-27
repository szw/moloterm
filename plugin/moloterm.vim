" moloterm - The color scheme and a tiny coloring plugin
" Maintainer:   Szymon Wrozynski
" Version:      0.0.1
"
" Installation:
" Place in ~/.vim/ or in case of Pathogen:
"
"     cd ~/.vim/bundle
"     git clone https://github.com/szw/vim-g.git
"
" License:
" Copyright (c) 2012 Szymon Wrozynski. Distributed under the same terms as Vim itself.
" See :help license
"
" Usage:
" https://github.com/szw/moloterm/blob/master/README.md

if exists("g:loaded_moloterm") || &cp || v:version < 700
    finish
endif

let g:loaded_moloterm = 1

if !exists('g:moloterm_overlengths')
    let g:moloterm_overlengths = [['*', 0]]
end

if !exists('g:moloterm_overlength_name')
    let g:moloterm_overlength_name = 'Error'
end

augroup Moloterm
    au!
    au InsertEnter * call s:highlight_overlength()
    au InsertLeave * call clearmatches()
augroup END

fun s:highlight_overlength()
    for entry in g:moloterm_overlengths
        if entry[1] > 0
            for ft in split(entry[0], ',')
                if ft == &ft || ft == '*'
                    return matchadd(g:moloterm_overlength_name, '\%>' . entry[1] . 'v.\+', -1)
                endif
            endfor
        endif
    endfor
endfun
