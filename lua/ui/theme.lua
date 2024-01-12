local M = {}

M.configure = function()
  vim.cmd("colorscheme " .. M.theme)
end

local function load_gruvbox()
  local lualine_theme = require('lualine.themes.catppuccin')
  lualine_theme.normal.c.bg = require('gruvbox').palette.dark0

  M.lualine_theme_config = lualine_theme
  M.theme = 'gruvbox'
  M.palette = require("catppuccin.palettes").get_palette("frappe")
end

local function load_catppuccin()
  local palette = require("catppuccin.palettes").get_palette("macchiato")
  local lualine_theme = require('lualine.themes.catppuccin')
  lualine_theme.normal.c.bg = palette.base

  M.lualine_theme_config = lualine_theme
  M.theme = 'catppuccin-macchiato'
  M.palette = palette
end

-- load_gruvbox()
load_catppuccin()

return M
