-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Install/Configure Vim-Suda

---@type LazySpec
return {
  "lambdalisue/suda.vim",
  enabled = function() return not vim.g.win32 end,
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>W"] = { "<Cmd>SudaWrite<CR>", desc = "Suda Write" },
        },
      },
    },
  },
  cmd = { "SudaRead", "SudaWrite" },
}
