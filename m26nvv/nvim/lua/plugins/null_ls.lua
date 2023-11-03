local enable_this = true

local config = function()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  --
  local on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
    end
    vim.cmd [[
    augroup document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]]
  end

  null_ls.setup({
    debug = false,
    sources = {
      -- -- html
      -- formatting.prettier,
      -- python
      formatting.black,
      formatting.isort,
      -- diagnostics.flake8,
      -- --
      -- formatting.codespell.with({ filetypes = { 'markdown' } }),
      -- -- lua: `formatter`
      -- formatting.lua_format.with({
      --   extra_args = { '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100', '--break-after-table-lb', '--indent-width=2' }
      -- }),
      -- lua: stylua
      -- formatting.stylua,
    },
    -- on_attach = on_attach
  })
end

return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "nvim-lua/plenary.nvim" },
  },
  config = config,
  event = "VeryLazy",
  enabled = enable_this,
}
