vim.o.winbar = "%{%v:lua.require'plugins.winbar'.eval()%}"
require 'core.utils.theme' -- Custom colorscheme
require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Custom code snippets

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
--    require 'plugins.colortheme',
    require 'plugins.lualine',
    require 'plugins.noice',
    require 'plugins.nvim-cmp',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.gitsigns',
    require 'plugins.indent-blankline',
})