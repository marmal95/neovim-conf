local icons = require('ui.icons')
local ui_theme = require('ui.theme')
local theme = ui_theme.lualine_theme
local colors = ui_theme.colors

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
  color = { bg = theme.normal.c.bg, fg = "" },
}

local mode = {
  'mode',
  fmt = function(_) return " " end,
  separator = { right = opts.separator.right },
}

local filename = {
  'filename',
  color = { bg = colors.blue, fg = colors.bg_dim },
  separator = opts.separator,
}

local filetype = {
  "filetype",
  icon_only = true,
  colored = true,
  color = { bg = colors.bg1 },
  separator = opts.separator,
}

local branch = {
  'branch',
  color = { bg = colors.green, fg = colors.bg_dim },
  separator = opts.separator,
}

local diff = {
  "diff",
  color = { bg = colors.bg1, fg = colors.text },
  separator = opts.separator,
}

local location = {
  'location',
  color = { bg = colors.bg1, fg = colors.statusline2 },
  separator = opts.separator,
}

local progress = {
  'progress',
  color = { bg = colors.yellow, fg = colors.bg_dim },
  separator = opts.separator,
}

local encoding = {
  'encoding',
  color = { bg = colors.bg1, fg = colors.statusline2 },
  separator = opts.separator,
}

local fileformat = {
  'fileformat',
  color = { bg = colors.orange, fg = colors.bg0 },
  separator = opts.separator,
}

local tabs = {
  'tabs',
  max_length = vim.o.columns,
  mode = 2,
  separator = opts.separator,
  section_separators = { left = opts.separator.right, right = opts.separator.left },
  tabs_color = {
    active = { bg = colors.blue, fg = colors.bg0 },
    inactive = { bg = colors.bg2, fg = colors.grey2 }
  },
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
  color = { bg = colors.bg1, fg = "" },
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
  color = { bg = colors.red, fg = colors.bg_dim },
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
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
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
