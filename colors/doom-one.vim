" !::exe [So]

if &background != 'dark'
  set background=dark
end

let colors_name = 'doom-one'

" Highlighting function {{{
function! s:h (name, ...)
  let fg = ''
  let bg = ''
  let attr = ''
  let sp = ''

  if type(a:1) == 3
    let fg   = get(a:1, 0, '')
    let bg   = get(a:1, 1, '')
    let attr = get(a:1, 2, '')
    let sp   = get(a:1, 3, '')
  else
    let fg   = get(a:000, 0, '')
    let bg   = get(a:000, 1, '')
    let attr = get(a:000, 2, '')
    let sp   = get(a:000, 3, '')
  end

  let has_props = v:false

  let cmd = 'hi! ' . a:name
  if !empty(fg) && fg != 'none'
    let cmd .= ' guifg=' . fg
    let has_props = v:true
  end
  if !empty(bg) && bg != 'none'
    let cmd .= ' guibg=' . bg
    let has_props = v:true
  end
  if !empty(attr) && attr != 'none'
    let cmd .= ' gui=' . attr
    let has_props = v:true
  end
  if !empty(sp) && sp != 'none'
    let cmd .= ' guisp=' . sp
    let has_props = v:true
  end
  execute 'hi! clear ' a:name
  if has_props
    execute cmd
  end
endfunc

" }}}
" Colors                                                                     {{{

let s:base0      = '#1b2229'
let s:base1      = '#1c1f24'
let s:base2      = '#202328'
let s:base3      = '#23272e'
let s:base4      = '#3f444a'
let s:base5      = '#5B6268'
let s:base6      = '#73797e'
let s:base7      = '#9ca0a4'
let s:base8      = '#b1b1b1'
let s:base9      = '#e6e6e6'

let s:grey       = s:base4
let s:red        = '#ff6c6b'
let s:orange     = '#da8548'
let s:green      = '#98be65'
let s:teal       = '#4db5bd'
let s:yellow     = '#ECBE7B'
let s:blue       = '#51afef'
let s:dark_blue  = '#2257A0'
let s:magenta    = '#c678dd'
let s:violet     = '#a9a1e1'
let s:cyan       = '#46D9FF'
let s:dark_cyan  = '#5699AF'
let s:white      = '#efefef'

let s:green_alt  = '#799033'

let s:magenta4 = color#Darken(s:magenta, 0.0)

let s:bg             = '#282c34'
let s:bg_alt         = '#21242b'
let s:bg_highlight   = '#2E323C'
let s:bg_popup       = '#3E4556'
let s:bg_widget      = s:bg
let s:bg_statusline  = s:bg_popup
let s:bg_visual      = color#Lighten(s:base4, 0.3)
let s:bg_selection   = s:dark_blue
let s:bg_highlighted = '#4A4A45'

let s:fg           = '#bbc2cf'
let s:fg_alt       = '#5B6268'
let s:fg_popup     = '#D1D6DF'
let s:fg_widget    = s:fg
let s:fg_conceal   = s:base4
let s:fg_subtle    = s:base7
let s:fg_highlight = color#Lighten(s:fg, 0.2)
let s:fg_linenr    = color#Mix(s:base4, s:base5, 0.3)
let s:fg_separator = s:base4


let s:highlight       = s:blue
let s:hightlight_fg = s:base0

let s:tag    = color#Mix(s:blue, s:cyan)

let s:diff_info_fg  = s:blue
let s:diff_info_bg0 = color#Mix('#D8EEFD', s:bg, 0.6)
let s:diff_info_bg1 = color#Mix('#D8EEFD', s:bg, 0.8)

let s:diff_add_fg  = s:green
let s:diff_add_fg0 = color#Mix(s:green,   s:fg, 0.4)
let s:diff_add_bg0 = color#Mix('#506d5b', s:bg, 0.4)
let s:diff_add_bg1 = color#Mix('#acf2bd', s:bg, 0.6)
let s:diff_add_bg2 = color#Mix('#acf2bd', s:bg, 0.8)

let s:gh_danger_fg  = s:red
let s:gh_danger_fg0 = color#Mix(s:red,     s:fg, 0.6)
let s:gh_danger_bg0 = color#Mix('#FBB0B9', s:bg, 0.6)
let s:gh_danger_bg1 = color#Mix('#FBB0B9', s:bg, 0.8)
let s:gh_danger_bg2 = color#Mix('#FBB0B9', s:bg, 0.9)

" }}}
" General UI                                                                 {{{

call s:h('Normal',            s:fg,           s:bg)
call s:h('EndOfBuffer',       s:bg,           s:bg)
call s:h('NormalPopup',       s:fg_highlight, s:bg_popup)
call s:h('NormalPopover',     s:fg_highlight, s:bg_popup)
call s:h('NormalPopupPrompt', s:base7,        color#Darken(s:bg_popup, 0.3), 'bold')
call s:h('NormalPopupSubtle', s:base6,        s:bg_popup)
call s:h('NormalText',        s:fg,           'none')
hi! link NormalNC Normal

call s:h('Cursor',           '', s:base0,  'reverse')
call s:h('SecondaryCursor',  '', s:highlight, 'none')

call s:h('Folded',           s:base7,  s:bg_highlight, 'none')
call s:h('FoldColumn',       s:fg_alt, s:bg_widget, '')
call s:h('SignColumn',       '',       s:bg_widget, '')
call s:h('ColorColumn',      '',       s:bg_highlight, '')

call s:h('CursorLine',       '',          s:bg_highlight)
call s:h('CursorColumn',     '',          s:bg_highlight)
call s:h('CursorLineNr',     s:highlight, s:bg_highlight, 'none')
call s:h('LineNr',           s:fg_linenr, s:bg_widget,    'none')

call s:h('IndentGuide',      s:base4, '', '')
call s:h('IndentGuidesEven', s:base4, '', '')
call s:h('IndentGuidesOdd',  s:base4, '', '')

call s:h('TermCursor',       s:fg,        'none',            'reverse')
call s:h('TermCursorNC',     s:fg_alt,    'none',            'reverse')
call s:h('TermNormal',       s:fg,        s:base0,    '')
hi! link TermNormalNC TermNormal


call s:h('Visual',         '', s:bg_visual)
call s:h('VisualBold',     '', s:bg_visual, 'bold')

call s:h('WildMenu',       s:fg,            s:bg_selection)

call s:h('StatusLine',       s:base8,  s:bg_statusline, 'none')
call s:h('StatusLineNC',     s:base6,  s:bg_statusline, 'none')
call s:h('StatusLinePart',   s:base6,  s:bg_statusline, 'bold')
call s:h('StatusLinePartNC', s:base6,  s:bg_statusline, 'bold')

call s:h('Separator', s:fg_alt, 'none')
call s:h('WinSeparator', s:fg_separator,   s:bg, 'none')
call s:h('VertSplit', s:fg_separator,   s:bg, 'none')

call s:h('Pmenu',        s:fg_popup,      s:bg_popup)
call s:h('PmenuSel',     s:hightlight_fg, s:highlight)
call s:h('PmenuSelBold', s:hightlight_fg, s:highlight, 'bold')
call s:h('PmenuSbar',    '',                s:bg_alt)
call s:h('PmenuThumb',   '#666660',         '#666660')

hi! link NormalFloat Pmenu
call s:h('FloatBorder', s:fg_alt, s:bg)

if exists('&pumblend')
  set pumblend=20
end

call s:h('WinBar',          s:fg,     s:bg, 'none', s:base4)
call s:h('WinBarSeparator', s:base6,  s:bg, 'none', s:base4)
call s:h('WinBarModified',  s:yellow, s:bg, 'none', s:base4)


" Plugin: Incline

call s:h('InclineNormal',   color#Darken(s:fg, 40), 'none')
call s:h('InclineNormalNC', color#Darken(s:fg, 40), 'none')


" Plugin: Barbar

let s:bg_current = s:bg
let s:bg_visible = s:bg
let s:bg_other   = s:base1

call s:h('TabLine',             s:base9, s:bg_alt,     '')
call s:h('TabLineSel',          s:blue,  s:bg_current, 'bold')
call s:h('TabLineFill',         'none',  s:bg_other,   'bold')

call s:h('BufferCurrent',       s:base9,          s:bg_current,  'none')
call s:h('BufferCurrentIndex',  s:base6,          s:bg_current,  'none')
call s:h('BufferCurrentMod',    s:yellow,         s:bg_current,  'none')
call s:h('BufferCurrentSign',   s:blue,           s:bg_current,  'none')
call s:h('BufferCurrentTarget', s:red,            s:bg_current,  'bold')

call s:h('BufferVisible',       s:base7,          s:bg_visible,  'none')
call s:h('BufferVisibleIndex',  s:base9,          s:bg_visible,  'none')
call s:h('BufferVisibleMod',    s:yellow,         s:bg_visible,  'none')
call s:h('BufferVisibleSign',   s:base4,          s:bg_visible,  'none')
call s:h('BufferVisibleTarget', s:red,            s:bg_visible,  'bold')

call s:h('BufferInactive',       s:base6,          s:bg_other,    'none')
call s:h('BufferInactiveIndex',  s:base6,          s:bg_other,    'none')
call s:h('BufferInactiveMod',    s:yellow,         s:bg_other,    'none')
call s:h('BufferInactiveSign',   s:base4,          s:bg_other,    'none')
call s:h('BufferInactiveTarget', s:red,            s:bg_other,    'bold')

call s:h('BufferTabpages',       s:blue,           s:bg_statusline, 'bold')
call s:h('BufferTabpageFill',    s:base4,          s:bg_other,    'bold')
call s:h('BufferOffset',         s:base6,          s:bg,          'bold')
call s:h('BufferScrollArrow',    s:base8,          s:bg_other,       'bold')

call s:h('BufferPart',        s:diff_info_fg,   s:diff_info_bg0, 'bold')

if has("nvim") && get(g:, 'doom_one_terminal_colors', v:false)
  let g:terminal_color_0 = s:bg
  let g:terminal_color_1 = s:red
  let g:terminal_color_2 = s:green_alt
  let g:terminal_color_3 = s:orange
  let g:terminal_color_4 = s:dark_blue
  let g:terminal_color_5 = s:magenta
  let g:terminal_color_6 = s:dark_cyan
  let g:terminal_color_7 = s:fg
  let g:terminal_color_8 = s:grey
  let g:terminal_color_9 = s:orange
  let g:terminal_color_10 = s:green
  let g:terminal_color_11 = s:yellow
  let g:terminal_color_12 = s:blue
  let g:terminal_color_13 = s:violet
  let g:terminal_color_14 = s:cyan
  let g:terminal_color_15 = s:white
  let g:terminal_color_background = s:bg
  let g:terminal_color_foreground = s:fg
endif

" }}}
" Search, Highlight, Conceal, Messages                                       {{{

" let s:bg_search = color#Mix(s:bg, s:yellow, 0.2)
let s:bg_search         = color#Mix(s:yellow, s:bg, 0.8)
let s:bg_search_current = s:orange

call s:h('Search',          '', s:bg_search,         'none')
call s:h('IncSearch',       s:hightlight_fg, s:bg_search_current, 'none')
call s:h('IncSearchCursor', s:hightlight_fg, s:white,             'none')

call s:h('Conceal',         s:fg_conceal, 'none', '')
call s:h('SpecialKey',      s:violet,     'none', 'bold')
call s:h('NonText',         s:fg_alt,     '',     'bold')
call s:h('MatchParen',      s:red,        'none', 'bold')
call s:h('Whitespace',      s:base4,      '',     '')


call s:h('Highlight',       '', s:bg_highlighted, 'none')
call s:h('HighlightSubtle', '', s:bg_highlighted, 'none')

call s:h('Question',        s:green, '', 'bold')

call s:h('File',            s:fg,      '', 'bold')
call s:h('Directory',       s:yellow,  '', 'bold')
call s:h('Section',         s:magenta, '', 'bold')
call s:h('Title',           s:violet,  '', 'bold')

call s:h('Bold', '', '', 'bold')
call s:h('Emphasis', s:green, '', 'bold')

" Text levels                                                                {{{

let s:text_colors = {
\ 'Normal':  s:fg,
\ 'Info':    s:blue,
\ 'Hint':    s:teal,
\ 'Success': s:green,
\ 'Warning': s:yellow,
\ 'Debug':   s:yellow,
\ 'Error':   s:red,
\ 'Special': s:violet,
\ 'Muted':   s:base7,
\}
for key in keys(s:text_colors)
  call s:h('Text' . key,          s:text_colors[key], '', '')
  call s:h('Text' . key . 'Bold', s:text_colors[key], '', 'bold')
endfor

" NOTE/DONE/TODO/FIXME/XXX/DEPRECATED comment highlights

" }}}

hi! link Msg        TextSuccess
hi! link MoreMsg    TextInfo
hi! link WarningMsg TextWarning
hi! link ErrorMsg   TextError
hi! link Error      TextError
hi! link ModeMsg    TextSpecial
hi! link Todo       TextWarningBold


" LSP & Diagnostics

hi link LspDiagnosticsDefaultHint TextHint
hi link LspDiagnosticsDefaultError TextError
hi link LspDiagnosticsDefaultWarning TextWarning
hi link LspDiagnosticsDefaultInformation TextInfo


" }}}
" Main Syntax                                                                {{{

call s:h('Tag',                  s:tag, '',        'underline')
call s:h('Link',                 s:tag, '',        'underline')
call s:h('URL',                  s:tag, '',        'underline')
hi! link Underlined     URL

call s:h('Comment',              s:base6, '',        '')
call s:h('CommentBold',          s:base6, '',        'bold')
call s:h('SpecialComment',       s:base7, '',        'bold')
hi! link CommentURL     URL
hi! link CommentLabel   CommentBold
hi! link CommentSection CommentBold
hi! link Noise Comment

call s:h('Global',               s:violet, '',         'bold')
call s:h('PreProc',              s:magenta, '',        'none')
call s:h('Macro',                s:blue, '',           'bold')
call s:h('Define',               s:blue, '',           'bold')
call s:h('PreCondit',            s:magenta, '',        'bold')
call s:h('Include',              s:blue, '',           'bold')

call s:h('Repeat',               s:blue, '',        '')
call s:h('Keyword',              s:blue, '',        '')
call s:h('Statement',            s:blue, '',        'none')
call s:h('Label',                s:blue, '',        '')

call s:h('Operator',             s:blue, '',        '')

call s:h('Constant',             s:violet, '',        'bold')
call s:h('ConstBuiltin',         s:magenta, '',       'bold')

call s:h('Conditional',          s:blue, '',        '')

call s:h('Number',               s:orange, '',        'none')
call s:h('Float',                s:orange, '',        'none')
call s:h('Boolean',              s:orange, '',        'none')
call s:h('Enum',                 s:orange, '',        'none')

call s:h('Delimiter',            s:blue,  '',        'none')
call s:h('DelimiterAlt',         s:green_alt, '',    'none')
call s:h('SpecialChar',          s:base8, '',        'bold')

call s:h('String',               s:green, '',        'none')
call s:h('StringDelimiter',      s:green, '',        'none')

call s:h('Character',            s:green, '',        'bold')


call s:h('Special',              s:violet, '',        'bold')
call s:h('SpecialBold',          s:violet, '',        'bold')


call s:h('Identifier',           s:magenta4, '',        'none')
call s:h('Argument',             s:magenta4, '',        'none')
call s:h('Variable',             s:magenta4, '',        'none')
call s:h('VariableBuiltin',      s:violet, '',          'bold')

call s:h('Function',             s:yellow, '',        'none')
call s:h('FunctionBuiltin',      s:orange, '',        'bold')
call s:h('Method',               s:yellow, '',        'none')

call s:h('Symbol',               s:magenta4, '',        'none')
call s:h('Control',              s:magenta4, '',        'none')
call s:h('PredefinedIdentifier', s:magenta4, '',        'none')
call s:h('Predefined',           s:magenta4, '',        'none')

call s:h('StaticFunc',           s:cyan, '',        'none')
call s:h('Property',             s:magenta4, '',        'none')


call s:h('Type',                 s:yellow, '',        'none')
call s:h('TypeBuiltin',          s:yellow, '',        'bold')
call s:h('StorageClass',         s:blue, '',        'none')
call s:h('Class',                s:blue, '',        'none')
call s:h('Structure',            s:blue, '',        'none')
call s:h('Typedef',              s:blue, '',        'none')

call s:h('Regexp',               '#dd0093', 'none',        'none')
call s:h('RegexpSpecial',        '#a40073', 'none',        'none')
call s:h('RegexpDelimiter',      '#540063', 'none',        'bold')
call s:h('RegexpKey',            '#5f0041', 'none',        'bold')

" }}}
" Diff                                                                       {{{

call s:h('diffLine',    s:base8, s:diff_info_bg1, 'none')
call s:h('diffSubName', s:base8, s:diff_info_bg1, 'none')

hi! clear DiffAdd
hi! clear DiffChange
hi! clear DiffText
hi! clear DiffDelete

call s:h('DiffAdd',    '',              s:diff_add_bg2,  'none')
call s:h('DiffChange', '',              s:diff_add_bg2,  'none')
call s:h('DiffText',   '',              s:diff_add_bg0,  'none')
call s:h('DiffDelete', s:gh_danger_bg0, s:gh_danger_bg1, 'none')

call s:h('DiffAdded',    s:diff_add_fg0,  s:diff_add_bg2,  'none')
call s:h('DiffModified', s:fg,            s:diff_info_bg0, 'none')
call s:h('DiffRemoved',  s:gh_danger_fg0, s:gh_danger_bg2, 'none')

call s:h('DiffAddedGutter',          s:diff_add_fg,  'none', 'bold')
call s:h('DiffModifiedGutter',       s:diff_info_fg, 'none', 'bold')
call s:h('DiffRemovedGutter',        s:gh_danger_fg, 'none', 'bold')

call s:h('DiffAddedText',          s:diff_add_fg,  'none', 'none')
call s:h('DiffModifiedText',       s:diff_info_fg, 'none', 'none')
call s:h('DiffRemovedText',        s:gh_danger_fg, 'none', 'none')

call s:h('DiffAddedGutterLineNr',    s:fg_linenr, 'none', 'none')
call s:h('DiffModifiedGutterLineNr', s:fg_linenr, 'none', 'none')
call s:h('DiffRemovedGutterLineNr',  s:fg_linenr, 'none', 'none')

" Gitgutter

hi! link GitGutterAdd                DiffAddedText
hi! link GitGutterChange             DiffModifiedText
hi! link GitGutterChangeDelete       DiffModifiedText
hi! link GitGutterDelete             DiffRemovedText

hi! link GitGutterAddLineNr          DiffAddedTextLineNr
hi! link GitGutterChangeLineNr       DiffModifiedTextLineNr
hi! link GitGutterChangeDeleteLineNr DiffModifiedTextLineNr
hi! link GitGutterDeleteLineNr       DiffRemovedTextLineNr


"                                                                            }}}
" Biscuit                                                                    {{{

call s:h('BiscuitColor', s:base5, 'none', 'none')

"                                                                            }}}
" Clap                                                                       {{{

hi! link ClapDisplay NormalPopover
hi! link ClapPreview NormalPopupPrompt

"                                                                            }}}
" Treesitter Context                                                         {{{

call s:h('TreesitterContext',           s:fg,                      s:bg_popup)
call s:h('TreesitterContextLineNumber', color#Lighten(s:fg_linenr, 0.4), s:bg_popup)

"                                                                            }}}
" Debugger                                                                   {{{

call s:h('DapUIFloatBorder',      s:base5, '', '')

call s:h('DapCurrentLine',        '',       '#444400', '')
call s:h('DapCurrentLineNum',     s:yellow, '#5E5E00', 'bold')
call s:h('DapBreakpointNum',      s:red,    '',        'bold')
call s:h('DapLogpointNum',        s:orange, '',        'bold')


call s:h('DbgCurrent',           '#DEEBFE', '#345FA8', '')
call s:h('DbgBreakPt',           '',        '#4F0037', '')

"                                                                            }}}
" CoC                                                                        {{{

let s:fg_hint = color#Darken(s:teal, 0.1)
let s:fg_inlay_hint = s:base5
let s:sp_hint = s:teal

call s:h('CocHintSign',         s:fg_hint)
call s:h('CocHintFloat',        s:fg_hint)
call s:h('CocHintVirtualText',  s:fg_inlay_hint)

hi! link CocInlayHint        CocHintVirtualText
hi! link CocRustTypeHint     CocHintVirtualText
hi! link CocRustChainingHint CocHintVirtualText

call s:h('CocHintHighlight',    '', '', 'undercurl', s:sp_hint)
call s:h('CocUnusedHighlight',  '', '', 'undercurl', s:sp_hint)

" call s:h('CocFloating',         s:base5, s:bg_popup)

hi! link CocFloating       Pmenu
hi! link CocPumMenu        Pmenu
hi! link CocMenuSel        PmenuSel
hi! link CocPumDetail      Normal
hi! link CocPumVirtualText Normal
hi! link CocPumShortcut    Pmenu
call s:h('CocPumSearch', color#Lighten(s:magenta, 0.2), '', 'bold')

"                                                                            }}}
" Plugin: EasyMotion, Sneak {{{

call s:h('JumpTarget',          s:red,  '', 'bold')
call s:h('JumpTargetSecondary', s:blue, '', 'bold')

hi!  link EasyMotionShadeDefault  Comment
hi!  link EasyMotionTargetDefault JumpTarget

hi!  link Sneak                   JumpTarget
hi!  link SneakPluginTarget       JumpTarget
hi!  link SneakStreakTarget       JumpTarget
hi!  link SneakStreakMask         EasyMotionShadeDefault

hi! link LeapLabelPrimary   JumpTarget
hi! link LeapLabelSecondary JumpTargetSecondary
hi! link LeapBackdrop       EasyMotionShadeDefault

" }}}
" Plugin: IndentBlankline {{{

hi! link IndentBlanklineChar               IndentGuide
hi! link IndentBlanklineSpaceChar          IndentGuide
hi! link IndentBlanklineSpaceCharBlankline IndentGuide

" }}}
" Plugin: Illuminate {{{

call s:h('IlluminateWord', '', color#Lighten(s:bg_highlight, 0.2), 'none')
hi! link IlluminatedWordRead IlluminateWord
hi! link IlluminatedWordText IlluminateWord
hi! link IlluminatedWordWrite IlluminateWord

" }}}
" Plugin: Sidebar {{{

" call s:h('SidebarNvimSectionSeparator', s:base6)

call s:h('SidebarNvimNormal',           s:fg,           s:bg_alt, 'none')
call s:h('SidebarNvimSectionSeparator', s:fg_separator, s:bg_alt)
call s:h('SidebarNvimSectionTitle',     s:yellow, s:bg_alt, 'bold')
call s:h('SidebarNvimEndOfBuffer',      s:bg_alt,       s:bg_alt, 'none')

hi! link SidebarNvimLabelCount Comment

hi! link SidebarNvimGitStatusDiffAdded    DiffAddedText
hi! link SidebarNvimGitStatusDiffRemoved  DiffRemovedText

hi! link SidebarNvimLineNr Comment

" }}}
" Plugin: SearchBox {{{

hi! link SearchBoxWarning TextWarning
hi! link SearchBoxSpecial TextSpecial

" }}}
" Languages/Others                                                    {{{1

" Help                                                                      {{{2

hi! link helpURL           URL

" Neovim Treesitter                                                         {{{2

if has('nvim-0.8')

hi! link @annotation            PreProc
hi! link @attribute             Macro
hi! link @boolean               Boolean
hi! link @character             Character
hi! link @conditional           Conditional
hi! link @constant              Constant
hi! link @constant.builtin      ConstBuiltin
hi! link @constant.macro        Macro
hi! link @constant.ructor       Method
hi! link @emphasis              Emphasis
hi! link @error                 Error
hi! link @exception             Error
hi! link @field                 NormalText
hi! link @float                 Float
hi! link @function              Function
hi! link @function.builtin      FunctionBuiltin
hi! link @function.macro        Function
hi! link @include               Include
hi! link @keyword               Keyword
hi! link @keyword.function      Keyword
hi! link @keyword.operator      Operator
hi! link @label                 Label
hi! link @literal               Constant
hi! link @method                Method
hi! link @namespace             Directory
hi! link @number                Number
hi! link @operator              Operator
hi! link @parameter             Argument
hi! link @parameter.reference   Argument
hi! link @property              Property
hi! link @punctuation.bracket   Delimiter
hi! link @punctuation.delimiter Delimiter
hi! link @punctuation.special   DelimiterAlt
hi! link @repeat                Repeat
hi! link @string                String
hi! link @string.escape         StringDelimiter
hi! link @string.regex          Regexp
hi! link @strong                Bold
hi! link @structure             Structure
hi! link @tag                   Keyword
hi! link @tag.delimiter         Delimiter
hi! link @text                  String
hi! link @title                 Title
hi! link @type                  Type
hi! link @type.builtin          TypeBuiltin
hi! link @underline             Underlined
hi! link @uri                   URL
hi! link @variable              NormalText
hi! link @variable.builtin      VariableBuiltin

hi! link @text.literal String

" Typescript
hi! link @tag.attribute  Property

" Some grammars use @field too liberally. Fix here.
hi! link @field        Property
hi! link @field.python NormalText

end

" 1}}}
