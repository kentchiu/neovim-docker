return {
  {
    "rest-nvim/rest.nvim",
    lazy = true,
    ft = "http",
    keys = {
      {
        "<leader>rr",
        function()
          require("rest-nvim").run()
        end,
        desc = "RestNvimRun",
      },
      -- {
      --   "<leader>rt",
      --   "<cmd>lua require('rest-nvim').run()<CR>",
      --   desc = "RestNvimRun",
      -- },
      {
        "<leader>rc",
        function()
          require("rest-nvim").run(true)
        end,
        desc = "RestNvimPreview(curl)",
      },
      {
        "<leader>rl",
        function()
          require("rest-nvim").last()
        end,
        desc = "RestNvimLast",
      },
    },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Highlight request on run
        highlight = {
          enabled = false,
          timeout = 150,
        },
        -- Jump to request line on run
        jump_to_request = false,
      })
    end,
  },
}
