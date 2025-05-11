return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        "tokyonight-night",
        "tokyonight-storm",
        "tokyonight-day",
        "tokyonight-moon",
        "gruvbox",
        "ayu",
        "kanagawa-lotus",
        "kanagawa-dragon",
      }, -- Your list of installed colorschemes.
      livePreview = true,
    })
  end,
}
