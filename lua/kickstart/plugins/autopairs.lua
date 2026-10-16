-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- blink.cmp adds brackets on accept itself, so no completion integration is needed
  opts = {},
}
