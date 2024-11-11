return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "html",
        "http",
        "java",
        "javascript",
        "markdown",
        "markdown_inline", -- Required for inline markdown parsing
        "nix",
        "ocaml",
        "php",
        "prisma",
        "python",
        "php",
        "rust",
        "scss",
        "sql",
        "svelte",
      },

      highlight = {
        enable = true,
        -- Enable both Tree-sitter and Vim regex highlighting for markdown.
        -- This is helpful for additional highlighting Obsidian uses, such as links and custom formatting.
        additional_vim_regex_highlighting = { "markdown", "mdx" },
      },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- Custom filetypes for Obsidian notes (MDX, and others)
      vim.filetype.add({
        extension = {
          mdx = "mdx",
          obsidian = "markdown", -- Custom Obsidian file extension if needed
          ejs = "html",
        },
      })

      -- Register markdown and MDX language support
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
