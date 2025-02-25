return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      -- Debug: Print the current `opts` table
      print(vim.inspect(opts))

      -- Ensure `opts.sources` is initialized as a table
      opts.sources = opts.sources or {}

      -- Add `djlint` as a formatter for Jinja and HTML files
      table.insert(
        opts.sources,
        require("null-ls").builtins.formatting.djlint.with({
          filetypes = { "jinja", "html" }, -- Add filetypes you want to format
        })
      )

      return opts
    end,
  },
}
