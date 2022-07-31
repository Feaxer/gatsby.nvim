--  `:Lushify`

local lush = require "lush"
local hsl = lush.hsl

-- stylua: ignore start
local purple    = hsl(276, 65, 78)
local blue      = hsl(200, 70, 66)
local cyan      = hsl(181, 71, 69)
local green     = hsl(90, 60, 66)
local yellow    = hsl(45, 100, 70)
local orange    = hsl(20, 96, 70)
local red       = hsl(346, 108, 67)
local fg        = hsl(248, 25, 94)
local gray      = hsl(260, 8, 57)
-- local bg        = hsl(260, 19, 16)
local bg        = hsl(230, 20, 15)
local black     = bg.da(25)

local highlight = hsl(66, 100, 27)

---@diagnostic disable: undefined-global
local theme = lush(function()
    return {
        HopCursor = { bg = highlight },
        Normal { fg = fg, bg = bg }, -- Normal text
        NormalFloat { bg = black, fg = Normal.fg }, -- Normal text in floating windows.
        -- NormalNC     { }, -- normal text in non-current windows
        -- ColorColumn  { }, -- Columns set with 'colorcolumn'
        -- Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        -- Cursor { bg = Normal.bg.darken(30) }, -- Character under the cursor
        -- lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
        -- CursorColumn { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine { bg = black }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        -- Directory    { }, -- Directory names (and other special names in listings)
        GitSignsChangeNr { bg = Normal.bg, fg = purple }, 
        DiffAdd      { }, -- Diff mode: Added line |diff.txt|
        DiffChange   { bg = Normal.bg }, -- Diff mode: Changed line |diff.txt|
        DiffDelete   { }, -- Diff mode: Deleted line |diff.txt|
        DiffText     { }, -- Diff mode: Changed text within a changed line |diff.txt|
        -- EndOfBuffer  { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor   { }, -- Cursor in a focused terminal
        -- TermCursorNC { }, -- Cursor in an unfocused terminal
        -- ErrorMsg     { }, -- Error messages on the command line
        -- VertSplit    { }, -- Column separating vertically split windows
        Folded       { }, -- Line used for closed folds
        FoldColumn   { }, -- 'foldcolumn'
        SignColumn   { }, -- Column where |signs| are displayed
        -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        -- Substitute   { }, -- |:substitute| replacement text highlighting
        LineNr { fg = Normal.bg.li(25), bg = Normal.bg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        CursorLineNr { fg = fg, bg = CursorLine.bg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        -- MatchParen   { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea      { }, -- Area for messages and cmdline
        -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        -- MoreMsg      { }, -- |more-prompt|
        -- NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        -- Pmenu        { }, -- Popup menu: Normal item.
        -- PmenuSel     { }, -- Popup menu: Selected item.
        -- PmenuSbar    { }, -- Popup menu: Scrollbar.
        -- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
        -- Question     { }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search { bg = highlight, fg = highlight.li(50) }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        -- StatusLine   { }, -- Status line of current window
        -- StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        -- TabLine      { }, -- Tab pages line, not active tab page label
        -- TabLineFill  { }, -- Tab pages line, where there are no labels
        -- TabLineSel   { }, -- Tab pages line, active tab page label
        -- Title        { }, -- Titles for output from ":set all", ":autocmd" etc.
        -- Visual       { }, -- Visual mode selection
        -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
        -- WarningMsg   { }, -- Warning messages
        -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        -- WildMenu     { }, -- Current match in 'wildmenu' completion

        -- Common vim syntax groups used for all kinds of code and markup.
        -- Commented-out groups should chain up to their preferred (*) group
        -- by default.
        --
        -- See :h group-name
        --
        -- Uncomment and edit if you want more specific syntax highlighting.

        Comment { fg = Normal.bg.li(35) }, -- Any comment

        -- Constant       { }, -- (*) Any constant
        -- String         { }, --   A string constant: "this is a string"
        -- Character      { }, --   A character constant: 'c', '\n'
        -- Number         { }, --   A number constant: 234, 0xff
        -- Boolean        { }, --   A boolean constant: TRUE, false
        -- Float          { }, --   A floating point constant: 2.3e10

        Identifier     { fg = red }, -- (*) Any variable name
        Function       { fg = cyan }, --   Function name (also: methods for classes)

        base_keyword  { fg = purple },
        Statement      { fg = base_keyword.fg }, -- (*) Any statement
        Conditional    { fg = base_keyword.fg }, --   if, then, else, endif, switch, etc.
        Repeat         { fg = base_keyword.fg }, --   for, do, while, etc.
        Label          { fg = base_keyword.fg }, --   case, default, etc.
        Operator       { fg = base_keyword.fg }, --   "sizeof", "+", "*", etc.
        Keyword        { fg = base_keyword.fg }, --   any other keyword
        Exception      { fg = base_keyword.fg }, --   try, catch, throw

        base_include  { fg = purple },
        PreProc        { fg = base_include.fg }, -- (*) Generic Preprocessor
        Include        { fg = base_include.fg }, --   Preprocessor #include
        Define         { fg = base_include.fg }, --   Preprocessor #define
        Macro          { fg = base_include.fg }, --   Same as Define
        PreCondit      { fg = base_include.fg }, --   Preprocessor #if, #else, #endif, etc.

        base_type { fg = blue },
        Type           { fg = base_type.fg }, -- (*) int, long, char, etc.
        StorageClass   { fg = base_type.fg }, --   static, register, volatile, etc.
        Structure      { fg = base_type.fg }, --   struct, union, enum, etc.
        Typedef        { fg = base_type.fg }, --   A typedef

        Special        { fg = orange }, -- (*) Any special symbol
        SpecialChar    { fg = orange }, --   Special character in a constant
        Tag            { fg = red }, --   You can use CTRL-] on this
        Delimiter      { fg = gray }, --   Character that needs attention
        SpecialComment { }, --   Special things inside a comment (e.g. '\n')
        Debug          { }, --   Debugging statements

        -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
        -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        -- Error          { }, -- Any erroneous construct
        -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- These groups are for the native LSP client and diagnostic system. Some
        -- other LSP clients may use these groups, or use their own. Consult your
        -- LSP client's documentation.

        -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- LspReferenceText            { } , -- Used for highlighting "text" references
        -- LspReferenceRead            { } , -- Used for highlighting "read" references
        -- LspReferenceWrite           { } , -- Used for highlighting "write" references
        -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
        -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
        -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
        -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
        -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
        -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
        -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
        -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
        -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
        -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
        -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
        -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
        -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
        -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

        -- Tree-Sitter syntax groups. Most link to corresponding
        -- vim syntax groups (e.g. TSKeyword => Keyword) by default.
        --
        -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- TSAttribute          { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
        -- TSBoolean            { } , -- Boolean literals: `True` and `False` in Python.
        -- TSCharacter          { } , -- Character literals: `'a'` in C.
        -- TSCharacterSpecial   { } , -- Special characters.
        -- TSComment            { } , -- Line comments and block comments.
        -- TSConditional        { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
        -- TSConstant           { } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
        -- TSConstBuiltin       { } , -- Built-in constant values: `nil` in Lua.
        -- TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
        -- TSConstructor        { } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
        -- TSDebug              { } , -- Debugging statements.
        -- TSDefine             { } , -- Preprocessor #define statements.
        -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
        -- TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
        -- TSField              { } , -- Object and struct fields.
        -- TSFloat              { } , -- Floating-point number literals.
        TSFunction           { fg = Function.fg } , -- Function calls and definitions.
        -- TSFuncBuiltin        { } , -- Built-in functions: `print` in Lua.
        -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
        -- TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
        -- TSKeyword            { } , -- Keywords that don't fit into other categories.
        -- TSKeywordFunction    { } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
        -- TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
        -- TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
        -- TSLabel              { } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
        -- TSMethod             { } , -- Method calls and definitions.
        -- TSNamespace          { } , -- Identifiers referring to modules and namespaces.
        -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
        -- TSNumber             { } , -- Numeric literals that don't fit into other categories.
        -- TSOperator           { } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
        -- TSParameter          { } , -- Parameters of a function.
        -- TSParameterReference { } , -- References to parameters of a function.
        -- TSPreProc            { } , -- Preprocessor #if, #else, #endif, etc.
        -- TSProperty           { } , -- Same as `TSField`.
        -- TSPunctDelimiter     { } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
        -- TSPunctBracket       { } , -- Brackets, braces, parentheses, etc.
        -- TSPunctSpecial       { } , -- Special punctuation that doesn't fit into the previous categories.
        -- TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
        -- TSStorageClass       { } , -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
        -- TSString             { } , -- String literals.
        -- TSStringRegex        { } , -- Regular expression literals.
        -- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
        -- TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
        -- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
        TSTag                { fg = Tag.fg } , -- Tags like HTML tag names.
        -- TSTagAttribute       { } , -- HTML tag attributes.
        -- TSTagDelimiter       { } , -- Tag delimiters like `<` `>` `/`.
        -- TSText               { } , -- Non-structured text. Like text in a markup language.
        -- TSStrong             { } , -- Text to be represented in bold.
        -- TSEmphasis           { } , -- Text to be represented with emphasis.
        -- TSUnderline          { } , -- Text to be represented with an underline.
        -- TSStrike             { } , -- Strikethrough text.
        -- TSTitle              { } , -- Text that is part of a title.
        -- TSLiteral            { } , -- Literal or verbatim text.
        -- TSURI                { } , -- URIs like hyperlinks or email addresses.
        -- TSMath               { } , -- Math environments like LaTeX's `$ ... $`
        -- TSTextReference      { } , -- Footnotes, text references, citations, etc.
        -- TSEnvironment        { } , -- Text environments of markup languages.
        -- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
        -- TSNote               { } , -- Text representation of an informational note.
        -- TSWarning            { } , -- Text representation of a warning note.
        -- TSDanger             { } , -- Text representation of a danger note.
        -- TSType               { } , -- Type (and class) definitions and annotations.
        -- TSTypeBuiltin        { } , -- Built-in types: `i32` in Rust.
        -- TSVariable           { } , -- Variable names that don't fit into other categories.
        -- TSVariableBuiltin    { } , -- Variable names defined by the language: `this` or `self` in Javascript.
    }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme
-- stylua: ignore end
-- vi:nowrap
