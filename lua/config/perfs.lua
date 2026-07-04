-- Disable legacy swap files and backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Reduce ShaDa disk updates. 
vim.opt.shada = "!,'50,<50,s10,h"

-- Faster update time
vim.opt.updatetime = 250

-- UI
vim.opt.synmaxcol = 300
vim.opt.lazyredraw = true
vim.opt.display = "lastline"

-- Disable stuff 
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tohtml = 1
