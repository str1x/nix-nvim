return {
  {
    "indent-blankline.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    after = function()
      require("ibl").setup()
    end,
  },
}
