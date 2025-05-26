require("obsidian").setup(
{
    workspaces = {
        {
            name = "notes",
            path = "~/projs/notes",
        },
    },
    note_id_func = function(title)
        suffix = ""
        if title == nil then
            for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(65, 90))
            end
            return tostring(os.time()) .. "-" .. suffix
        else
            return title
        end
    end
})

vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", {desc= "Open toaday's note (Obsidian)"})
vim.keymap.set("n", "<leader>od", ":ObsidianDailies<CR>", {desc= "Open dailies (Obsidian)"})
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", {desc= "Open new note (Obsidian)"})
vim.keymap.set("n", "<leader>op", ":ObsidianQuickSwitch<CR>", {desc= "Open quick switch (Obsidian)"})
vim.keymap.set("v", "<leader>ol", ":ObsidianLinkNew<CR>", {desc= "Open link (Obsidian)"})
