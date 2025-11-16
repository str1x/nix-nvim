local utils = require('utils')
local _utils = require('plugins.telescope.utils')

return {
  {
    "<leader>sM",
    '<cmd>Telescope notify<CR>',
    mode = {"n"},
    desc = '[S]earch [M]essage',
  },
  {
    "<leader>sp",
    _utils.live_grep_git_root,
    mode = {"n"},
    desc = '[S]earch git [P]roject root',
  },
  {
    "<leader>/",
    function()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end,
    mode = {"n"},
    desc = '[/] Fuzzily search in current buffer',
  },
  {
    "<leader>/",
    function()
      local text = utils.getVisualSelection()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
        default_text = text,
        initial_mode = 'normal',
      })
    end,
    mode = {"v"},
    desc = '[/] Fuzzily search selected in current buffer',
  },
  {
    "<leader>s/",
    function()
      require('telescope.builtin').live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end,
    mode = {"n"},
    desc = '[S]earch [/] in Open Files',
  },
  {
    "<leader><leader>s",
    function() return require('telescope.builtin').buffers() end,
    mode = {"n"},
    desc = '[ ] Find existing buffers',
  },
  {
    "<leader>s.",
    function() return require('telescope.builtin').oldfiles() end,
    mode = {"n"},
    desc = '[S]earch Recent Files ("." for repeat)',
  },
  {
    "<leader>sr",
    function() return require('telescope.builtin').resume() end,
    mode = {"n"},
    desc = '[S]earch [R]esume',
  },
  {
    "<leader>sd",
    function() return require('telescope.builtin').diagnostics() end,
    mode = {"n"},
    desc = '[S]earch [D]iagnostics',
  },
  {
    "<leader>sg",
    function() return require('telescope.builtin').live_grep() end,
    mode = {"n"},
    desc = '[S]earch by [G]rep',
  },
  {
    "<leader>sg",
    function()
      local text = utils.getVisualSelection()
      require('telescope.builtin').live_grep({
        default_text = text,
        initial_mode = 'normal',
      })
    end,
    mode = {"v"},
    desc = '[s]earch selected by [g]rep',
  },
  {
    "<leader>sw",
    function() return require('telescope.builtin').grep_string() end,
    mode = {"n"},
    desc = '[S]earch current [W]ord',
  },
  {
    "<leader>ss",
    function() return require('telescope.builtin').builtin() end,
    mode = {"n"},
    desc = '[S]earch [S]elect Telescope',
  },
  {
    "<leader>sf",
    function() return require('telescope.builtin').find_files() end,
    mode = {"n"},
    desc = '[S]earch [F]iles',
  },
  {
    "<leader>sk",
    function() return require('telescope.builtin').keymaps() end,
    mode = {"n"},
    desc = '[S]earch [K]eymaps',
  },
  {
    "<leader>sh",
    function() return require('telescope.builtin').help_tags() end,
    mode = {"n"},
    desc = '[S]earch [H]elp',
  },
  {
    "<leader>gd",
    function()
      return require('telescope.builtin').lsp_definitions({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "[g]o to LSP [d]efinitions"
  },
  {
    "<leader>gi",
    function()
      return require('telescope.builtin').lsp_implementations({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "[g]o to LSP [i]mplementations"
  },
  {
    "<leader>gr",
    function()
      return require('telescope.builtin').lsp_references({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "[g]o to LSP [r]eferences"
  },
  {
    "<leader>gt",
    function()
      return require('telescope.builtin').lsp_type_definitions({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "[g]o to LSP [t]ypes"
  },
  {
    "<leader>gO",
    function()
      return require('telescope.builtin').lsp_outgoing_calls({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "[g]o to LSP [O]utgoing calls"
  },
  {
    "<leader>gI",
    function()
      return require('telescope.builtin').lsp_incoming_calls({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "[g]o to LSP [I]ncoming calls"
  },
  {
    "<leader>lf",
    function()
      return require('telescope').extensions.file_browser.file_browser({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "[l]ist [f]ile browser"
  },
  {
    "-",
    function()
      return require('telescope').extensions.file_browser.file_browser({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "file browser"
  },
  {
    "<leader>lS",
    function()
      return require('telescope.builtin').lsp_workspace_symbols({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "LSP [l]ist workspace [S]ymbols"
  },
  {
    "<leader>ls",
    function()
      return require('telescope.builtin').lsp_document_symbols({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "LSP [l]ist document [s]ymbols"
  },
  {
    "<leader>lm",
    function()
      return require('telescope.builtin').marks({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "[l]ist [m]arks"
  },
  {
    "<leader>lh",
    function()
      return require('telescope.builtin').highlights({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "[l]ist [h]iglights"
  },
  {
    "<leader>Gc",
    function()
      return require('telescope.builtin').git_commits({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "[G]it [c]ommits"
  },
  {
    "<leader>Gs",
    function()
      return require('telescope.builtin').git_status({ initial_mode = 'normal' })
    end,
    mode = {"n"},
    desc = "[G]it [s]tatus"
  },
}
