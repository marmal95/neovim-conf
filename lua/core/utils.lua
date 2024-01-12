local M = {}

M.load_mappings = function(plugin, mapping_opts)
  local mappings = require('core.mapping')[plugin]

  for mode, mode_mappings in pairs(mappings) do
    for keybind, mapping_info in pairs(mode_mappings) do
      vim.keymap.set(mode, keybind, mapping_info[1], mapping_opts or {})
    end
  end
end

return M
