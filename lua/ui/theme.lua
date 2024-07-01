local M = {}

M.configure = function()
  vim.cmd("colorscheme " .. M.theme)
end

local function load_everforest()
  local lualine_theme = require('lualine.themes.everforest')
  local colors = require('ui.colors').everforest

  lualine_theme.normal.c.bg = colors.bg0
  lualine_theme.insert.c.bg = colors.bg0
  lualine_theme.visual.c.bg = colors.bg0
  lualine_theme.replace.c.bg = colors.bg0
  lualine_theme.command.c.bg = colors.bg0
  lualine_theme.inactive.c.bg = colors.bg0
  lualine_theme.terminal.c.bg = colors.bg0

  M.lualine_theme = lualine_theme
  M.theme = 'everforest'
  M.colors = colors
end

load_everforest()

return M
