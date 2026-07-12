return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  config = function()
    require("tree-sitter-manager").setup({
      languages = {
        nbcl = {
          install_info = {
            url = "https://github.com/nbcl-lang/tree-sitter-nbcl",
            queries = "queries",
          },
        },
      },
    })

    vim.filetype.add({
      extension = {
        nbcl = "nbcl",
      },
    })
  end,
}
