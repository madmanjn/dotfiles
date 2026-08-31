return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'

    -- ========================================
    -- Find C# files
    -- ========================================

    vim.keymap.set('n', '<leader>ff', function()
      builtin.find_files {
        find_command = {
          'rg',
          '--files',
          '--hidden',

          -- Only C# files
          '--glob', '*.cs',

          -- Ignore Unity generated folders
          '--glob', '!Library/**',
          '--glob', '!Temp/**',
          '--glob', '!Logs/**',
          '--glob', '!obj/**',
          '--glob', '!Build/**',
          '--glob', '!Builds/**',
          '--glob', '!UserSettings/**',
          '--glob', '!MemoryCaptures/**',
          '--glob', '!.git/**',
        },
      }
    end, { desc = 'Find C# Files' })

    -- ========================================
    -- Grep C# files
    -- ========================================

    vim.keymap.set('n', '<leader>fg', function()
      builtin.live_grep {
        glob_pattern = '*.cs',
      }
    end, { desc = 'Grep in C# Files' })

    -- ========================================
    -- Telescope Pickers
    -- ========================================

    vim.keymap.set('n', '<leader>fb', builtin.buffers, {
      desc = 'Find Buffers',
    })

    vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {
      desc = 'Find Document Symbols',
    })

    vim.keymap.set('n', '<leader>fw', builtin.lsp_dynamic_workspace_symbols, {
      desc = 'Find Workspace Symbols',
    })

    vim.keymap.set('n', '<leader>fd', function()
      builtin.diagnostics {
        scope = 'workspace',
        severity = {
          min = vim.diagnostic.severity.WARN,
        },
      }
    end, {
      desc = 'Show Workspace Errors & Warnings',
    })

    -- ========================================
    -- Telescope Setup
    -- ========================================

    require('telescope').setup {
      defaults = {
        -- Preview ở phía trên
        layout_strategy = 'vertical',

        mappings = {
          -- Insert mode
          i = {
            -- Navigation
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,

            -- Close
            ['<Esc>'] = actions.close,
          },

          -- Normal mode
          n = {
            -- Navigation
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
          },
        },

        -- Ignore unnecessary Unity files
        file_ignore_patterns = {
          'Library/',
          'Temp/',
          'Logs/',
          'obj/',
          'Build/',
          'Builds/',
          'UserSettings/',
          'MemoryCaptures/',
          '%.git/',
          '%.meta$',
          '%.prefab$',
          '%.png$',
          '%.asset$',
          '%.ogg$',
          '%.ttf$',
          '%.csproj$',
          '%.mat$',
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
        vertical = {
          preview_height = 0.5,
          prompt_position = 'bottom',

          -- Chiều rộng / chiều cao Telescope
          width = 0.9,
          height = 0.9,
        },
      },
    }
  end,
}
