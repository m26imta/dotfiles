local list_theme = {
  { "sainnhe/gruvbox-material",       name = "gruvboxm",           varients = { "gruvbox-material" },
    priority = 1000,
    init = function()
      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },
}

local themes = {
  { "joshdick/onedark.vim",           name = "onedark",            varients = { "onedark" } },
  { "lunarvim/darkplus.nvim",         name = "darkplus",           varients = { "darkplus" } },
  { "bluz71/vim-nightfly-guicolors",  name = "nightfly",           varients = { "nightfly" } },
  { "sainnhe/everforest",             name = "everforest",         varients = { "everforest" } },
  { "morhetz/gruvbox",                name = "gruvbox",            varients = { "gruvbox" } },
  { "sainnhe/gruvbox-material",       name = "gruvboxm",           varients = { "gruvbox-material" } },
  { "askfiy/visual_studio_code",      name = "vscode",             varients = { "visual_studio_code" } },
  { "Mofiqul/dracula.nvim",           name = "dracula",            varients = { "dracula", "dracula-soft" } },
  { "EdenEast/nightfox.nvim",         name = "nightfox",           varients = { "nightfox", "dayfox", "dawnfox", "duskfox", "nordfox", "terafox", "carbonfox"} },
  { "folke/tokyonight.nvim",          name = "tokyonight",         varients = { "tokyonight", "tokyonight-day", "tokyonight-moon", "tokyonight-night", "tokyonight-storm" } },
  { "catppuccin/nvim",                name = "catppuccin",         varients = { "catppuccin", "catppuccin-frappe", "catppuccin-latte", "catppuccin-macchiato", "catppuccin-mocha" } },
  { "projekt0n/github-nvim-theme",    name = "github",             varients = { "github_dark", "github_dark_colorblind", "github_dark_default", "github_dark_dimmed", "github_dark_high_contrast", "github_dark_tritanopia", "github_dimmed", "github_light", "github_light_colorblind", "github_light_default", "github_light_high_contrast", "github_light_tritanopia" } },
}

return list_theme
