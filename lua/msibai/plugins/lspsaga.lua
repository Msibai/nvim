return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('lspsaga').setup({
      lightbulb = {
        enable = false,
      },
    })
    local wk = require('which-key')
    wk.register({
      ['<leader>l'] = { name = '[L]spsaga', _ = 'which_key_ignore' },
    })
    vim.keymap.set('n', '<leader>lc', ':Lspsaga code_action<cr>', { desc = '[L]spsaga [C]ode Action' })
    vim.keymap.set('n', '<leader>lo', ':Lspsaga outline<cr>', { desc = '[L]spsaga [O]utline' })
    vim.keymap.set('n', '<leader>lr', ':Lspsaga rename<cr>', { desc = '[L]spsaga [R]ename' })
    vim.keymap.set('n', '<leader>lg', ':Lspsaga goto_definition<cr>', { desc = '[L]spsaga [G]o To Definition' })
    vim.keymap.set('n', '<leader>lf', ':Lspsaga finder<cr>', { desc = '[L]spsaga [F]inder' })
    vim.keymap.set('n', '<leader>lp', ':Lspsaga peek_definition<cr>', { desc = '[L]spsaga [P]eek Definition' })
    vim.keymap.set('n', '<leader>ld', ':Lspsaga show_workspace_diagnostics<cr>', { desc = '[L]spsaga Show Workspace [D]iagnostics' })
  end,
}
