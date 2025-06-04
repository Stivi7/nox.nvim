return {
  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Configure tokyonight to use transparent background
      require("tokyonight").setup({
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd.colorscheme "tokyonight"
    end,
  },
  {
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
    config = function()
      vim.cmd.colorscheme "rose-pine"
    end
  }, 
  -- Dev icons (required by many plugins)
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 900,
  },
}

