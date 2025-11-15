return {
  {
    "noice.nvim",
    dependencies = {
      "nui.nvim",
      {
        "nvim-notify",
        opts = {
          stages = "static",
          render = "compact",
        },
      },
    },
    after = function ()
      require('noice').setup({
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
        cmdline = {
          enabled = true,
        },
        messages = {
          enabled = true,
        },
        popupmenu = {
          enabled = true,
        },
        notify = {
          enabled = true,
        },
        lsp = {
          hover = {
            --- donts show empty lsp messages
            silent = true,
          },
          signature = {
            enabled = false,
            auto_open = {
              enabled = true,
              trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
              luasnip = false, -- Will open signature help when jumping to Luasnip insert nodes
              throttle = 50, -- Debounce lsp signature help request by 50ms
            },
          },
        },
        presets = {
          lsp_doc_border = true,
        },
      })
    end,
  },
}
