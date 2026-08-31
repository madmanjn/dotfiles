return {
  'nvim-lualine/lualine.nvim',

  config = function()
    local function short_filename()
      local path = vim.fn.expand('%:p')

      if path == '' then
        return '[No Name]'
      end

      local parts = vim.split(path, '[\\/]')
      local count = #parts

      if count <= 3 then
        return table.concat(parts, '/')
      end

      return table.concat({
        parts[count - 2],
        parts[count - 1],
        parts[count],
      }, '/')
    end

    require('lualine').setup {
      options = {
        theme = 'solarized_dark',
      },

      sections = {
        lualine_a = {
          'mode',
        },

        lualine_b = {
          short_filename,
        },

        lualine_c = {
          'diagnostics',
        },

        lualine_x = {},

        lualine_y = {},

        lualine_z = {
          'filetype',
          {
            'datetime',
            style = '%d/%m %H:%M',
            color = {
			fg = '#FFFFFF',
			bg = '#202020',
			gui = 'bold',
			},
          },
        },
      },
    }
  end,
}
