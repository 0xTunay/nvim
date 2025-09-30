local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- LSP and completion
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'L3MON4D3/LuaSnip'},
  {'saadparwaiz1/cmp_luasnip'},

  -- Colorschemes
  {'shaunsingh/nord.nvim'},
  {'rebelot/kanagawa.nvim'},
  { 'wakatime/vim-wakatime', lazy = false },

  -- File explorer
  {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        's1n7ax/nvim-window-picker',
      }
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "cpp" } },
  },
  {'tree-sitter/tree-sitter-c'},

  -- Dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Terminal
  {'akinsho/toggleterm.nvim', version = "*", config = true},

  -- CRITICAL PLUGINS
  -- Telescope - search and navigation
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- Optional: fzf for faster searching (uncomment if needed)
  -- {
  --   'nvim-telescope/telescope-fzf-native.nvim',
  --   build = 'make',
  --   config = function()
  --     require('telescope').load_extension('fzf')
  --   end,
  -- },

  -- Trouble - diagnostics
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  -- Which-key - keybindings help
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },

  -- LSP IMPROVEMENTS
  -- LSP Signature - function signatures
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {}
  },

  -- LSP Saga - enhanced LSP UI
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  },

  -- CODE WORKING PLUGINS
  -- Comment.nvim - commenting
  {
    'numToStr/Comment.nvim',
    opts = {}
  },

  -- nvim-surround - work with brackets/quotes
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- nvim-autopairs - auto close brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  -- GIT PLUGINS
  -- Gitsigns - Git integration
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  -- Fugitive - Git commands
  {
    'tpope/vim-fugitive'
  },

  -- C++ DEVELOPMENT
  -- DAP - Debug Adapter Protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio"
    }
  },

  -- UI IMPROVEMENTS
  -- Indent Blankline - show indentation
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },

  -- Bufferline - buffer tabs
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

})
