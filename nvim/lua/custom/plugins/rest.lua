return {
  {
    "rest-nvim/rest.nvim",
    lazy = false,
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

  -- We are using a Tree-Sitter parser for our HTTP files, in order to get the
  -- correct syntax highlighting for HTTP files (including JSON bodies) you
  -- should add the following into your ensure_installed table in your
  -- tree-sitter setup.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "json",
        "http",
      },
    },
  },
}
