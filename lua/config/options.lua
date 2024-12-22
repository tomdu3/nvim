-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.mouse = "a"

-- Set colorcolumn for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "markdown" },
  callback = function()
    vim.opt_local.colorcolumn = "80,120"
  end,
})
