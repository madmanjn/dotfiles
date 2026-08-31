return {
  'neovim/nvim-lspconfig',

  config = function()
    local telescope = require('telescope.builtin')

    -- Diagnostics
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

        -- LSP
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        vim.keymap.set('n', 'gd', vim.lsp.buf.type_definition, opts)

        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

        -- Find References
        -- Hiển thị tất cả nơi symbol được sử dụng trong Telescope
        vim.keymap.set('n', 'gr', telescope.lsp_references, opts)

        -- Rename
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)

        -- Code Action
        vim.keymap.set('n', '`', vim.lsp.buf.code_action, opts)

        -- Diagnostics
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

        -- Toggle Inlay Hint
        vim.keymap.set('n', '<leader>ih', function()
          vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled()
          )
        end, opts)
      end,
    })
  end,
}