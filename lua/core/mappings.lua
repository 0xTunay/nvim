vim.g.mapleader = " "

-- NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')

-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>fr', ':Telescope oldfiles<CR>')

-- Trouble (diagnostics)
vim.keymap.set('n', '<leader>xx', ':TroubleToggle<CR>')
vim.keymap.set('n', '<leader>xw', ':TroubleToggle workspace_diagnostics<CR>')
vim.keymap.set('n', '<leader>xd', ':TroubleToggle document_diagnostics<CR>')
vim.keymap.set('n', '<leader>xl', ':TroubleToggle loclist<CR>')
vim.keymap.set('n', '<leader>xq', ':TroubleToggle quickfix<CR>')

-- Git
vim.keymap.set('n', '<leader>gs', ':Git<CR>')
vim.keymap.set('n', '<leader>gp', ':Git push<CR>')
vim.keymap.set('n', '<leader>gl', ':Git pull<CR>')
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>')
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>')

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<leader>bp', ':bprev<CR>')
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>')

-- Comment
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')
vim.keymap.set('v', '<leader>/', ':CommentToggle<CR>')

-- DAP (Debug)
vim.keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>')
vim.keymap.set('n', '<F10>', ':lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<F11>', ':lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<F12>', ':lua require"dap".step_out()<CR>')
vim.keymap.set('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')

