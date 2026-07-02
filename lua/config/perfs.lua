-- Disable legacy swap files and backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Reduce ShaDa disk updates. 
vim.opt.shada = "!,'50,<50,s10,h"

-- Faster update time
vim.opt.updatetime = 250
