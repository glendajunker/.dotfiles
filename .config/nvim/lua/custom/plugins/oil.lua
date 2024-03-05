return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local oil = require 'oil'

      oil.setup {
        columns = {},
        default_file_explorer = true,
        delete_to_trash = true,
        use_default_keymaps = false,
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<C-r>'] = 'actions.refresh',
          ['<CR>'] = 'actions.select',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['g.'] = 'actions.toggle_hidden',
        },
      }

      vim.keymap.set('n', '-', oil.open, { desc = 'Open parent directory' }) -- open parent directory from file (not just oil view)
    end,
  },
}
