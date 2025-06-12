return {
  -- LSP Setup
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Set up key bindings for LSP functionality
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          
          -- Buffer local mappings.
          local opts = { buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
          vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end,
      })

      local lspconfig = require("lspconfig")

      -- TypeScript configuration
      lspconfig.ts_ls.setup({
        filetypes = { 
          "typescript", 
          "typescriptreact", 
          "typescript.tsx", 
          "javascript", 
          "javascriptreact", 
          "javascript.jsx" 
        },
        root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
      })

      lspconfig.prismals.setup({
        cmd = { "prisma-language-server", "--stdio" },
        filetypes = { "prisma" },
        root_dir = require("lspconfig.util").root_pattern(".git", "package.json"),
        settings = {
          prisma = {
            prismaFmtBinPath = "", -- optional: specify path to prismaFmt binary if needed
          },
        },
      })

      lspconfig.svelte.setup({
        cmd = { "svelteserver", "--stdio" },
        filetypes = { "svelte" },
        root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
      })
    end
  },

  -- Mason package manager for installing LSP servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  -- Bridge between Mason and LSP Config
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls", -- TypeScript
          "prismals",
          "svelte",
        },
        automatic_installation = true,
      })
    end
  },
}

