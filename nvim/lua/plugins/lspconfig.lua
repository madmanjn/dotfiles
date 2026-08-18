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

      on_attach = function(_, bufnr)
        local opts = {
          buffer = bufnr,
          silent = true,
        }

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

        vim.keymap.set('n', '<leader>ih', function()
          vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled()
          )
        end, opts)
      end,
    })
  end,
}