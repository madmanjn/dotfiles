return {
  'Mofiqul/vscode.nvim',
  priority = 1000,

  config = function()
    require('vscode').setup({
      style = 'dark',
      transparent = false,
      italic_comments = false,
      italic_inlayhints = false,
      underline_links = true,
      disable_nvimtree_bg = false,
      terminal_colors = true,
    })

    vim.cmd.colorscheme('vscode')
  end,
}