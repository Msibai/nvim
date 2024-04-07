local function dontCloseNotSavedBuffers()
  local bufflineUi = require('bufferline.ui')

  local closeAllBufsExceptCurrent = function() -- delete all buffers, expect active one
    local rawBufArr = vim.api.nvim_list_bufs()
    local currBufNum = vim.api.nvim_get_current_buf()

    for _, value in ipairs(rawBufArr) do
      if value ~= currBufNum and vim.fn.buflisted(value) and not vim.api.nvim_buf_get_option(value, 'modified') then
        -- Check if the buffer is NeoTree buffer, if yes, skip deletion
        local buftype = vim.bo[value].buftype
        if buftype ~= 'nofile' and buftype ~= 'acwrite' then
          vim.api.nvim_buf_delete(value, {})
        end
      end
    end
  end
  closeAllBufsExceptCurrent()
  bufflineUi.refresh()
end

return {
  'akinsho/bufferline.nvim',

  event = 'VeryLazy',

  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle [P]in' },
    { '<leader>bd', '<Cmd>bd<CR>', desc = '[D]elete Current Buffer' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    {
      '<leader>bc',
      function()
        dontCloseNotSavedBuffers()
      end,
      desc = '[C]lose Other Buffers Except Those with Unsaved Changes',
    },
  },

  config = function()
    vim.opt.termguicolors = true

    require('bufferline').setup({
      options = {
        separator_style = 'slant',

        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(_, _, diag)
          local icons = require('msibai.core.icons').diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
          return vim.trim(ret)
        end,

        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    })

    local wk = require('which-key')
    wk.register({ ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' } })
  end,
}
