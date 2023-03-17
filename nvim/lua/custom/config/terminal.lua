
--
-- lazygit
--
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new {
  cmd = 'lazygit',
  dir = 'git_dir',
  hidden = true,
  direction = 'float',
  float_opts = {
    border = 'shadow',
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd 'startinsert!'
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd 'startinsert!'
  end,
  count = 99,
}

function lazygit_toggle()
  lazygit:toggle()
end


--
-- terminal
--

local terminal = Terminal:new {
  cmd = 'zsh',
  hidden = true,
  direction = 'float',
  float_opts = {
    --    border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    border = 'curved',
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd 'startinsert!'
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd 'startinsert!'
  end,
  count = 88,
}

function terminal_toggle()
  terminal:toggle()
end


-- terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = "Terminal Normal Mode" })
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = "Go to left window" })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = "Go to lower window" })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = "Go to upper window" })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = "Go to right window" })


vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>lua terminal_toggle()<CR>', { noremap = true, silent = true, desc = 'Float Terminal' })
vim.api.nvim_set_keymap('n', '<leader>tT', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', { noremap = true, silent = true, desc = 'Docker Terminal' })

vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>ToggleTermSendCurrentLine<CR>', { noremap = true, silent = true, desc = 'Run Current Line' })
vim.api.nvim_set_keymap('v', '<leader>tr', '<cmd>ToggleTermSendCurrentLine<CR>', { noremap = true, silent = true, desc = 'Run Current Line' })
 
vim.api.nvim_set_keymap('n', '<c-r>', 'y<cmd>ToggleTermSendVisualSelection<CR>', { noremap = true, silent = true, desc = 'Run Selection' })
vim.api.nvim_set_keymap('v', '<c-r>', 'y<cmd>ToggleTermSendVisualSelection<CR>', { noremap = true, silent = true, desc = 'Run Selection' })

-- lazy git
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>lua lazygit_toggle()<CR>',
  { noremap = true, silent = true, desc = 'lazygit' })

