-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Neotree

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "AstroNvim/astrocore",
    opts = { mappings = { n = { ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle nvim-tree" } } } },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = "open_default",
      filtered_items = {
        visible = true, -- show hidden/ignored files with different color
      },
    },
    sources = {
      "filesystem",
    },
    add_blank_line_top = false,
    enable_diagnostics = false,
  },
}
