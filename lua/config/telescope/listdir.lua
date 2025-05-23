
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local conf = require('telescope.config').values
local M = {}

local list_dir = function(opts)
    opts = opts or {}
    opts.cwd = opts.cwd or vim.uv.cwd()

    local finder = finders.new_async_job{
        command_generator = function(prompt)
            local args = {"ls"}
            table.insert(args, "-al")
            return vim.tbl_flatten {
                args
            }
        end,
        -- entry_maker =  make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
    }
    pickers.new(opts, {
        debounce = 100,
        prompt_title = "List Directory",
        finder = finder,
        previewer = conf.grep_previewer(opts),
        sorter = require('telescope.sorters').empty(),
    }):find()

end

list_dir(require("telescope.themes").get_dropdown{})

return M
