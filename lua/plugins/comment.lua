return {
  {
    "comment.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    after = function()
      require('Comment').setup()
    end,
  },
}
