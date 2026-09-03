if vim.g.neovide then
  vim.o.guifont = 'JetBrainsMonoNL Nerd Font:h14'
	vim.g.neovide_position_animation_length = 0
	vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_scale_factor = 1
  vim.g.neovide_fullscreen = true


  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor =
      vim.g.neovide_scale_factor * delta
  end

  vim.keymap.set('n', '<C-=>', function()
    change_scale_factor(1.25)
  end)
  
  vim.keymap.set('n', '<C-->', function()
    change_scale_factor(1 / 1.25)
  end)
  

  vim.keymap.set('n', '<C-s>', '<cmd>wa<CR>')


  vim.keymap.set('c', '<C-v>', '<C-R>+')
  vim.keymap.set('t', '<C-v>', '<C-R>+')
end