-- plugins/lsp.lua
local util = require("lspconfig.util")
local cmp_cap = require("plugins.cmp").capabilities

-- source <-> header для clangd
local function switch_source_header(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local client = util.get_active_client_by_name(bufnr, "clangd")

  if not client then
    vim.notify("clangd is not attached", vim.log.levels.WARN)
    return
  end

  client.request(
    "textDocument/switchSourceHeader",
    { uri = vim.uri_from_bufnr(bufnr) },
    function(err, result)
      if err then
        vim.notify(err.message or tostring(err), vim.log.levels.ERROR)
        return
      end
      if not result then
        vim.notify("No corresponding file", vim.log.levels.INFO)
        return
      end
      vim.cmd.edit(vim.uri_to_fname(result))
    end,
    bufnr
  )
end

local root_files = {
  ".clangd",
  ".clang-tidy",
  ".clang-format",
  "compile_commands.json",
  "compile_flags.txt",
  "configure.ac",
}

-- 🔥 НОВЫЙ API (Neovim 0.11+)
vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },

  root_dir = function(fname)
    return util.root_pattern(unpack(root_files))(fname)
      or util.find_git_ancestor(fname)
  end,

  single_file_support = true,
  capabilities = cmp_cap,
})

vim.api.nvim_create_user_command(
  "ClangdSwitchSourceHeader",
  function()
    switch_source_header(0)
  end,
  { desc = "Switch between source and header" }
)
