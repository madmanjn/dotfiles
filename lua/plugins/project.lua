return {
  'coffebar/neovim-project',

  opts = {
    projects = {
      'D:/_Unity/Projects/*/*',
    },

    picker = {
      type = 'telescope',

      preview = {
        enabled = true,
        git_status = true,
        show_hidden = true,
      },
    },
  },

  init = function()
    vim.opt.sessionoptions:append 'globals'
  end,

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'Shatur/neovim-session-manager',
  },

  keys = {
    {
      '<leader>fp',
      '<cmd>NeovimProjectDiscover<cr>',
      desc = 'Project History',
    },
  },

  lazy = false,
  priority = 100,
}