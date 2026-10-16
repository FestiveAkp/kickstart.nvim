-- Statusline

vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }
local git_blame = require 'gitblame'

require('lualine').setup {
  theme = 'catppuccin',
  extensions = { 'neo-tree' },
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {
        'neo-tree',
      },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
    },
    lualine_c = {
      'diagnostics',
      {
        'filename',
        path = 1, -- Relative path
      },
    },
    lualine_x = {
      {
        git_blame.get_current_blame_text,
        cond = git_blame.is_blame_text_available,
      },
      'filetype',
      'progress',
      'location',
    },
    lualine_y = {},
    lualine_z = {},
    -- lualine_y = { 'filetype' },
    -- lualine_z = { 'progress', 'location' },
  },
}
