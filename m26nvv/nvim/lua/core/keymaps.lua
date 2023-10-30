M = {}
M.plugins_keymaps = {
  bbye = {
    { "<s-q>", "<cmd>Bdelete!<cr>", desc = "Close current buffer", mode = {"n"}, noremap = true, silent = true },
  },
  neotree = {
    { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "NeoTree", mode = {"n"} },
  },
  nvimtree = {
      { "<leader>ee", "<cmd>NvimTreeToggle<cr>", silent = true },
      { "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", silent = true },
  },
  telescope = {
    { "<leader>tll", "<cmd>Telescope<cr>", desc = "Open Telescope" },
    { "<leader>tff", "<cmd>Telescope find_files<cr>", desc = "Telescope: Find Files" },
    { "<leader>tlg", "<cmd>Telescope live_grep<cr>", desc = "Telescope: Live Grep" },
    { "<leader>tgs", "<cmd>Telescope grep_string<cr>", desc = "Telescope: Grep String" },
    {
      "<leader>tps",
      function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ")  }); end,
      desc = "Telescope: Search string"
    },
  },
  lazygit = {
    { "<leader>lgg", "<cmd>LazyGit<cr>", desc = "Open LazyGit", mode = {"n"}, noremap = true, silent = true },
  },
}

M.lsp_set_keymaps = function(_, bufnr)
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<c-space><c-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)

  -- Workspace
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)

end

M.saga_set_keymaps = function(_, bufnr)
  M.lsp_set_keymaps(_, bufnr)
end

return M
