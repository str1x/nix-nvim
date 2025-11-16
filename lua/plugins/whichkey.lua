return {
  {
    "which-key.nvim",
    for_cat = 'general.extra',
    -- cmd = { "" },
    event = "DeferredUIEnter",
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    after = function ()
      require('which-key').setup({
      })
      require('which-key').add {
        { "<leader><leader>", group = "buffer commands" },
        { "<leader>c", group = "[c]ode" },
        { "<leader>d", group = "[d]ocument" },
        { "<leader>G", group = "[G]it" },
        { "<leader>g", group = "[g]o to" },
        { "<leader>m", group = "[m]arkdown" },
        { "<leader>s", group = "[s]earch" },
        { "<leader>t", group = "[t]oggles" },
        { "<leader>w", group = "[w]orkspace" },
        { "<leader>l", group = "[l]ist" },
        { "ys", group = "surrounding add" },
        { "ds", group = "surrounding delete" },
        { "cs", group = "surrounding change" },
      }
    end,
  },
}
