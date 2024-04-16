-- User Utility Functions

M = {}

function M.better_search(key)
  return function()
    local searched, error =
      pcall(vim.cmd.normal, { args = { (vim.v.count > 0 and vim.v.count or "") .. key }, bang = true })
    if not searched and type(error) == "string" then require("astrocore").notify(error, vim.log.levels.ERROR) end
    vim.opt.hlsearch = searched
  end
end

function M.last_buffer()
  return function()
    local success, _ = pcall(function() vim.cmd "e #" end)
    if not success then
      local error = "No last buffer found"
      require("astrocore").notify(error, vim.log.levels.ERROR)
    end
  end
end

return M
