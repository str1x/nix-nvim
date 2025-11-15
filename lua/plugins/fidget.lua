return {
  {
    "fidget.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    -- keys = "",
    after = function()
      require('fidget').setup({})
    end,
  },
}
