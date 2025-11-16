require('utils/nixCatsUtils').setup {
  non_nix_value = true,
}

vim.o.background = 'light'
vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = 1
vim.o.termguicolors = true

require('opts_and_keys')
require('options')
require('keymaps')

require('lsps')

require("plugins")
