return {
  {
    "navarasu/onedark.nvim",
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme "onedark"
    -- end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },
  {
    "Mofiqul/dracula.nvim",
    config = function()
      vim.cmd.colorscheme "dracula"
    end,
  },
}
