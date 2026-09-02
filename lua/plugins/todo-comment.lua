return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set(
      'n',
      '<A-t>',
      '<cmd>TodoTelescope<cr>',
      { desc = 'All todo comment' }
    )

    require('todo-comments').setup()
  end,
}
