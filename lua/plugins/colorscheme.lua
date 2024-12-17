return {
  {
    "sickill/vim-monokai", -- Monokai theme
    lazy = false,          -- Load it eagerly
    priority = 1000,       -- Load it early
    config = function()
      vim.cmd([[colorscheme monokai]])
    end,
  },
}
-- return {
--   {
--     "craftzdog/solarized-osaka.nvim",
--     branch = "osaka",
--     lazy = true,
--     priority = 1000,
--     opts = function()
--       return {
--         transparent = true,
--       }
--     end,
--   },
-- }
