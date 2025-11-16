return {
  {
    "neoscroll.nvim",
    keys = {
      {
        "<C-d>",
        function()
          require('neoscroll').scroll(20, { duration = 150 })
        end,
        mode = {'n', 'v'},
        desc = "scroll down"
      },
      {
        "<C-u>",
        function()
          require('neoscroll').scroll(-20, { duration = 150 })
        end,
        mode = {'n', 'v'},
        desc = "scroll up"
      },
    },
    config = function()
      require("neoscroll").setup {
        easing_function = "quadratic",
      }
    end,
  },
}
