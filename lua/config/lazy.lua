local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- 1. LazyVim core
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        -- colorscheme = "solarized-osaka",
      },
    },

    -- 2. LazyVim extras (grouped by category)
    -- Language support
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },

    -- Linting/formatting
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },

    -- UI/UX enhancements
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    -- { import = "lazyvim.plugins.extras.ai.codeium" },

    -- 3. Your custom plugins
    { import = "plugins" },
    { import = "fun" }, -- Consider renaming this to something more descriptive
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = {
    colorscheme = { "tokyonight", "habamax" },
    missing = true, -- install missing plugins on startup
  },
  checker = {
    enabled = true,
    notify = false,
    frequency = 3600, -- check once per hour
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
    cache = {
      enabled = true,
    },
  },
  ui = {
    border = "rounded", -- consider adding a nice border
  },
})

-- Load your workflows configuration
require("config.workflows")
