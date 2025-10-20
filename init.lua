require('utils/nixCatsUtils').setup {
  non_nix_value = true,
}

-- NOTE: various, non-plugin config
-- require('config.opts_and_keys')

-- NOTE: register an extra lze handler with the spec_field 'for_cat'
-- that makes enabling an lze spec for a category slightly nicer
-- require("lze").register_handlers(require('nixCatsUtils.lzUtils').for_cat)

-- NOTE: Register another one from lzextras. This one makes it so that
-- you can set up lsps within lze specs,
-- and trigger lspconfig setup hooks only on the correct filetypes
-- require('lze').register_handlers(require('lzextras').lsp)
-- demonstrated in ./LSPs/init.lua

-- NOTE: general plugins
require("plugins")

-- NOTE: obviously, more plugins, but more organized by what they do below

-- require("config.LSPs")

-- NOTE: we even ask nixCats if we included our debug stuff in this setup! (we didnt)
-- But we have a good base setup here as an example anyway!
-- if nixCats('debug') then
--   require('./debug')
-- end
-- NOTE: we included these though! Or, at least, the category is enabled.
-- these contain nvim-lint and conform setups.
-- if nixCats('lint') then
--   require('lint')
-- end
-- if nixCats('format') then
--   require('format')
-- end
-- NOTE: I didnt actually include any linters or formatters in this configuration,
-- but it is enough to serve as an example.

vim.o.background = 'light'
vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = 1
vim.o.termguicolors = true

require('opts_and_keys')
require('options')
require('keymaps')

require('lsps')
