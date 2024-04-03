--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- [[ Install `lazy.nvim` plugin manager ]]
require('msibai.lazy')

-- [[ Basic keypams and settings ]]
require('msibai.core')
