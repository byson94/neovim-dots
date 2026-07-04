return {
  'Wansmer/treesj',
  keys = { 
      { '<leader>tm', desc = 'TreeSJ Toggle' },
      { '<leader>tj', desc = 'TreeSJ Split' },
      { '<leader>ts', desc = 'TreeSJ Join' },
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, 
  config = function()
    require('treesj').setup({
        use_default_keymaps = false,
    })

    local tsj = require('treesj')

    vim.keymap.set('n', '<leader>tm', tsj.toggle, { desc = 'TreeSJ Toggle' })
    vim.keymap.set('n', '<leader>tj', tsj.split,  { desc = 'TreeSJ Split' })
    vim.keymap.set('n', '<leader>ts', tsj.join,   { desc = 'TreeSJ Join' })
  end,
}
