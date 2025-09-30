-- plugins/bufferline.lua
require("bufferline").setup({
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
    themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    indicator = {
      icon = '▎', -- this should be included if you want to use the default deprecation warning
      style = 'icon', -- | 'underline' | 'none',
    },
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '󰅘',
    left_trunc_marker = '󰅘',
    right_trunc_marker = '󰅘',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf) -- buf contains:
      -- name                | str        | the basename of the active file
      -- path                | str        | the full path of the active file
      -- bufnr (buffer only)| int        | the number of the active buffer
      -- buffers (tabs only) | table(int) | the numbers of the buffers associated with the tabpage
      -- tabpages (tabs only)| table(int) | the numbers of the tabpages associated with the tabpage
      -- is_active          | bool       | whether the current buffer/tabpage is in the current window
      -- is_modified        | bool       | whether the current buffer is modified
      -- is_visible         | bool       | whether the current buffer is visible
      -- is_clipped         | bool       | whether the current buffer is clipped
      local name = buf.name
      if name:match('%.') then
        name = name:match('([^/]+)$')
      end
      return name
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffers from filetype
      if vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
      -- filter out by it's index number in list (don't show first buffer)
      if buf_numbers[1] ~= buf_number then
        return true
      end
    end,
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "left",
        separator = true
      }
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    move_wraps_at_ends = false, -- whether or not the move command "wraps" at the start or end of the list
    -- can also be a function which returns the value
    groups = {
      options = {
        toggle_hidden_on_enter = true, -- automatically show hidden buffers on enter
      },
      items = {
        {
          name = "Tests", -- Mandatory
          highlight = {underline = true, sp = "blue"}, -- Optional
          priority = 2, -- determines where it will appear relative to other groups (Optional)
          icon = "󰙨", -- Optional
          matcher = function(buf) -- Mandatory
            return buf.name:match('%_test') or buf.name:match('%_spec')
          end,
        },
        {
          name = "Docs",
          highlight = {underline = true, sp = "green"},
          auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
          matcher = function(buf)
            return buf.name:match('%.md') or buf.name:match('%.txt')
          end,
          separator = { -- Optional
            left = '',
            right = '',
          },
        },
      },
    },
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    },
    sort_by = 'insert_after_current', -- | 'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
      -- add custom logic
      -- return buffer_a.modified > buffer_b.modified
    -- end
  },
})
