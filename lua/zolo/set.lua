
vim.opt.relativenumber  = true
vim.opt.number  = true
vim.opt.tabstop  = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab  = true
vim.opt.smartindent  = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch  = false
vim.opt.hlsearch  = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")


vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"

vim.cmd.colorscheme('catppuccin-macchiato')
vim.opt.redrawtime = 0
-- required for obsidian plugin
vim.opt.conceallevel = 1

if vim.env.SSH_TTY then
    vim.g.clipboard = {
        name = 'OSC 52',
        copy = {
            ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
            ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
        },
        paste = {
            ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
            ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
        },
    }
end
