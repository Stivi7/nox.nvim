print("Editor")
-- Disable netrw
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

vim.o.expandtab = true       -- Use spaces instead of tabs
vim.o.tabstop = 2            -- A tab character displays as 2 spaces
vim.o.shiftwidth = 2         -- Indent/outdent commands use 2 spaces
vim.o.softtabstop = 2        -- Insert mode tab behaves like 2 spaces
vim.o.smarttab = true        -- Tab at start of line uses shiftwidth

vim.wo.relativenumber = true
vim.wo.number = true

vim.o.smartindent = true
vim.o.swapfile = false

vim.o.hlsearch = false
vim.o.incsearch = true 

vim.o.termguicolors = true

-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Create an autocmd group for transparent background settings
local transparent_bg_group = vim.api.nvim_create_augroup("TransparentBackground", { clear = true })

-- Function to apply transparent background
local function apply_transparent_bg()
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
end

-- Apply transparent background after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  group = transparent_bg_group,
  callback = apply_transparent_bg
})

-- Apply transparent background when Neovim finishes starting
vim.api.nvim_create_autocmd("VimEnter", {
  group = transparent_bg_group,
  callback = apply_transparent_bg
})
