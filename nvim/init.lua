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
require("plugins.cmake")
require('plugins.telescope')
require('plugins.trouble')
require('plugins.which-key')
require('plugins.bufferline')
require('plugins.dap')