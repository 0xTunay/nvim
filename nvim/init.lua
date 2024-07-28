require('core.plugins')
require('core.mappings')
require('core.colors')

vim.o.number = true
vim.o.tabstop = 2										

-- PLUGINS
require('plugins.neotree')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.dashboard')
require('plugins.cmp')
require('plugins.toggleterm')
require('plugins.lualine')
