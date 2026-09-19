-- Make nvim appear fullscreen in kitty
local function send_osc(code)
    if vim.env.TMUX then
        return string.format("\27Ptmux;\27%s\27\\", code)
    end
    return code
end

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
    callback = function()
        local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
        if normal and normal.bg then
            local hex_color = string.format("#%06x", normal.bg)
            local osc11 = string.format("\27]11;%s\27\\", hex_color)
            io.write(send_osc(osc11))
            io.stdout:flush()
        end
    end,
})

vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        io.write(send_osc("\27]111\27\\"))
        io.stdout:flush()
    end,
})

-- relative numbers
vim.opt.number = true
vim.wo.relativenumber = true

-- presistant history
vim.opt.undofile = true

-- Split right by default
vim.opt.splitright = true

-- Remove margin diagnostic signs
vim.diagnostic.config({ signs = false })
