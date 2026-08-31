if vim.g.neovide then
  vim.o.guifont = 'JetBrainsMono Nerd Font:h14'
  vim.g.neovide_scale_factor = 0.8

  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor =
      vim.g.neovide_scale_factor * delta
  end

  -- Ctrl + =
  vim.keymap.set('n', '<C-=>', function()
    change_scale_factor(1.25)
  end)

  -- Ctrl + -
  vim.keymap.set('n', '<C-->', function()
    change_scale_factor(1 / 1.25)
  end)

  -- Ctrl + S
  vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')


  -- Ctrl + V in Command-line mode
  vim.keymap.set('c', '<C-v>', '<C-R>+')

  -- Ctrl + V in Terminal mode
  vim.keymap.set('t', '<C-v>', '<C-R>+')
end