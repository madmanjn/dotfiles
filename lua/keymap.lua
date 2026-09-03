vim.g.mapleader = ' '
local keymap = vim.keymap

keymap.set('n', '<c-a>', 'ggVG')

keymap.set({ 'n', 'x' }, '<leader>p', '"0p')

keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>wa<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')

keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })

keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- Ctrl + Backspace: delete previous word
keymap.set('i', '<C-BS>', '<C-W>', { desc = 'Delete previous word' })

keymap.set({ 'n', 'v' }, '<S-H>', '^', {
  desc = 'Go to first character of line',
})
keymap.set({ 'n', 'v' }, '<S-L>', 'g_', {
  desc = 'Go to last character of line',
})

keymap.set('n', '<A-q>', '<C-o>', { silent = true })
keymap.set('n', '<A-e>', '<C-i>', { silent = true })

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Split window
--keymap.set("n", "ss", ":split<Return>")
keymap.set("n", "<A-w>", ":vsplit<Return>")
	
-- Move window
keymap.set("n", "<A-h>", "<C-w>h")
keymap.set("n", "<A-k>", "<C-w>k")
keymap.set("n", "<A-j>", "<C-w>j")
keymap.set("n", "<A-l>", "<C-w>l")

-- Resize window
keymap.set("n", "<A-Left>", "<C-w><")
keymap.set("n", "<A-Right>", "<C-w>>")

vim.keymap.set('n', '<leader>lr', '<cmd>lsp restart<cr>', {
  desc = 'LSP Restart',
})
