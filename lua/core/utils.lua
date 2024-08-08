local M = {}

M.load_mappings = function(plugin, mapping_opts)
  local mappings = require('core.mapping')[plugin]
  local global_opts = mapping_opts or {}

  for mode, mode_mappings in pairs(mappings) do
    for keybind, mapping_info in pairs(mode_mappings) do
      local local_opts = mapping_info[2] or {}
      local opts = vim.tbl_deep_extend('force', global_opts, local_opts)
      vim.keymap.set(mode, keybind, mapping_info[1], opts)
    end
  end
end

return M
