-- Statusline

vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }
local git_blame = require 'gitblame'

local blame_min_columns = 120

-- Muted look for the winbar path so it reads as chrome, not content
local function winbar_path()
  return {
    'filename',
    path = 1, -- Relative path
    color = function()
      local hl = vim.api.nvim_get_hl(0, { name = 'NonText', link = false })
      return { fg = hl.fg and string.format('#%06x', hl.fg) or nil, gui = 'italic' }
    end,
  }
end

require('lualine').setup {
  theme = 'catppuccin',
  extensions = { 'neo-tree' },
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'neo-tree' },
      winbar = { 'neo-tree' },
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'diagnostics' },
    lualine_x = {
      {
        git_blame.get_current_blame_text,
        cond = function()
          return vim.o.columns > blame_min_columns and git_blame.is_blame_text_available()
        end,
      },
      'filetype',
      'location',
    },
    lualine_y = {},
    lualine_z = {},
  },
  winbar = {
    lualine_c = { winbar_path() },
  },
  inactive_winbar = {
    lualine_c = { winbar_path() },
  },
}
