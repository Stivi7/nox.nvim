vim.api.nvim_create_user_command("LoadRosePine", function()
  vim.cmd.colorscheme("rose-pine")
end, {})

vim.api.nvim_create_user_command("LoadTokyoNight", function()
  vim.cmd.colorscheme("tokyonight")
end, {})

