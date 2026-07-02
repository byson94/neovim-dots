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
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp" },
  callback = function(ev)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.start({
      name = "clangd",
      cmd = {
        "clangd",
        "--background-index=false",
        "-j=1",
        "--limit-results=10",
        "--malloc-trim"
      },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'compile_commands.json', 'compile_flags.txt' }, { upward = true })[1]) or vim.fn.getcwd(),
      capabilities = capabilities,
    }, {
      bufnr = ev.buf,
    })
  end,
})
