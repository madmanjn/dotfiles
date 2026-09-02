return {
  'rmagatti/auto-session',

  lazy = false,

  opts = {
    enabled = true,

    auto_save = true,
    auto_restore = true,
    auto_create = true,

    session_lens = {
      picker = nil,
    },
  },

  keys = {
    {
      '<A-p>',
      '<cmd>AutoSession search<CR>',
      desc = 'Session search',
    },

    {
      '<leader>ps',
      '<cmd>AutoSession save<CR>',
      desc = 'Save session',
    },

    {
      '<leader>pd',
      '<cmd>AutoSession delete<CR>',
      desc = 'Delete session',
    },
  },
}