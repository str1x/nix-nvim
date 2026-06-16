return {
  {
    'everforest',
    lazy = false,
    priority = 1000,
    event = "DeferredUIEnter",
    after = function()
      vim.print('TEST')
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      vim.o.background = 'light'
      vim.g.everforest_background = 'soft'
      vim.g.everforest_better_performance = 1
      vim.g.everforest_transparent_background = 0
      vim.g.everforest_sign_column_background = 'none'
      vim.g.everforest_diagnostic_text_highlight = 1
      vim.g.everforest_diagnostic_line_highlight = 1
      vim.cmd.colorscheme('everforest')
    end
  },
}
