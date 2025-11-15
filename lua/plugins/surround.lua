return {
  {
    "nvim-surround",
    for_cat = 'general.always',
    event = "DeferredUIEnter",
    -- keys = "",
    after = function()
      require('nvim-surround').setup()
    end,
  },
}
