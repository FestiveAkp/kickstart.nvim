-- Git blame (used by the statusline and for opening commit/file URLs)

vim.pack.add { 'https://github.com/f-person/git-blame.nvim' }

local map = function(lhs, rhs, desc)
  vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true, desc = desc })
end

map('<leader>hoc', '<Cmd>GitBlameOpenCommitURL<CR>', 'git blame [o]pen [c]ommit URL for line')
map('<leader>hof', '<Cmd>GitBlameOpenFileURL<CR>', 'git blame [o]pen [f]ile URL for line')

require('gitblame').setup {
  display_virtual_text = false,
  message_template = ' <author>, <date>',
  date_format = '%r',
}
