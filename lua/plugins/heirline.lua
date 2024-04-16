-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Heirline

---@type LazySpec
return {
  "rebelot/heirline.nvim",
  dependencies = {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      maps.n["<Leader>bB"] = {
        function()
          require("astroui.status.heirline").buffer_picker(function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end)
        end,
        desc = "Select buffer from tabline",
      }
      maps.n["<Leader>bD"] = {
        function()
          require("astroui.status.heirline").buffer_picker(function(bufnr) require("astrocore.buffer").close(bufnr) end)
        end,
        desc = "Close buffer from tabline",
      }
    end,
  },
  opts = function(_, opts)
    -- Disable winbar
    opts.winbar = nil
  end,
}
