" Vim color file
"
" Author: Szymon Wrozynski <szymon@wrozynski.com>
" Heavy based on the molokai theme by Tomas Restrepo <tomas@winterdom.com>.
"
" This theme supports 256-color terminal ang GUI.
"
" Schema from http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

if &t_Co != 256
    finish
endif

let g:colors_name="moloterm"

let s:gui_colors = [
      \"#000000", "#800000", "#008000", "#808000", "#000080", "#800080", "#008080", "#c0c0c0", "#808080", "#ff0000",
      \"#00ff00", "#ffff00", "#0000ff", "#ff00ff", "#00ffff", "#ffffff", "#000000", "#00005f", "#000087", "#0000af",
      \"#0000d7", "#0000ff", "#005f00", "#005f5f", "#005f87", "#005faf", "#005fd7", "#005fff", "#008700", "#00875f",
      \"#008787", "#0087af", "#0087d7", "#0087ff", "#00af00", "#00af5f", "#00af87", "#00afaf", "#00afd7", "#00afff",
      \"#00d700", "#00d75f", "#00d787", "#00d7af", "#00d7d7", "#00d7ff", "#00ff00", "#00ff5f", "#00ff87", "#00ffaf",
      \"#00ffd7", "#00ffff", "#5f0000", "#5f005f", "#5f0087", "#5f00af", "#5f00d7", "#5f00ff", "#5f5f00", "#5f5f5f",
      \"#5f5f87", "#5f5faf", "#5f5fd7", "#5f5fff", "#5f8700", "#5f875f", "#5f8787", "#5f87af", "#5f87d7", "#5f87ff",
      \"#5faf00", "#5faf5f", "#5faf87", "#5fafaf", "#5fafd7", "#5fafff", "#5fd700", "#5fd75f", "#5fd787", "#5fd7af",
      \"#5fd7d7", "#5fd7ff", "#5fff00", "#5fff5f", "#5fff87", "#5fffaf", "#5fffd7", "#5fffff", "#870000", "#87005f",
      \"#870087", "#8700af", "#8700d7", "#8700ff", "#875f00", "#875f5f", "#875f87", "#875faf", "#875fd7", "#875fff",
      \"#878700", "#87875f", "#878787", "#8787af", "#8787d7", "#8787ff", "#87af00", "#87af5f", "#87af87", "#87afaf",
      \"#87afd7", "#87afff", "#87d700", "#87d75f", "#87d787", "#87d7af", "#87d7d7", "#87d7ff", "#87ff00", "#87ff5f",
      \"#87ff87", "#87ffaf", "#87ffd7", "#87ffff", "#af0000", "#af005f", "#af0087", "#af00af", "#af00d7", "#af00ff",
      \"#af5f00", "#af5f5f", "#af5f87", "#af5faf", "#af5fd7", "#af5fff", "#af8700", "#af875f", "#af8787", "#af87af",
      \"#af87d7", "#af87ff", "#afaf00", "#afaf5f", "#afaf87", "#afafaf", "#afafd7", "#afafff", "#afd700", "#afd75f",
      \"#afd787", "#afd7af", "#afd7d7", "#afd7ff", "#afff00", "#afff5f", "#afff87", "#afffaf", "#afffd7", "#afffff",
      \"#d70000", "#d7005f", "#d70087", "#d700af", "#d700d7", "#d700ff", "#d75f00", "#d75f5f", "#d75f87", "#d75faf",
      \"#d75fd7", "#d75fff", "#d78700", "#d7875f", "#d78787", "#d787af", "#d787d7", "#d787ff", "#d7af00", "#d7af5f",
      \"#d7af87", "#d7afaf", "#d7afd7", "#d7afff", "#d7d700", "#d7d75f", "#d7d787", "#d7d7af", "#d7d7d7", "#d7d7ff",
      \"#d7ff00", "#d7ff5f", "#d7ff87", "#d7ffaf", "#d7ffd7", "#d7ffff", "#ff0000", "#ff005f", "#ff0087", "#ff00af",
      \"#ff00d7", "#ff00ff", "#ff5f00", "#ff5f5f", "#ff5f87", "#ff5faf", "#ff5fd7", "#ff5fff", "#ff8700", "#ff875f",
      \"#ff8787", "#ff87af", "#ff87d7", "#ff87ff", "#ffaf00", "#ffaf5f", "#ffaf87", "#ffafaf", "#ffafd7", "#ffafff",
      \"#ffd700", "#ffd75f", "#ffd787", "#ffd7af", "#ffd7d7", "#ffd7ff", "#ffff00", "#ffff5f", "#ffff87", "#ffffaf",
      \"#ffffd7", "#ffffff", "#080808", "#121212", "#1c1c1c", "#262626", "#303030", "#3a3a3a", "#444444", "#4e4e4e",
      \"#585858", "#606060", "#666666", "#767676", "#808080", "#8a8a8a", "#949494", "#9e9e9e", "#a8a8a8", "#b2b2b2",
      \"#bcbcbc", "#c6c6c6", "#d0d0d0", "#dadada", "#e4e4e4", "#eeeeee"
      \]

function! s:hi(group, data)
  let cmd = "hi " . a:group

  if exists("a:data.fg")
    let cmd .= " ctermfg=" . a:data.fg . " guifg="
    if type(a:data.fg) == 0
      let cmd .= s:gui_colors[a:data.fg]
    else
      let cmd .= a:data.fg
    endif
  endif

  if exists("a:data.bg")
    let cmd .= " ctermbg=" . a:data.bg . " guibg="
    if type(a:data.bg) == 0
      let cmd .= s:gui_colors[a:data.bg]
    else
      let cmd .= a:data.bg
    endif
  endif

  if exists("a:data.opts")
    let cmd .= " cterm=" . a:data.opts . " gui=" . a:data.opts
  endif

  silent! exe cmd
endfunction

hi clear
set background=dark

call s:hi("Boolean", { "fg": 135 })
call s:hi("Character", { "fg": 144 })
call s:hi("Number", { "fg": 13 })
call s:hi("String", { "fg": 144 })
call s:hi("Conditional", { "fg": 161, "opts": "bold" })
call s:hi("Constant", { "fg": 135,  "opts": "bold" })
call s:hi("Cursor", { "fg": 16, "bg": 253 })
call s:hi("Debug", { "fg": 225, "opts": "bold" })
call s:hi("Define", { "fg": 81 })
call s:hi("Delimiter", { "fg": 241 })

call s:hi("DiffAdd", { "bg": 24 })
call s:hi("DiffChange", { "fg": 181, "bg": 239 })
call s:hi("DiffDelete", { "fg": 162, "bg": 53 })
call s:hi("DiffText", { "bg": 102, "opts": "bold" })

call s:hi("Directory", { "fg": 118, "opts": "bold" })
call s:hi("Error", { "fg": 219, "bg": 89 })
call s:hi("ErrorMsg", { "fg": 199, "bg": 16, "opts": "bold" })
call s:hi("Exception", { "fg": 118, "opts": "bold" })
call s:hi("Float", { "fg": 135 })
call s:hi("FoldColumn", { "fg": 67, "bg": 16 })
call s:hi("Folded", { "fg": 67, "bg": 16 })
call s:hi("Function", { "fg": 118 })
call s:hi("Identifier", { "fg": 208, "opts": "none" })
call s:hi("Ignore", { "fg": 244, "bg": 232 })
call s:hi("IncSearch", { "fg": 193, "bg": 16 })

call s:hi("Keyword", { "fg": 161, "opts": "bold" })
call s:hi("Label", { "fg": 229, "opts": "none" })
call s:hi("Macro", { "fg": 193 })
call s:hi("SpecialKey", { "fg": 81 })

call s:hi("MatchParen", { "fg": 16, "bg": 208, "opts": "bold" })
call s:hi("ModeMsg", { "fg": 229 })
call s:hi("MoreMsg", { "fg": 229 })
call s:hi("Operator", { "fg": 161 })

call s:hi("Pmenu", { "fg": 15, "bg": 241 })
call s:hi("PmenuSel", { "fg": 232, "bg": 255 })
call s:hi("PmenuSbar", { "bg": 234 })
call s:hi("PmenuThumb", { "fg": 243 })

call s:hi("PreCondit", { "fg": 118, "opts": "bold" })
call s:hi("PreProc", { "fg": 118 })
call s:hi("Question", { "fg": 81 })
call s:hi("Repeat", { "fg": 161, "opts": "bold" })
call s:hi("Search", { "fg": 253, "bg": 66 })

call s:hi("SignColumn", { "fg": 118, "bg": 235 })
call s:hi("SpecialChar", { "fg": 161, "opts": "bold" })
call s:hi("SpecialComment", { "fg": 245, "opts": "bold" })
call s:hi("Special", { "fg": 81, "bg": 232 })

call s:hi("Statement", { "fg": 161, "opts": "bold" })
call s:hi("StatusLine", { "fg": 238, "bg": 253 })
call s:hi("StatusLineNC", { "fg": 244, "bg": 232 })
call s:hi("StorageClass", { "fg": 208 })
call s:hi("Structure", { "fg": 81 })
call s:hi("Tag", { "fg": 161 })
call s:hi("Title", { "fg": 166 })
call s:hi("Todo", { "fg": 231, "bg": 232, "opts": "bold" })

call s:hi("Typedef", { "fg": 81 })
call s:hi("Type", { "fg": 81, "opts": "none" })
call s:hi("Underlined", { "fg": 244, "opts": "underline" })

call s:hi("VertSplit", { "fg": 237, "bg": 237, "opts": "none" })
call s:hi("VisualNOS", { "bg": 238 })
call s:hi("Visual", { "bg": 236 })
call s:hi("WarningMsg", { "fg": 231, "bg": 238, "opts": "bold" })
call s:hi("WildMenu", { "fg": 81, "bg": 16 })

call s:hi("Normal", { "fg": 252, "bg": 233 })
call s:hi("Comment", { "fg": 59 })
call s:hi("CursorLine", { "bg": 235, "opts": "none" })
call s:hi("CursorColumn", { "bg": 235 })
call s:hi("ColorColumn", { "bg": 234 })
call s:hi("LineNr", { "fg": 250, "bg": 234 })
call s:hi("NonText", { "fg": 59 })
call s:hi("SpecialKey", { "fg": 59 })
call s:hi("TabLine", { "fg": "fg", "bg": 242, "opts": "none" })
call s:hi("TabLineFill", { "fg": "fg", "bg": 237, "opts": "none" })

call s:hi("nontext", { "fg": "bg", "opts": "none" })
