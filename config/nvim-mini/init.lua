-- Put this at the top of 'init.lua'
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- Uncomment next line to use 'stable' branch
    -- '--branch', 'stable',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
MiniDeps.add({ name = 'mini.nvim', checkout = 'stable' })

-- TODO : Organize in folders
--

local add = MiniDeps.add

-- Add to current session (install if absent)
add({
  source = 'neovim/nvim-lspconfig',
  -- Supply dependencies near target plugin
  depends = { 'williamboman/mason.nvim' },
})

add({
  source = 'nvim-treesitter/nvim-treesitter',
  -- Use 'master' while monitoring updates in 'main'
  checkout = 'master',
  monitor = 'main',
  -- Perform action after every checkout
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})
-- Possible to immediately execute code which depends on the added plugin
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'vimdoc', 'python', 'dockerfile', 'markdown', 'gitcommit', 'gitignore', 'make' },
  highlight = { enable = true },
})

local now, later = MiniDeps.now, MiniDeps.later

-- Safely execute immediately
-- TODO Catpucin schema

now(function() vim.cmd('colorscheme minicyan') end)

now(function() require('mini.starter').setup() end)
now(function() require('mini.notify').setup() end)
now(function() require('mini.indentscope').setup() end)

now(function() require('mini.misc').setup() end)
now(function() require('mini.git').setup() end)
now(function() require('mini.files').setup() end)
now(function() require('mini.extra').setup() end)

now(function() require('mini.basics').setup() end)
now(function() require('mini.pairs').setup() end)
now(function() require('mini.icons').setup() end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() require('mini.fuzzy').setup() end)

-- Safely execute later
later(function() require('mini.pick').setup() end)


