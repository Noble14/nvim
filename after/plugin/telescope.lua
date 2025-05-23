require('telescope').setup{
    defaults = {
        path_display = {
            truncate = 3,
            shorten = 3
        },
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            }

        }

    },
    extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')

local smart_case =
{
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case"
}
local no_smart_case =
{
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
}
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ts', function()
    require('telescope').setup{
        defaults = {
            vimgrep_arguments= no_smart_case
        }
    }

end)


vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({search = vim.fn.input("Grep > "),
    use_regex = true
})
end)
vim.keymap.set('n', '<leader>sf', function()
    builtin.grep_string({search = vim.fn.expand('%:t:r') ..":" .. vim.fn.expand("<cword>"),
    use_regex = true
})
end)
vim.keymap.set('n', '<leader>pw', function()
    builtin.grep_string({
        search = vim.fn.expand("<cword>"),
    })
end)


vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>lhq', builtin.quickfixhistory, {})
vim.keymap.set('n', '<leader>lhc', builtin.command_history, {})
vim.keymap.set('n', '<leader>lhs', builtin.search_history, {})
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>lgs', builtin.git_status, {})
vim.keymap.set('n', '<leader>lgb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>lb', builtin.buffers, {})
vim.keymap.set('n', '<leader>l;', builtin.command_history, {})
vim.keymap.set('n', '<leader>lq', builtin.quickfixhistory, {})
vim.keymap.set('n', '<leader>lj', builtin.jumplist, {})
vim.keymap.set('n', '<leader>ll', builtin.resume, {})
vim.keymap.set('n', '<leader>lc', builtin.git_bcommits, {})
vim.keymap.set('v', '<leader>lc', function()
    local m = vim.fn.mode() -- detect current mode
    if m == 'v' or m == 'V' or m == '\22' then -- <C-V>
        vim.cmd([[execute "normal! \<ESC>"]])
        local lstart2 = vim.fn.getpos("'<")[2]
        local lend2 = vim.fn.getpos("'>")[2]
        print( lstart2)
        print("end line: " .. lend2)
    end
    builtin.git_bcommits_range({
        from = tonumber(start_line),
        to = tonumber(end_line)
    })
end)
vim.keymap.set('n', '<leader>ld', function()
    builtin.diagnostics({
        bufnr = 0
    })
end)
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>bb', builtin.builtin, {})

require "config.telescope.multigrep".setup()

