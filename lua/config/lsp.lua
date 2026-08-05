-- Config --
vim.diagnostic.config({
  signs = false,          -- Keeps the margin clean
  virtual_text = true,    -- Shows the error message at the end of the line
})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    
    -- LSP Navigation Mappings
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)    -- Jump to function/struct definition
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)          -- Show documentation/macro expansion
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts) -- Rename variable across the file

    -- Diagnostics (Error Squiggle) Navigation
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)  -- Jump to previous error/warning
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)  -- Jump to next error/warning
  end,
})

-- C LSP --
local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('clangd', {
    capabilities = capabilities
})

vim.lsp.enable('clangd');

