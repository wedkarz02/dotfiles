
vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
if vim.fn.has("wsl") == 1 then
    vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("Yank", { clear = true }),
        callback = function()
            vim.fn.system("clip.exe", vim.fn.getreg('"'))
        end,
    })
end

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50
