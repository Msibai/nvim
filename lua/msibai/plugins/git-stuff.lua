-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      })
      require('which-key').register({ ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' } })
    end,
    vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>', { desc = '[G]itsigns [P]review Git hunk changes' }),
    vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', { desc = '[G]itsigns [P]review Git hunk changes' }),
    vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', { desc = '[G]itsigns [S]tage Git hunk' }),
    vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', { desc = '[G]itsigns [U]ndo Git hunk staging' }),
    vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = '[G]itsigns [R]eset Git hunk' }),
    vim.keymap.set('n', '<leader>gS', ':Gitsigns stage_buffer<CR>', { desc = '[G]itsigns [S]tage all Git hunks in buffer' }),
    vim.keymap.set('n', '<leader>gR', ':Gitsigns reset_buffer<CR>', { desc = '[G]itsigns [R]eset all Git hunks in buffer' }),
    vim.keymap.set('n', '<leader>gN', ':Gitsigns next_hunk<CR>', { desc = '[G]itsigns [N]ext Git hunk' }),
    vim.keymap.set('n', '<leader>td', ':Gitsigns toggle_deleted<CR>', { desc = '[T]oggle [D]eleted file in Git' }),
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
    },
    keys = { { '<leader>gn', '<cmd>Neogit<cr>', desc = '[N]eogit' } },
    opts = {
      integrations = {
        diffview = true,
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = { { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[D]iffview Open' } },
  },
}
