vim.cmd [[
  function! ToggleTermStrategy(cmd) abort
  call luaeval("require('toggleterm').exec(_A[1])", [a:cmd])
  endfunction
  let g:test#custom_strategies = {'toggleterm': function('ToggleTermStrategy')}
]]

vim.cmd [[
  let test#ruby#rspec#executable = 'clear; bundle exec rspec'
  let test#javascript#jest#executable = 'clear; yarn test'
]]

vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>TestNearest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>TestFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>TestLast<CR>', { noremap = true, silent = true })
