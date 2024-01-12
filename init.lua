require('core').configure()
require('plugins').configure()
require('ui.theme').configure()
pcall(require, 'core.work')
