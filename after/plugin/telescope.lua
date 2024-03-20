require('telescope').setup{
    defaults = {
        path_display = {
            truncate = 3
        }

    },
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > "),
    use_regex = true
})
end)
vim.keymap.set('n', '<leader>pw', function()
	builtin.grep_string({
        search = vim.fn.expand("<cword>"),
    })
end)

vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>ld', function()
	builtin.diagnostics({
        bufnr = 0
    })
end)
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>bb', builtin.builtin, {})

