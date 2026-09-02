return {
  'rmagatti/auto-session',

  lazy = false,

  opts = {
    enabled = true,

    auto_save = true,
    auto_restore = true,
    auto_create = true,

    suppressed_dirs = {
      vim.fn.stdpath 'config',
      vim.fn.stdpath 'data',
      vim.fn.stdpath 'cache',
      vim.fn.expand '~',
      vim.fn.expand '~/Downloads',
    },

    session_lens = {
      picker = nil,
    },
  },

  keys = {
    {
      '<leader>wr',
      '<cmd>AutoSession search<CR>',
      desc = 'Session search',
    },

    {
      '<leader>ws',
      '<cmd>AutoSession save<CR>',
      desc = 'Save session',
    },

    {
      '<leader>wd',
      '<cmd>AutoSession delete<CR>',
      desc = 'Delete session',
    },

    {
      '<leader>wa',
      '<cmd>AutoSession toggle<CR>',
      desc = 'Toggle autosave',
    },
  },
}