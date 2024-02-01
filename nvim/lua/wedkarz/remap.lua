local vscode = require("vscode-neovim")

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

if vim.g.vscode then
    -- vscode stuff here 
    -- vim.keymap.set("n", "<leader>w", vscode.call('workbench.action.files.save'))
else
    -- normal nvim stuff here
    vim.keymap.set("n", "<leader>w", vim.cmd.write)
end
