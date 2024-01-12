local M = {}

M.treesitter_cmds = { "TSInstall", "TSUpdate", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" }
M.nvimtree_cmds = { "NvimTreeOpen", "NvimTreeClose", "NvimTreeFindFile", "NvimTreeToggle" }
M.hop_cmds = { "HopWord", "HopPattern", "HopLineStart" }

return M
