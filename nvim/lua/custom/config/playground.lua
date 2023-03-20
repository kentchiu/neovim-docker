-----------------------
--- Playground <leader>p + [key]
-----------------------

-- source playground
vim.keymap.set('n', '<leader>pp', '<cmd>source ~/.config/nvim/lua/custom/config/playground.lua<cr>')

-- print("Playground is sourced")

-- local M = {}
--
-- function M.edit_neovim()



-- require("telescope.builtin").git_files({
--   scroll_strategy = "cycle",
--   -- layout_config = {
--   --   height = 0.3,
--   --   preview_cutoff = 40,
--   --   prompt_position = "top",
--   --   width = 0.5
--   -- },
--   winblend = 10,
--   path_display = {
--     shorten = { len = 1, exclude = { 1, -1 } },
--   },
--   shorten_path = true,
--   cwd = "~/dev/kent/notes",
--   prompt = "~ dotfiles ~",
--   border = true,
--   dynamic_preview_title = true,
--   -- results_title = 'xxx',
--   preview = false,
-- })
--
--
-- require('telescope.builtin').live_grep({
--    prompt_title = 'find string in open buffers...',
--    grep_open_files = true
--  })
-- require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{
--     previewer = false
--   })

-- require("telescope.builtin").live_grep({
--   disable_coordinates = true
-- })

-- local telescope = require("telescope")
-- local lga_actions = require("telescope-live-grep-args.actions")
--
-- telescope.setup {
--   extensions = {
--     live_grep_args = {
--       auto_quoting = true, -- enable/disable auto-quoting
--       -- define mappings, e.g.
--       mappings = { -- extend mappings
--         i = {
--           ["<C-k>"] = lga_actions.quote_prompt(),
--           ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
--         },
--       },
--       -- ... also accepts theme settings, for example:
--       -- theme = "dropdown", -- use dropdown theme
--       -- theme = { }, -- use own theme spec
--       -- layout_config = { mirror=true }, -- mirror preview pane
--     }
--   }
-- }


-- require("telescope.builtin").treesitter()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
