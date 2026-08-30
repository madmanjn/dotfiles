return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      local api = require 'nvim-tree.api'

      local function my_on_attach(bufnr)
        local function opts(desc)
          return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', '<c-e>', api.tree.toggle, opts 'Toggle')
        vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
      end

      require('nvim-tree').setup {
        -- Không hỏi xác nhận khi xóa
        ui = {
          confirm = {
            remove = false,
            trash = false,
          },
        },

        view = {
          width = 35,
        },

        on_attach = my_on_attach,

        filters = {
          custom = {
            '^.git$',
            '\\.meta$',
            '^Library$',
            '^Temp$',
            '^Obj$',
            '^Build$',
            '^Builds$',
            '^Logs$',
            '^UserSettings$',
            '\\.csproj$',
            '\\.sln$',
          },
          exclude = {},
        },

        actions = {
          open_file = {
            quit_on_open = true,
            window_picker = {
              enable = true,
            },
          },
        },

        update_focused_file = {
          enable = true,
          update_root = false,
        },

        git = {
          enable = true,
          ignore = true,
        },

        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
          },
        },
      }

      vim.keymap.set('n', '<c-e>', function()
        api.tree.toggle()
      end, {
        desc = 'Toggle NvimTree',
        noremap = true,
        silent = true,
      })
    end,
  },
}