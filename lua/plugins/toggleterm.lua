-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Toggleterm

---@type LazySpec
return {
  "akinsho/toggleterm.nvim",
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = { ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" } },
        i = { ["<C-\\>"] = { "<Esc><cmd>ToggleTerm<cr>", desc = "Toggle terminal" } },
        t = {
          ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
          ["<C-q>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
          ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
        },
      },
    },
  },
}
