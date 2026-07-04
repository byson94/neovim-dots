require("config.perfs")
require("config.lazy")

vim.filetype.add({
  extension = {
    nbcl = "nbcl",
  },
})

vim.filetype.add({
  extension = {
    h = "c",
  },
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable native Tree-sitter highlighting and folding',
  callback = function()
    local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
    if lang then
      pcall(vim.treesitter.start)
    end
  end,
})

