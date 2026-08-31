return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,

  opts = {
    flavour = 'mocha',
    custom_highlights = function()
      return {
		Normal = {
          bg = '#141414',
        },

        NormalNC = {
          bg = '#141414',
        },

        NormalFloat = {
          bg = '#141414',
        },

        EndOfBuffer = {
          bg = '#141414',
        },

        SignColumn = {
          bg = '#141414',
        },

        FoldColumn = {
          bg = '#141414',
        },

        FloatNormal = {
          bg = '#141414',
        },

        FloatBorder = {
          bg = '#141414',
          fg = '#3A3A3A',
        },

        TelescopeNormal = {
          bg = '#141414',
        },

        TelescopeBorder = {
          bg = '#141414',
          fg = '#3A3A3A',
        },

        TelescopePromptNormal = {
          bg = '#141414',
        },

        TelescopePromptBorder = {
          bg = '#141414',
          fg = '#3A3A3A',
        },

        TelescopeResultsNormal = {
          bg = '#141414',
        },

        TelescopeResultsBorder = {
          bg = '#141414',
          fg = '#3A3A3A',
        },

        TelescopePreviewNormal = {
          bg = '#141414',
        },

        TelescopePreviewBorder = {
          bg = '#141414',
          fg = '#3A3A3A',
        },

        TelescopeSelection = {
          bg = '#252525',
          fg = '#FFFFFF',
        },

        TelescopeSelectionCaret = {
          bg = '#252525',
          fg = '#75D175',
        },

        ['@lsp.type.method.cs'] = {
          fg = '#DCDCAA',
        },
        ['@lsp.type.class.cs'] = {
          fg = '#4EC9B0',
        },
        ['@lsp.type.struct.cs'] = {
          fg = '#75D175',
        },
        ['@lsp.type.field.cs'] = {
          fg = '#D69D85',
        },
        ['@lsp.type.property.cs'] = {
          fg = '#DCDCDC',
        },
        ['@lsp.type.keyword.cs'] = {
          fg = '#569CD6',
        },
        ['@lsp.type.parameter.cs'] = {
          fg = '#9CDCFE',
          italic = true,
        },
        ['@lsp.type.namespace.cs'] = {
          italic = false,
        },
      }
    end,
  },

  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme('catppuccin')
  end,
}