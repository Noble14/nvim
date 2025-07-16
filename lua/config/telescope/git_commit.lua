local make_entry = require "telescope.make_entry"
local entry_display = require "telescope.pickers.entry_display"

local M = {}

local git_entry_maker = function(entry)
    local displayer = entry_display.create {
        separator = " ",
        items = {
            { width = 7 },
            { width = 50 },
            { width = 10 },
            { remaining = true },
        },
    }

    local make_display = function(e)
        return displayer {
            { e.value, "TelescopeResultsIdentifier" },
            e.msg,
            {e.date, "TelescopeResultsNumber"},
            {e.name, "TelescopeResultsComment"}
        }
    end
    if entry == "" then
        return nil
    end

    local sha, msg, date, name = string.match(entry, "([^ ]+) (.+)|([%d-]+) (.+)")

    if not msg then
        sha = entry
        msg = "<empty commit message>"
    end

    return make_entry.set_default_entry_mt({
        value = sha,
        ordinal = sha .. " " .. msg,
        date = date,
        name = name,
        msg = msg,
        display = make_display,
        current_file = vim.api.nvim_buf_get_name(0),
    }, {})
end

M.setup = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>gC', function()
        builtin.git_commits({
            git_command = { "git", "log", '--pretty=%h %s|%cs %aN', "--abbrev-commit", "--", "." },
            entry_maker = git_entry_maker
        })
    end)
    vim.keymap.set('n', '<leader>gc', function()
        builtin.git_bcommits({
            git_command = { "git", "log", '--pretty=%h %s|%cs %aN', "--abbrev-commit", "--follow" },
            entry_maker = git_entry_maker
        })
    end)
    vim.keymap.set('v', '<leader>gc', function()
        local m = vim.fn.mode() -- detect current mode
        local lstart2 = 0
        local lend2 = 0
        if m == 'v' or m == 'V' or m == '\22' then -- <C-V>
            vim.cmd([[execute "normal! \<ESC>"]])
            lstart2 = vim.fn.getpos("'<")[2]
            lend2 = vim.fn.getpos("'>")[2]
        end
        builtin.git_bcommits_range({
            from = tonumber(lstart2),
            to = tonumber(lend2),
            git_command = {"git", "log", '--pretty=%h %s|%cs %aN', "--abbrev-commit", "--no-patch", "-L"},
            entry_maker = git_entry_maker
        })
    end)
end

return M
