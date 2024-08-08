local icons = require('ui.icons')
local ui_theme = require('ui.theme')
local colors = require('ui.colors')
local theme = ui_theme.lualine_theme

local lualine_presets = {
  everforest = {
    space = { bg = theme.normal.c.bg, fg = "" },
    filename = { bg = colors.everforest.blue, fg = colors.everforest.bg_dim },
    filetype = { bg = colors.everforest.bg1 },
    branch = { bg = colors.everforest.green, fg = colors.everforest.bg_dim },
    diff = { bg = colors.everforest.bg1, fg = colors.everforest.text },
    location = { bg = colors.everforest.bg1, fg = colors.everforest.statusline2 },
    progress = { bg = colors.everforest.yellow, fg = colors.everforest.bg_dim },
    encoding = { bg = colors.everforest.bg1, fg = colors.everforest.statusline2 },
    fileformat = { bg = colors.everforest.orange, fg = colors.everforest.bg0 },
    tabs_color = {
      active = { bg = colors.everforest.blue, fg = colors.everforest.bg0 },
      inactive = { bg = colors.everforest.bg2, fg = colors.everforest.grey2 }
    },
    diagnostics = { bg = colors.everforest.bg1, fg = "" },
    lsp = { bg = colors.everforest.red, fg = colors.everforest.bg_dim },
  },

  catppuccin_frappe = {
    space = { bg = theme.normal.c.bg, fg = "" },
    filename = { bg = colors.catppuccin_frappe.sapphire, fg = colors.catppuccin_frappe.base },
    filetype = { bg = colors.catppuccin_frappe.surface0 },
    branch = { bg = colors.catppuccin_frappe.green, fg = colors.catppuccin_frappe.base },
    diff = { bg = colors.catppuccin_frappe.surface0, fg = colors.catppuccin_frappe.text },
    location = { bg = colors.catppuccin_frappe.surface0, fg = colors.catppuccin_frappe.text },
    progress = { bg = colors.catppuccin_frappe.yellow, fg = colors.catppuccin_frappe.base },
    encoding = { bg = colors.catppuccin_frappe.surface0, fg = colors.catppuccin_frappe.text },
    fileformat = { bg = colors.catppuccin_frappe.peach, fg = colors.catppuccin_frappe.base },
    tabs_color = {
      active = { bg = colors.catppuccin_frappe.blue, fg = colors.catppuccin_frappe.base },
      inactive = { bg = colors.catppuccin_frappe.surface0, fg = colors.catppuccin_frappe.blue }
    },
    diagnostics = { bg = colors.catppuccin_frappe.surface0, fg = "" },
    lsp = { bg = colors.catppuccin_frappe.red, fg = colors.catppuccin_frappe.base },
  },
}

local palette = lualine_presets[ui_theme.lualine_preset]


local opts = {
  separator = { left = '', right = '' },
  -- separator = { left = '', right = ''},
  -- separator = { left = "", right = "" },
  -- separator = { left = "", right = "" }
}

local space = {
  function()
    return " "
  end,
  color = palette.space,
}

local mode = {
  'mode',
  fmt = function(_) return " " end,
  separator = { right = opts.separator.right },
}

local filename = {
  'filename',
  color = palette.filename,
  separator = opts.separator,
}

local filetype = {
  "filetype",
  icon_only = true,
  colored = true,
  color = palette.filetype,
  separator = opts.separator,
}

local branch = {
  'branch',
  color = palette.branch,
  separator = opts.separator,
}

local diff = {
  "diff",
  color = palette.diff,
  separator = opts.separator,
}

local location = {
  'location',
  color = palette.location,
  separator = opts.separator,
}

local progress = {
  'progress',
  color = palette.progress,
  separator = opts.separator,
}

local encoding = {
  'encoding',
  color = palette.encoding,
  separator = opts.separator,
}

local fileformat = {
  'fileformat',
  color = palette.fileformat,
  separator = opts.separator,
}

local tabs = {
  'tabs',
  max_length = vim.o.columns,
  mode = 2,
  separator = opts.separator,
  section_separators = { left = opts.separator.right, right = opts.separator.left },
  tabs_color = palette.tabs_color
}

local function getLspName()
  local msg = 'No LSP'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return " " .. msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return "  " .. client.name
    end
  end
  return " " .. msg
end

local diagnostics = {
  'diagnostics',
  color = palette.diagnostics,
  separator = opts.separator,
  symbols = {
    error = icons.diagnostics.Error .. ' ',
    warn = icons.diagnostics.Warning .. ' ',
    info = icons.diagnostics.Information .. ' ',
    hint = icons.diagnostics.Hint .. ' '
  },
}

local lsp = {
  function()
    return getLspName()
  end,
  separator = { left = opts.separator.left },
  color = palette.lsp,
}


local config = {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },

  sections = {
    lualine_a = {
      mode,
    },
    lualine_b = {
      space,
    },
    lualine_c = {
      filename,
      filetype,
      space,
      branch,
      diff,
    },
    lualine_x = {
      location,
      progress,
      space,
    },
    lualine_y = {
      encoding,
      fileformat,
      space,
    },
    lualine_z = {
      diagnostics,
      lsp,
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      tabs,
    },
    lualine_b = {
    },
    lualine_c = {},
    lualine_x = {
    },
    lualine_y = {
      space,
    },
    lualine_z = {
    },
  },
  winbar = {},
  inactive_winbar = {},
}

return config
