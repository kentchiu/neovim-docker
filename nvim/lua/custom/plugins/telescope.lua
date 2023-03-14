return {
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>,",       "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/",       require('telescope.builtin').live_grep,             desc = "Find in Files (Grep)" },
      { "<leader>:",       "<cmd>Telescope command_history<cr>",               desc = "Command History" },
      { "<leader><space>", require('telescope.builtin').find_files,            desc = "Find Files (root dir)" },
      -- find
      { "<leader>fb",      "<cmd>Telescope buffers<cr>",                       desc = "Buffers" },
      { "<leader>ff", require('telescope.builtin').find_files,                 desc = "Find Files (root dir)" },
      -- { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",                      desc = "Recent" },
      -- git
      { "<leader>gc",      "<cmd>Telescope git_commits<CR>",                   desc = "commits" },
      { "<leader>gs",      "<cmd>Telescope git_status<CR>",                    desc = "status" },
      -- search
      { "<leader>sa",      "<cmd>Telescope autocommands<cr>",                  desc = "Auto Commands" },
      { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>",     desc = "Buffer" },
      { "<leader>sc",      "<cmd>Telescope command_history<cr>",               desc = "Command History" },
      { "<leader>sC",      "<cmd>Telescope commands<cr>",                      desc = "Commands" },
      { "<leader>sd",      "<cmd>Telescope diagnostics<cr>",                   desc = "Diagnostics" },
      { "<leader>sg",      require('telescope.builtin').live_grep,             desc = "Find in Files (Grep)" },
      {
        "<leader>sG",
        function()
          require('telescope.builtin').live_grep({ cwd = false })
        end,
        desc = "Grep (cwd)"
      },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>",                    desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>",                   desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>",                      desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>",                    desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>",                        desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>",                  desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>",                       desc = "Resume" },
      { "<leader>sw", require('telescope.builtin').grep_string,          desc = "Word (root dir)" },
      -- { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
      -- { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
      { "<leader>ss", require('telescope.builtin').lsp_document_symbols, desc = "Goto Symbol", },
      {
        "<leader>sS",
        "<leader>ss",
        require('telescope.builtin').lsp_workspace_symbols,
        {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
        desc = "Goto Symbol (Workspace)",
      },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
                ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
                ["<a-t>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
            -- ["<a-i>"] = function()
            --   Util.telescope("find_files", { no_ignore = true })()
            -- end,
            -- ["<a-h>"] = function()
            --   Util.telescope("find_files", { hidden = true })()
            -- end,
                ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
                ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
                ["<C-f>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
                ["<C-b>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
          },
          n = {
                ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },
}


-- telescope
-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>s/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = 'Fuzzily search in current buffer' })
--
