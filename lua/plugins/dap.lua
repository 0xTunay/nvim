-- plugins/dap.lua
local ok_dap, dap = pcall(require, 'dap')
if not ok_dap then return end
local ok_dapui, dapui = pcall(require, 'dapui')
if not ok_dapui then return end

-- DAP UI setup
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width in characters and Float values
  -- specify percentage. x and y coordinates specify the position
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "⏸",
      play = "▶",
      step_into = "⏎",
      step_over = "⏭",
      step_out = "⏮",
      step_back = "⬅",
      run_last = "🔄",
      terminate = "⏹",
      disconnect = "⏏",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
    indent = 1,
  },
})

-- DAP keymaps
vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapStopped', { text = '⭐', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
vim.fn.sign_define('DapBreakpointRejected', { text = '🚫', texthl = 'DapBreakpointRejected', linehl = 'DapBreakpointRejected', numhl = 'DapBreakpointRejected' })
vim.fn.sign_define('DapLogPoint', { text = '📝', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })

-- C++ debugging configuration
local function find_cppdbg_adapter()
  -- Try Mason path first
  local mason_path = vim.fn.stdpath('data') .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
  if vim.fn.executable(mason_path) == 1 then
    return mason_path
  end

  -- Try common VSCode cpptools location (user-installed)
  local vscode_cpptools = vim.fn.expand('~/.vscode/extensions')
  if vim.loop.fs_stat(vscode_cpptools) then
    -- Find newest cpptools version path
    local handle = vim.loop.fs_scandir(vscode_cpptools)
    if handle then
      local newest
      while true do
        local name = vim.loop.fs_scandir_next(handle)
        if not name then break end
        if name:match('^ms%-%-vscode%.cpptools') then
          newest = name
        end
      end
      if newest then
        local candidate = vscode_cpptools .. '/' .. newest .. '/debugAdapters/bin/OpenDebugAD7'
        if vim.fn.executable(candidate) == 1 then
          return candidate
        end
      end
    end
  end

  -- Fallback: rely on PATH if available
  if vim.fn.executable('OpenDebugAD7') == 1 then
    return 'OpenDebugAD7'
  end

  return nil
end

local cppdbg_cmd = find_cppdbg_adapter()
if cppdbg_cmd == nil then
  vim.schedule(function()
    vim.notify(
      'cppdbg adapter (OpenDebugAD7) not found. Install via :Mason (cpptools) or VSCode cpptools.',
      vim.log.levels.WARN
    )
  end)
else
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = cppdbg_cmd,
  }
end

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cppdbg",
    request = "attach",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

-- Auto open/close DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

