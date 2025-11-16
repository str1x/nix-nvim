local keymapSwitch = require('plugins.keymap-switch')

return {
  {
    "lualine.nvim",
    for_cat = 'general.always',
    -- cmd = { "" },
    event = "DeferredUIEnter",
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    after = function ()

      require('lualine').setup({
        options = {
          refresh = {
            statusline = 40,
          },
          icons_enabled = false,
          component_separators = '',
          section_separators = '',
        },
        sections = {
          lualine_a = { 'mode', keymapSwitch.kemapStatus },
          lualine_c = {
            {
              'filename', path = 1, status = true,
            },
          },
        },
        inactive_sections = {
          lualine_b = {
            {
              'filename', path = 3, status = true,
            },
          },
          lualine_x = {'filetype'},
        },
        tabline = {
          lualine_a = { 'buffers' },
          -- if you use lualine-lsp-progress, I have mine here instead of fidget
          -- lualine_b = { 'lsp_progress', },
          lualine_z = { 'tabs' }
        },
      })
    end,
  },
};
