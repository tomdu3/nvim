return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- ESLint for linting and fixing on save
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.eslint.with({
          -- Optional: customize eslint formatting options here
        }),

        -- Prettier for formatting
        null_ls.builtins.formatting.prettier,
      },
      -- Enable fix on save for eslint
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = "NullLsFormatting", buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = "NullLsFormatting",
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
