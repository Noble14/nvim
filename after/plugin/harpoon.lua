local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
      settings = {
        save_on_toggle = false,

        -- save harpoon list to git branch
        key = function()
          local handle = io.popen("git branch --show-current 2> /dev/null")
          local git_branch = handle:read("*a") or ""
          handle:close()
          git_branch = string.gsub(git_branch, "\n", "")
          local cwd = vim.fn.getcwd()

          return git_branch .. cwd
        end,
      },
    })
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<M-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-h>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
