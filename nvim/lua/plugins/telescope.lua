return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'

    vim.keymap.set('n', '<leader>ff', builtin.find_files)
    vim.keymap.set('n', '<leader>fg', builtin.live_grep)
    vim.keymap.set('n', '<leader>fb', builtin.buffers)
    vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols)
    vim.keymap.set('n', '<leader>fw', builtin.lsp_dynamic_workspace_symbols)

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<Esc>'] = actions.close,
          },
        },

        file_ignore_patterns = {
          '^Library/',
          '^Temp/',
          '^Logs/',
          '^obj/',
          '^Build/',
          '^Builds/',
          '^UserSettings/',
          '^MemoryCaptures/',
          '^%.git/',
        },

        dynamic_preview_title = true,

        path_display = {
          'smart',
        },
      },

      pickers = {
        find_files = {
          hidden = true,
        },
      },

      layout_config = {
        horizontal = {
          preview_cutoff = 100,
          preview_width = 0.5,
        },
      },
    }
  end,
}