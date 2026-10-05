return {
  "codecompanion.nvim",
  after = function()
    require('codecompanion').setup({
      adapters = {
        http = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              schema = {
                model = {
                  default = "qwen2.5-coder:14b",
                },
                num_ctx = {
                  default = 16384,
                },
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = {
            name = "ollama",
            model = "qwen2.5-coder:14b",
            num_ctx = 16384,
          },
        },
        inline = {
          adapter = {
            name = "ollama",
            model = "qwen2.5-coder:14b",
          },
        },
        cmd = {
          adapter = {
            name = "ollama",
            model = "qwen2.5-coder:14b",
          },
        },
      },
    });
  end,
}
