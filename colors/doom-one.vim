" !::exe [So]

if &background != 'dark'
  set background=dark
end

let colors_name = 'doom-one'

" Highlighting function {{{
function! s:_ (name, ...)
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

let s:base0      = '#1B2229'
let s:base1      = '#1c1f24'
let s:base2      = '#202328'
let s:base3      = '#23272e'
let s:base4      = '#3f444a'
let s:base5      = '#5B6268'
let s:base6      = '#73797e'
let s:base7      = '#9ca0a4'
let s:base8      = '#b1b1b1'
let s:base9      = '#E6E6E6'

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

call s:_('Normal',            s:fg,           s:bg)
call s:_('EndOfBuffer',       s:bg,           s:bg)
call s:_('NormalPopup',       s:fg_highlight, s:bg_popup)
call s:_('NormalPopover',     s:fg_highlight, s:bg_popup)
call s:_('NormalPopupPrompt', s:base7,        color#Darken(s:bg_popup, 0.3), 'bold')
call s:_('NormalPopupSubtle', s:base6,        s:bg_popup)
call s:_('NormalText',        s:fg,           'none')

call s:_('Cursor',           '', s:base0,  'reverse')
call s:_('SecondaryCursor',  '', s:highlight, 'none')

call s:_('Folded',           s:base7,  s:bg_highlight, 'none')
call s:_('FoldColumn',       s:fg_alt, s:bg_widget, '')
call s:_('SignColumn',       '',       s:bg_widget, '')
call s:_('ColorColumn',      '',       s:bg_highlight, '')

call s:_('CursorLine',       '',          s:bg_highlight)
call s:_('CursorColumn',     '',          s:bg_highlight)
call s:_('CursorLineNr',     s:highlight, s:bg_highlight, 'none')
call s:_('LineNr',           s:fg_linenr, s:bg_widget,    'none')

call s:_('IndentGuide',      s:base4, '', '')
call s:_('IndentGuidesEven', s:base4, '', '')
call s:_('IndentGuidesOdd',  s:base4, '', '')

call s:_('TermCursor',       s:fg,        'none',            'reverse')
call s:_('TermCursorNC',     s:fg_alt,    'none',            'reverse')
call s:_('TermNormal',       s:fg,        s:base0,    '')
hi! link TermNormalNC TermNormal


call s:_('Visual',         '', s:bg_visual)
call s:_('VisualBold',     '', s:bg_visual, 'bold')

call s:_('WildMenu',       s:fg,            s:bg_selection)

call s:_('StatusLine',       s:base8,  s:bg_statusline, 'none')
call s:_('StatusLineNC',     s:base6,  s:bg_statusline, 'none')
call s:_('StatusLinePart',   s:base6,  s:bg_statusline, 'bold')
call s:_('StatusLinePartNC', s:base6,  s:bg_statusline, 'bold')

call s:_('Separator', s:fg_alt, 'none')
call s:_('VertSplit', s:fg_separator,   s:bg, 'none')

call s:_('Pmenu',        s:fg,              s:bg_popup)
call s:_('PmenuSel',     s:hightlight_fg, s:highlight)
call s:_('PmenuSelBold', s:hightlight_fg, s:highlight, 'bold')
call s:_('PmenuSbar',    '',                s:bg_alt)
call s:_('PmenuThumb',   '#666660',         '#666660')

hi! link NormalFloat Pmenu
call s:_('FloatBorder', s:fg_alt, s:bg)

if exists('&pumblend')
  set pumblend=20
end

" Plugin: Incline

call s:_('InclineNormal',   color#Darken(s:fg, 40), 'none')
call s:_('InclineNormalNC', color#Darken(s:fg, 40), 'none')


" Plugin: Barbar

let s:bg_current = s:bg
let s:bg_visible = s:bg
let s:bg_other   = s:base1

call s:_('TabLine',             s:base9, s:bg_alt,     '')
call s:_('TabLineSel',          s:blue,  s:bg_current, 'bold')
call s:_('TabLineFill',         'none',  s:bg_other,   'bold')

call s:_('BufferCurrent',       s:base9,          s:bg_current,  'none')
call s:_('BufferCurrentIndex',  s:base6,          s:bg_current,  'none')
call s:_('BufferCurrentMod',    s:yellow,         s:bg_current,  'none')
call s:_('BufferCurrentSign',   s:blue,           s:bg_current,  'none')
call s:_('BufferCurrentTarget', s:red,            s:bg_current,  'bold')

call s:_('BufferVisible',       s:base7,          s:bg_visible,  'none')
call s:_('BufferVisibleIndex',  s:base9,          s:bg_visible,  'none')
call s:_('BufferVisibleMod',    s:yellow,         s:bg_visible,  'none')
call s:_('BufferVisibleSign',   s:base4,          s:bg_visible,  'none')
call s:_('BufferVisibleTarget', s:red,            s:bg_visible,  'bold')

call s:_('BufferInactive',       s:base6,          s:bg_other,    'none')
call s:_('BufferInactiveIndex',  s:base6,          s:bg_other,    'none')
call s:_('BufferInactiveMod',    s:yellow,         s:bg_other,    'none')
call s:_('BufferInactiveSign',   s:base4,          s:bg_other,    'none')
call s:_('BufferInactiveTarget', s:red,            s:bg_other,    'bold')

call s:_('BufferTabpages',       s:blue,           s:bg_statusline, 'bold')
call s:_('BufferTabpageFill',    s:base4,          s:bg_other,    'bold')
call s:_('BufferOffset',         s:base6,          s:bg,          'bold')

call s:_('BufferPart',        s:diff_info_fg,   s:diff_info_bg0, 'bold')

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

call s:_('Search',          '', s:bg_search,         'none')
call s:_('IncSearch',       s:hightlight_fg, s:bg_search_current, 'none')
call s:_('IncSearchCursor', s:hightlight_fg, s:white,             'none')

call s:_('Conceal',         s:fg_conceal, 'none', '')
call s:_('SpecialKey',      s:violet,     'none', 'bold')
call s:_('NonText',         s:fg_alt,     '',     'bold')
call s:_('MatchParen',      s:red,        'none', 'bold')
call s:_('Whitespace',      s:base4,      '',     '')


call s:_('Highlight',       '', s:bg_highlighted, 'none')
call s:_('HighlightSubtle', '', s:bg_highlighted, 'none')

call s:_('Question',        s:green, '', 'bold')

call s:_('File',            s:fg,      '', 'bold')
call s:_('Directory',       s:yellow,  '', 'bold')
call s:_('Section',         s:magenta, '', 'bold')
call s:_('Title',           s:violet,  '', 'bold')

call s:_('Bold', '', '', 'bold')
call s:_('Emphasis', s:green, '', 'bold')

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
  call s:_('Text' . key,          s:text_colors[key], '', '')
  call s:_('Text' . key . 'Bold', s:text_colors[key], '', 'bold')
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

call s:_('Tag',                  s:tag, '',        'underline')
call s:_('Link',                 s:tag, '',        'underline')
call s:_('URL',                  s:tag, '',        'underline')
hi! link Underlined     URL

call s:_('Comment',              s:base6, '',        '')
call s:_('CommentBold',          s:base6, '',        'bold')
call s:_('SpecialComment',       s:base7, '',        'bold')
hi! link CommentURL     URL
hi! link CommentLabel   CommentBold
hi! link CommentSection CommentBold
hi! link Noise Comment

call s:_('Global',               s:violet, '',         'bold')
call s:_('PreProc',              s:magenta, '',        'none')
call s:_('Macro',                s:blue, '',           'bold')
call s:_('Define',               s:blue, '',           'bold')
call s:_('PreCondit',            s:magenta, '',        'bold')
call s:_('Include',              s:blue, '',           'bold')

call s:_('Repeat',               s:blue, '',        '')
call s:_('Keyword',              s:blue, '',        '')
call s:_('Statement',            s:blue, '',        'none')
call s:_('Label',                s:blue, '',        '')

call s:_('Operator',             s:blue, '',        '')

call s:_('Constant',             s:violet, '',        'bold')
call s:_('ConstBuiltin',         s:magenta, '',       'bold')

call s:_('Conditional',          s:blue, '',        '')

call s:_('Number',               s:orange, '',        'none')
call s:_('Float',                s:orange, '',        'none')
call s:_('Boolean',              s:orange, '',        'none')
call s:_('Enum',                 s:orange, '',        'none')

call s:_('Delimiter',            s:blue,  '',        'none')
call s:_('DelimiterAlt',         s:green_alt, '',    'none')
call s:_('SpecialChar',          s:base8, '',        'bold')

call s:_('String',               s:green, '',        'none')
call s:_('StringDelimiter',      s:green, '',        'none')

call s:_('Character',            s:green, '',        'bold')


call s:_('Special',              s:violet, '',        'bold')
call s:_('SpecialBold',          s:violet, '',        'bold')


call s:_('Identifier',           s:magenta4, '',        'none')
call s:_('Argument',             s:magenta4, '',        'none')
call s:_('Variable',             s:magenta4, '',        'none')
call s:_('VariableBuiltin',      s:violet, '',          'bold')

call s:_('Function',             s:yellow, '',        'none')
call s:_('FunctionBuiltin',      s:orange, '',        'bold')
call s:_('Method',               s:yellow, '',        'none')

call s:_('Symbol',               s:magenta4, '',        'none')
call s:_('Control',              s:magenta4, '',        'none')
call s:_('PredefinedIdentifier', s:magenta4, '',        'none')
call s:_('Predefined',           s:magenta4, '',        'none')

call s:_('StaticFunc',           s:cyan, '',        'none')
call s:_('Property',             s:magenta4, '',        'none')


call s:_('Type',                 s:yellow, '',        'none')
call s:_('TypeBuiltin',          s:yellow, '',        'bold')
call s:_('StorageClass',         s:blue, '',        'none')
call s:_('Class',                s:blue, '',        'none')
call s:_('Structure',            s:blue, '',        'none')
call s:_('Typedef',              s:blue, '',        'none')

call s:_('Regexp',               '#dd0093', 'none',        'none')
call s:_('RegexpSpecial',        '#a40073', 'none',        'none')
call s:_('RegexpDelimiter',      '#540063', 'none',        'bold')
call s:_('RegexpKey',            '#5f0041', 'none',        'bold')

" }}}
" Diff                                                                       {{{

call s:_('diffLine',    s:base8, s:diff_info_bg1, 'none')
call s:_('diffSubName', s:base8, s:diff_info_bg1, 'none')

hi! clear DiffAdd
hi! clear DiffChange
hi! clear DiffText
hi! clear DiffDelete

call s:_('DiffAdd',    '',              s:diff_add_bg2,  'none')
call s:_('DiffChange', '',              s:diff_add_bg2,  'none')
call s:_('DiffText',   '',              s:diff_add_bg0,  'none')
call s:_('DiffDelete', s:gh_danger_bg0, s:gh_danger_bg1, 'none')

call s:_('DiffAdded',    s:diff_add_fg0,  s:diff_add_bg2,  'none')
call s:_('DiffModified', s:fg,            s:diff_info_bg0, 'none')
call s:_('DiffRemoved',  s:gh_danger_fg0, s:gh_danger_bg2, 'none')

call s:_('DiffAddedGutter',          s:diff_add_fg,  'none', 'bold')
call s:_('DiffModifiedGutter',       s:diff_info_fg, 'none', 'bold')
call s:_('DiffRemovedGutter',        s:gh_danger_fg, 'none', 'bold')

call s:_('DiffAddedText',          s:diff_add_fg,  'none', 'none')
call s:_('DiffModifiedText',       s:diff_info_fg, 'none', 'none')
call s:_('DiffRemovedText',        s:gh_danger_fg, 'none', 'none')

call s:_('DiffAddedGutterLineNr',    s:fg_linenr, 'none', 'none')
call s:_('DiffModifiedGutterLineNr', s:fg_linenr, 'none', 'none')
call s:_('DiffRemovedGutterLineNr',  s:fg_linenr, 'none', 'none')

" Gitgutter

hi! link GitTextAdd                DiffAddedText
hi! link GitTextChange             DiffModifiedText
hi! link GitTextChangeDelete       DiffModifiedText
hi! link GitTextDelete             DiffRemovedText

hi! link GitTextAddLineNr          DiffAddedTextLineNr
hi! link GitTextChangeLineNr       DiffModifiedTextLineNr
hi! link GitTextChangeDeleteLineNr DiffModifiedTextLineNr
hi! link GitTextDeleteLineNr       DiffRemovedTextLineNr


"                                                                            }}}
" Biscuit                                                                    {{{

call s:_('BiscuitColor', s:base5, 'none', 'none')

"                                                                            }}}
" Clap                                                                       {{{

hi! link ClapDisplay NormalPopover
hi! link ClapPreview NormalPopupPrompt

"                                                                            }}}
" Treesitter Context                                                         {{{

call s:_('TreesitterContext',           s:fg,                      s:bg_popup)
call s:_('TreesitterContextLineNumber', color#Lighten(s:fg_linenr, 0.4), s:bg_popup)

"                                                                            }}}
" Debugger                                                                   {{{

call s:_('DapUIFloatBorder',      s:base5, '', '')

call s:_('DapCurrentLine',        '',       '#444400', '')
call s:_('DapCurrentLineNum',     s:yellow, '#5E5E00', 'bold')
call s:_('DapBreakpointNum',      s:red,    '',        'bold')
call s:_('DapLogpointNum',        s:orange, '',        'bold')


call s:_('DbgCurrent',           '#DEEBFE', '#345FA8', '')
call s:_('DbgBreakPt',           '',        '#4F0037', '')

"                                                                            }}}
" CoC                                                                        {{{

let s:fg_hint = color#Darken(s:teal, 0.1)
let s:fg_inlay_hint = s:base5
let s:sp_hint = s:teal

call s:_('CocHintSign',         s:fg_hint)
call s:_('CocHintFloat',        s:fg_hint)
call s:_('CocHintVirtualText',  s:fg_inlay_hint)

hi! link CocInlayHint        CocHintVirtualText
hi! link CocRustTypeHint     CocHintVirtualText
hi! link CocRustChainingHint CocHintVirtualText

call s:_('CocHintHighlight',    '', '', 'undercurl', s:sp_hint)
call s:_('CocUnusedHighlight',  '', '', 'undercurl', s:sp_hint)

" call s:_('CocFloating',         s:base5, s:bg_popup)

hi! link CocFloating       Pmenu
hi! link CocPumMenu        Pmenu
hi! link CocMenuSel        PmenuSel
hi! link CocPumDetail      Normal
hi! link CocPumVirtualText Normal
hi! link CocPumShortcut    Pmenu
hi! link CocPumSearch      TextInfoBold

"                                                                            }}}
" Plugin: EasyMotion, Sneak {{{

call s:_('JumpTarget',          s:red,  '', 'bold')
call s:_('JumpTargetSecondary', s:blue, '', 'bold')

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

call s:_('IlluminateWord', '', color#Lighten(s:bg_highlight, 0.2), 'none')
hi! link IlluminatedWordRead IlluminateWord
hi! link IlluminatedWordText IlluminateWord
hi! link IlluminatedWordWrite IlluminateWord

" }}}
" Plugin: Sidebar {{{

" call s:_('SidebarNvimSectionSeparator', s:base6)

call s:_('SidebarNvimNormal',           s:fg,           s:bg_alt, 'none')
call s:_('SidebarNvimSectionSeparator', s:fg_separator, s:bg_alt)
call s:_('SidebarNvimSectionTitle',     s:yellow, s:bg_alt, 'bold')
call s:_('SidebarNvimEndOfBuffer',      s:bg_alt,       s:bg_alt, 'none')

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

" Typescript
hi! link @tag.attribute  Property

" Some grammars use @field too liberally. Fix here.
hi! link @field        Property
hi! link @field.python NormalText


" 1}}}
