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
                  default = "mrasif/gpt-oss-20b-GGUF:Q4_K_M",
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
            model = "mrasif/gpt-oss-20b-GGUF:Q4_K_M",
            num_ctx = 16384,
          },
        },
        inline = {
          adapter = {
            name = "ollama",
            model = "mrasif/gpt-oss-20b-GGUF:Q4_K_M",
          },
        },
        cmd = {
          adapter = {
            name = "ollama",
            model = "mrasif/gpt-oss-20b-GGUF:Q4_K_M",
          },
        },
      },
    });
  end,
}
