return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/todo-comments.nvim' },
  keys = {
    { '<leader>tx', '<cmd>TroubleToggle<CR>', desc = '[X] Toggle Trouble List' },
    { '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<CR>', desc = 'Open Trouble [W]orkspace [D]iagnostics' },
    { '<leader>td', '<cmd>TroubleToggle document_diagnostics<CR>', desc = 'Open Trouble Document [D]iagnostics' },
    { '<leader>tq', '<cmd>TroubleToggle quickfix<CR>', desc = 'Open Trouble [Q]uickfix List' },
    { '<leader>tl', '<cmd>TroubleToggle loclist<CR>', desc = 'Open Trouble [L]ocation List' },
    { '<leader>tt', '<cmd>TodoTrouble<CR>', desc = 'Open [T]odos in Trouble' },
  },

  config = function()
    local wk = require('which-key')
    wk.register({ ['<leader>t'] = { name = '[T]rouble', _ = 'which_key_ignore' } })
  end,
}
