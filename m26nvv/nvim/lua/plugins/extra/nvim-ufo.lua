return {
  "kevinhwang91/nvim-ufo",
  event = "VeryLazy",
  enabled = true,
  dependencies = { "kevinhwang91/promise-async" },
  config = function ()
    vim.opt.relativenumber = false
    require("ufo").setup({})
  end
}
