return {
  'coffebar/neovim-project',

  opts = {
    projects = {
      'D:/_Unity/Projects/*',
    },
  },

  init = function()
    vim.opt.sessionoptions:append 'globals'
  end,

  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'Shatur/neovim-session-manager' },
  },

  keys = {
    {
      '<leader>fp',
      '<cmd>Telescope neovim-project discover<cr>',
      desc = 'Find Projects',
    },
  },

  lazy = false,
  priority = 100,
}
