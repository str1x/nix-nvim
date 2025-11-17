require('utils/nixCatsUtils').setup {
  non_nix_value = true,
}

-- theme opts
vim.o.background = 'light'
vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = 1

require('options')
require('keymaps')
require('lsps')
require("plugins")
