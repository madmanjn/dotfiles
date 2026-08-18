return {
  'stevearc/conform.nvim',

  event = {
    'BufReadPre',
    'BufNewFile',
  },

  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = {
          'stylua',
        },

        cs = {
          'csharpier',
        },
      },

      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    }
  end,
}