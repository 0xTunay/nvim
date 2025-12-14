-- plugins/which-key.lua
local wk = require("which-key")

wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },

  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },

  win = {
    border = "none",
    position = "bottom",
    padding = { 2, 2, 2, 2 },
  },

  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
})

-- 🔑 НОВЫЙ SPEC РЕГИСТРАЦИИ
wk.add({
  -- Find
  { "<leader>f", group = "Find" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },

  -- Trouble
  { "<leader>x", group = "Trouble" },
  { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle trouble" },
  { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
  { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document diagnostics" },
  { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location list" },
  { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix" },

  -- Git
  { "<leader>g", group = "Git" },
  { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
  { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
  { "<leader>gl", "<cmd>Git pull<cr>", desc = "Git pull" },
  { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
  { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },

  -- Buffer
  { "<leader>b", group = "Buffer" },
  { "<leader>bn", "<cmd>bnext<cr>", desc = "Next buffer" },
  { "<leader>bp", "<cmd>bprev<cr>", desc = "Previous buffer" },
  { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete buffer" },

  -- Comment
  { "<leader>/", "<cmd>CommentToggle<cr>", desc = "Toggle comment" },
})
