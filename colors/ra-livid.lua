-- Save this as ~/.config/nvim/colors/ra-livid.lua
local hl = vim.api.nvim_set_hl

vim.cmd 'highlight clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.g.colors_name = 'ra-livid'

-- Color Palette (Extracted and Saturated from your VS Code Screenshot)
local palette = {
  -- Core UI
  bg = '#192027', -- The deep blue-gray background you eyedropped
  fg = '#e0e6ed', -- *Brightened* for better contrast (replaces #b2b2b2)
  gray = '#6e7b8a', -- *Brightened* comments for readability
  line_nr = '#414b53', -- More visible line numbers

  -- Selection / Active UI
  selection = '#2e3b47', -- Matching the visual selection
  line_highlight = '#1f262e', -- Subtle but visible CursorLine

  -- Syntax (Highly saturated versions of RA-Livid colors)
  teal = '#50cfcf', -- Bright teal for Keywords / Statements
  sage = '#a2e0a2', -- Saturated green for Strings
  gold = '#d9b871', -- Warm gold/tan for Functions and Calls
  purple = '#b98de0', -- Saturated purple for Control Flow / Macros
  blue_gray = '#6ea3cf', -- Clear blue for Types and Structs
  white_pure = '#ffffff', -- Pure white for specific punctuation
}

-- 1. Standard Vim UI Highlights
hl(0, 'Normal', { fg = palette.fg, bg = palette.bg })
hl(0, 'CursorLine', { bg = palette.line_highlight })
hl(0, 'Visual', { bg = palette.selection })
hl(0, 'LineNr', { fg = palette.line_nr })
hl(0, 'CursorLineNr', { fg = palette.teal, bold = true })
hl(0, 'VertSplit', { fg = '#2e3943', bg = 'NONE' })

-- 2. Standard Syntax (Fallbacks if Treesitter isn't loaded)
hl(0, 'Comment', { fg = palette.gray, italic = true })
hl(0, 'String', { fg = palette.sage })
hl(0, 'Function', { fg = palette.gold, bold = true })
hl(0, 'Keyword', { fg = palette.teal, bold = true })
hl(0, 'Statement', { fg = palette.purple, bold = true })
hl(0, 'Type', { fg = palette.blue_gray })
hl(0, 'Constant', { fg = palette.fg, bold = true })
hl(0, 'Special', { fg = palette.white_pure }) -- Things like the '#' in `#[tokio::main]`

-- 3. Tree-sitter Support (This is critical for the VS Code "Look")
--    This section resolves the flatness in your second image.

-- Variables and Identifiers
hl(0, '@variable', { fg = palette.fg })
hl(0, '@variable.builtin', { fg = palette.blue_gray, bold = true }) -- `self`
hl(0, '@property', { fg = palette.fg }) -- Struct fields / JSON keys
hl(0, '@field', { fg = palette.fg })
hl(0, '@parameter', { fg = '#d1d6db' }) -- Slightly dimmer than Normal for parameters

-- Functions and Calls (This makes Registry() and init() pop)
hl(0, '@function.call', { fg = palette.gold, bold = true })
hl(0, '@method.call', { fg = palette.gold })

-- Rust-Specific Treesitter
hl(0, '@rust_macro', { fg = palette.purple }) -- e.g., tracing::info!()
hl(0, '@macro', { fg = palette.purple })
hl(0, '@attribute', { fg = palette.purple }) -- e.g., #[tokio::main]
hl(0, '@type.builtin', { fg = palette.blue_gray, bold = true }) -- u32, &str
hl(0, '@punctuation.bracket', { fg = '#788ca0' }) -- Muted brackets
hl(0, '@punctuation.delimiter', { fg = palette.white_pure }) -- Colons, semicolons

-- 4. LSP & Diagnostics (Matches the colors VS Code uses for errors/warnings)
hl(0, 'DiagnosticError', { fg = '#e67373' })
hl(0, 'DiagnosticWarn', { fg = '#e6c373' })
hl(0, 'DiagnosticInfo', { fg = palette.teal })
hl(0, 'DiagnosticHint', { fg = palette.sage })
