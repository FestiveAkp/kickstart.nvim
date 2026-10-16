-- Neo-tree file explorer
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = 'v3.x' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  'https://github.com/MunifTanjim/nui.nvim',
}

require('neo-tree').setup {
  close_if_last_window = true,
  filesystem = {
    window = {
      position = 'float',
      mappings = {
        ['\\'] = 'close_window',
      },
    },
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
      never_show = {
        '.git',
        '.DS_Store',
      },
    },
    follow_current_file = {
      enabled = true,
    },
  },
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'Neo-tree reveal', silent = true })
