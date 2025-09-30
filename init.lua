require('core.plugins')
require('core.mappings')
require('core.colors')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


-- PLUGINS
require('plugins.neotree')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.dashboard')
require('plugins.cmp')
require('plugins.telescope')
require('plugins.trouble')
require('plugins.which-key')
require('plugins.dap')
