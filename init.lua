require('utils/nixCatsUtils').setup {
  non_nix_value = true,
}

vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'background',
  callback = function ()
    print('background changed to: ' .. vim.o.background);
    print(debug.traceback('---', 1));
  end,
});

require('options')
require('keymaps')
require('lsps')
require("plugins")
