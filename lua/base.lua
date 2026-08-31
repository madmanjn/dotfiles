local opt = vim.opt

opt.signcolumn = 'yes'

opt.number = true
opt.relativenumber = true

opt.cursorline = true
opt.wrap = false
opt.showmatch = true
opt.cmdheight = 1
opt.pumheight = 10
opt.synmaxcol = 300
opt.fillchars = { eob = " " }
vim.opt.autochdir = false

opt.scrolloff = 10
opt.sidescrolloff = 10

opt.hlsearch = true
opt.incsearch = true

opt.mouse:append 'a'
opt.clipboard:append 'unnamedplus'

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

vim.opt.winbar = ''

opt.termguicolors = true

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})
