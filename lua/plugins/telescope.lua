-- plugins/telescope.lua
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
        ['<C-x>'] = actions.delete_buffer,
      },
      n = {
        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
        ['<C-x>'] = actions.delete_buffer,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = false,
    },
    live_grep = {
      additional_args = { '--hidden' },
    },
  },
})

-- Load extensions (uncomment when fzf is installed)
-- telescope.load_extension('fzf')
