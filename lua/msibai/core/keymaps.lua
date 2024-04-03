-- [[ Basic Keymaps ]]

-- Clear highlight on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })


-- [[ window manipulation ]]
-- Window Splitting
vim.keymap.set('n', '<C-w>s', '<cmd>split<CR>', { desc = 'Split window [s]ide-by-side' })
vim.keymap.set('n', '<C-w>v', '<cmd>vsplit<CR>', { desc = 'Split window [v]ertically' })

-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window Resizing
vim.keymap.set('n', '<C-w>+', '<cmd>vertical resize +5<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-w>-', '<cmd>vertical resize -5<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-w>>', '<cmd>vertical resize +5<CR>', { desc = 'Increase window width' })
vim.keymap.set('n', '<C-w><<', '<cmd>vertical resize -5<CR>', { desc = 'Decrease window width' })
