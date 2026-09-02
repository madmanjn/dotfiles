return {
  'nvimdev/lspsaga.nvim',

  config = function()
    local keymap = vim.keymap
    local telescope = require('telescope.builtin')

    require('lspsaga').setup {
      ui = {
        border = 'rounded',
      },

      lightbulb = {
        enable = false,
      },

      symbol_in_winbar = {
        enable = false,
      },
    }

    -- ========================================
    -- LSP Navigation
    -- ========================================

    -- Hover
    keymap.set(
      'n',
      'K',
      '<cmd>Lspsaga hover_doc<cr>',
      { silent = true, desc = 'Hover Documentation' }
    )

    -- Go to Type Definition
    keymap.set(
      'n',
      '<A-d>',
      vim.lsp.buf.type_definition,
      { silent = true, desc = 'Go to Type Definition' }
    )

    -- Go to Implementation
    keymap.set(
      'n',
      '<A-i>',
      '<cmd>Lspsaga finder imp<cr>',
      { silent = true, desc = 'Go to Implementation' }
    )

    -- Find References
    keymap.set(
      'n',
      '<A-r>',
      telescope.lsp_references,
      { silent = true, desc = 'Find References' }
    )

    -- ========================================
    -- LSP Actions
    -- ========================================

    keymap.set(
      'n',
      '<leader>r',
      '<cmd>Lspsaga rename<cr>',
      { silent = true, desc = 'Rename' }
    )

    keymap.set(
      { 'n', 'v' },
      '`',
      '<cmd>Lspsaga code_action<cr>',
      { silent = true, desc = 'Code Action' }
    )

    keymap.set(
      'n',
      '<A-o>',
      '<cmd>Lspsaga outline<cr>',
      { silent = true, desc = 'LSP Outline' }
    )


    -- ========================================
    -- Diagnostic Signs
    -- ========================================

    vim.fn.sign_define {
      {
        name = 'DiagnosticSignError',
        text = '',
        texthl = 'DiagnosticSignError',
        linehl = 'ErrorLine',
      },

      {
        name = 'DiagnosticSignWarn',
        text = '',
        texthl = 'DiagnosticSignWarn',
        linehl = 'WarningLine',
      },

      {
        name = 'DiagnosticSignInfo',
        text = '',
        texthl = 'DiagnosticSignInfo',
        linehl = 'InfoLine',
      },

      {
        name = 'DiagnosticSignHint',
        text = '',
        texthl = 'DiagnosticSignHint',
        linehl = 'HintLine',
      },
    }
  end,
}
