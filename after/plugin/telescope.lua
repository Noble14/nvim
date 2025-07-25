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
                ["<C-f>"] = "cycle_previewers_prev",
                ["<C-d>"] = "cycle_previewers_next",
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

local is_smart_case = true

vim.keymap.set('n', '<leader>ts', function()
    local case
    if is_smart_case then
        print("smart case")
        is_smart_case = false
        case = no_smart_case
    else
        print("no smart case")
        is_smart_case = true
        case = smart_case
    end
    require('telescope').setup{
        defaults = {
            vimgrep_arguments= case
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

vim.keymap.set('n', '<leader>pW', function()
    builtin.grep_string({
        search = vim.fn.expand("<cword>"),
        word_match = "-w"
    })
end)

vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {desc = 'List definitions'})
vim.keymap.set('n', '<leader>lc', builtin.command_history, {desc = 'List command history'})
vim.keymap.set('n', '<leader>lhs', builtin.search_history, {desc = 'List search history'})
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {desc = 'List document symbols'})
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {desc = 'List references'})
vim.keymap.set('n', '<leader>lb', builtin.buffers, {desc = 'List buffers'})
vim.keymap.set('n', '<leader>lo', builtin.oldfiles, {desc = 'List previous files'})
vim.keymap.set('n', '<leader>l;', builtin.command_history, {desc = 'List command history'})
vim.keymap.set('n', '<leader>lq', builtin.quickfixhistory, {desc = 'List quickfix history'})
vim.keymap.set('n', '<leader>lj', builtin.jumplist, {desc = 'List jumps'})
vim.keymap.set('n', '<leader>ll', builtin.resume, {desc = 'Continue from last list'})
vim.keymap.set('n', '<leader>ld', function()
    builtin.diagnostics({
        bufnr = 0
    })
end)

vim.keymap.set('n', '<leader>bb', builtin.builtin, {desc = 'List builtins'})

-- git remaps
require "config.telescope.git_commit".setup()
vim.keymap.set('n', '<leader>gS', builtin.git_status, {desc = 'List git status'})
vim.keymap.set('n', '<leader>gb', function ()
    builtin.git_branches({
        show_remote_tracking_branches = false
    })
end)
vim.keymap.set('n', '<leader>gB', function ()
    builtin.git_branches({
        show_remote_tracking_branches = true
    })
end)

require "config.telescope.multigrep".setup()
