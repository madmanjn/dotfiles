return {
  'nvim-tree/nvim-tree.lua',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local api = require('nvim-tree.api')

    local function on_attach(bufnr)
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

      vim.keymap.set(
        'n',
        '?',
        api.tree.toggle_help,
        opts('Help')
      )
    end

    require('nvim-tree').setup({
      view = {
        width = 35,
      },

      on_attach = on_attach,

      filters = {
        custom = {
          '^%.git$',
          '^Library$',
          '^Temp$',
          '^Logs$',
          '^obj$',
          '^Build$',
          '^Builds$',
          '^UserSettings$',
          '^MemoryCaptures$',
        },
      },

      actions = {
        open_file = {
          quit_on_open = true,
        },
      },

      update_focused_file = {
        enable = true,
        update_cwd = true,
      },

      git = {
        enable = false,
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
    })

    -- IMPORTANT: setup() đã chạy xong mới tạo mapping
    vim.keymap.set('n', '<C-e>', function()
      api.tree.toggle()
    end, {
      desc = 'Toggle File Explorer',
    })
  end,
}