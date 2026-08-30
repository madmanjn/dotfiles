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

        -- Default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Custom mappings khi đang ở trong cửa sổ nvim-tree
        vim.keymap.set('n', '<c-e>', api.tree.toggle, opts 'Toggle')
        vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
      end

      -- 1. Gọi setup TRƯỚC
      require('nvim-tree').setup {
        view = {
          width = 35,
        },
        on_attach = my_on_attach,
        filters = {
          custom = {
            '^.git$',
            '\\.meta$',          -- Ẩn .meta để đỡ rối mắt khi duyệt code
            '^Library$',         -- Cache Unity (cực nặng, không nên duyệt)
            '^Temp$',            -- File tạm compile
            '^Obj$',             -- Build intermediates
            '^Build$',           -- Output build
            '^Builds$',
            '^Logs$',            -- Unity editor logs
            '^UserSettings$',    -- Layout cá nhân
            '\\.csproj$',        -- VS Solution files sinh tự động
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

      -- 2. Gán phím tắt toàn cục SAU KHI setup đã chạy
      vim.keymap.set('n', '<c-e>', function()
        api.tree.toggle()
      end, { desc = 'Toggle NvimTree', noremap = true, silent = true })
    end,
  },
}