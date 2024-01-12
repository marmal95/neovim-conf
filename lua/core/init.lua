local M = {}

M.configure = function()
  require('core.options')
  require('core.utils').load_mappings('general')
end

return M
