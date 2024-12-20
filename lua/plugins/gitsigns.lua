return {
  { {
    "tpope/vim-fugitive",
  }, "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gj", ":Gitsigns next_hunk<cr>", {})
      vim.keymap.set("n", "<leader>gk", ":Gitsigns prev_hunk<cr>", {})
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<cr>", {})
    end,
  },
}
