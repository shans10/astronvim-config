-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize AstroCore Autocmds

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = {
      -- Change line numbering system based on mode
      relative_number_switch = {
        clear = true,
        {
          event = "InsertEnter",
          pattern = "*",
          desc = "Switch to absolute line numbering when entering Insert mode",
          group = "relative_number_switch",
          callback = function()
            if vim.wo.relativenumber then
              vim.wo.relativenumber = false
              vim.w.adaptive_relative_number_state = true
            end
          end,
        },
        {
          event = "InsertLeave",
          pattern = "*",
          desc = "Switch to relative line numbering when leaving Insert mode",
          group = "relative_number_switch",
          callback = function()
            if vim.w.adaptive_relative_number_state then
              vim.wo.relativenumber = true
              vim.w.adaptive_relative_number_state = false
            end
          end,
        },
      },
    },
  },
}
