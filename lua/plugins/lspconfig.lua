return {
  'neovim/nvim-lspconfig',

  config = function()
    vim.diagnostic.config {
      virtual_text = true,

      signs = true,

      underline = true,

      update_in_insert = false,

      severity_sort = true,

      float = {
        border = 'rounded',
        source = 'if_many',
      },
    }

    vim.lsp.config('*', {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
  end,
}
