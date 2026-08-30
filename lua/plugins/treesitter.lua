return {
  'nvim-treesitter/nvim-treesitter',

  event = {
    'BufReadPre',
    'BufNewFile',
  },

  build = ':TSUpdate',

  config = function()
    require('nvim-treesitter').install({
      'c_sharp',
      'lua',
      'vim',
      'vimdoc',
      'markdown',
      'markdown_inline',
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'c_sharp',
        'lua',
        'vim',
        'vimdoc',
        'markdown',
        'markdown_inline',
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}