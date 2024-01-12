vim.o.background = "dark"
local C = require('ui.theme').palette

local config = {
  undercurl = true,
  underline = true,
  bold = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "",  -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
    CmpItemKindKeyword = { fg = C.base, bg = C.red },
    CmpItemKindText = { fg = C.base, bg = C.teal },
    CmpItemKindMethod = { fg = C.base, bg = C.blue },
    CmpItemKindConstructor = { fg = C.base, bg = C.blue },
    CmpItemKindFunction = { fg = C.base, bg = C.blue },
    CmpItemKindFolder = { fg = C.base, bg = C.blue },
    CmpItemKindModule = { fg = C.base, bg = C.blue },
    CmpItemKindConstant = { fg = C.base, bg = C.peach },
    CmpItemKindField = { fg = C.base, bg = C.green },
    CmpItemKindProperty = { fg = C.base, bg = C.green },
    CmpItemKindEnum = { fg = C.base, bg = C.green },
    CmpItemKindUnit = { fg = C.base, bg = C.green },
    CmpItemKindClass = { fg = C.base, bg = C.yellow },
    CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
    CmpItemKindFile = { fg = C.base, bg = C.blue },
    CmpItemKindInterface = { fg = C.base, bg = C.yellow },
    CmpItemKindColor = { fg = C.base, bg = C.red },
    CmpItemKindReference = { fg = C.base, bg = C.red },
    CmpItemKindEnumMember = { fg = C.base, bg = C.red },
    CmpItemKindStruct = { fg = C.base, bg = C.blue },
    CmpItemKindValue = { fg = C.base, bg = C.peach },
    CmpItemKindEvent = { fg = C.base, bg = C.blue },
    CmpItemKindOperator = { fg = C.base, bg = C.blue },
    CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
    CmpItemKindCopilot = { fg = C.base, bg = C.teal },
  },
  dim_inactive = false,
  transparent_mode = false
}

return config
