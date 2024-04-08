return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    dependencies = { 'luarocks.nvim' },
    config = function()
      require('which-key').register({ ['<leader>h'] = { name = '[H]TTP Request Rest', _ = 'which_key_ignore' } })

      require('rest-nvim').setup({
        keybinds = {
          { '<leader>hr', '<cmd>Rest run<CR>', '[R]un Request Under The Cursor' },
          { '<leader>hl', '<cmd>Rest run last<CR>', 'Re-run [L]ast Request' },
        },
      })
    end,
  },
}
