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

    -- Smart Type Definition / Implementation
    keymap.set('n', '<A-d>', function()
      local params = vim.lsp.util.make_position_params()

      vim.lsp.buf_request(
        0,
        'textDocument/typeDefinition',
        params,
        function(err, result)
          if err then
            vim.cmd('Lspsaga finder imp')
            return
          end

          if result and #result > 0 then
            vim.lsp.buf.type_definition()
          else
            vim.cmd('Lspsaga finder imp')
          end
        end
      )
    end, {
      silent = true,
      desc = 'Type Definition / Implementation',
    })

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
