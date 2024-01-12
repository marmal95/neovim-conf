local M = {}

M.lazy_config = {
  defaults = { lazy = true }
}

function M.configure()
  M.bootstrap_manager()
  require("lazy").setup(require('plugins.plugins'), M.lazy_config)
end

function M.bootstrap_manager()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

return M
