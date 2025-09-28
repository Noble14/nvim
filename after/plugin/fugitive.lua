local function find_buffer(pattern)
  -- Get a list of all loaded buffer IDs
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    -- Ensure the buffer is valid and loaded before getting its name
    if vim.api.nvim_buf_is_loaded(bufnr) then
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      -- Check if the buffer name contains the pattern
      if string.find(bufname, pattern, 1, true) then
        return bufnr
      end
    end
  end
  return nil
end


vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" });
vim.keymap.set("n", "gq", function()
    local  bufnr = find_buffer("fugitive:")
    if bufnr then
        vim.api.nvim_buf_delete(bufnr, {})
    end
end, { desc = "Git status" });
