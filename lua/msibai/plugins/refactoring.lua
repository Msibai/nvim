return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('refactoring').setup()
    local wk = require('which-key')
    wk.register({ ['<leader>r'] = { name = '[R]refactor', _ = 'which_key_ignore' } })
  end,

  vim.keymap.set('x', '<leader>re', '<cmd>Refactor extract<CR>', { desc = 'Extract [E]xpression' }),
  vim.keymap.set('x', '<leader>rf', '<cmd>Refactor extract_to_file<CR>', { desc = 'Extract [F]unction to File' }),
  vim.keymap.set('x', '<leader>rv', '<cmd>Refactor extract_var<CR>', { desc = 'Extract [V]ariable' }),
  vim.keymap.set({ 'n', 'x' }, '<leader>ri', '<cmd>Refactor inline_var<CR>', { desc = 'Inline [V]ariable' }),
  vim.keymap.set('n', '<leader>rI', '<cmd>Refactor inline_func<CR>', { desc = 'Inline [F]unction' }),
  vim.keymap.set('n', '<leader>rb', '<cmd>Refactor extract_block<CR>', { desc = 'Extract [B]lock' }),
  vim.keymap.set('n', '<leader>rB', '<cmd>Refactor extract_block_to_file<CR>', { desc = 'Extract Block to [F]ile' }),
}
