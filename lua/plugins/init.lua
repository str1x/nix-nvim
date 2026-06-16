local colorschemeName = nixCats('colorscheme')
vim.cmd.colorscheme(colorschemeName)

require('plugins.keymap-switch').setup({ keymap = "russian-jcukenwin" })


require('lze').load {
  {"plenary.nvim"},
  { import = 'plugins.telescope' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.completion' },
  { import = 'plugins.markdown-preview' },
  { import = 'plugins.undotree' },
  { import = 'plugins.comment' },
  { import = 'plugins.indent-blankline' },
  { import = 'plugins.fidget' },
  { import = 'plugins.lualine' },
  { import = 'plugins.gitsigns' },
  { import = 'plugins.whichkey' },
  { import = 'plugins.neoscroll' },
  { import = 'plugins.noice' },
  { import = 'plugins.surround' },
  { import = 'plugins.yazi' },
  { import = 'plugins.themes' },
}
