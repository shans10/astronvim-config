if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Install/Configure Trouble

---@type LazySpec
return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Trouble = "󱍼" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>x"
        maps.n[prefix] = { desc = require("astroui").get_icon("Trouble", 1, true) .. "Trouble" }
        maps.n[prefix .. "X"] =
          { "<Cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace diagnostics" }
        maps.n[prefix .. "x"] =
          { "<Cmd>TroubleToggle document_diagnostics<CR>", desc = "Document diagnostics" }
        maps.n[prefix .. "l"] = { "<Cmd>TroubleToggle loclist<CR>", desc = "Location list" }
        maps.n[prefix .. "q"] = { "<Cmd>TroubleToggle quickfix<CR>", desc = "Quickfix list" }
        maps.n[prefix .. "q"] = { "<Cmd>TroubleToggle lsp_references<CR>", desc = "Lsp references" }
        maps.n[prefix .. "q"] = { "<Cmd>TodoTrouble<CR>", desc = "TODOs" }
      end,
    },
  },
  opts = {
    use_diagnostic_signs = true,
    action_keys = {
      close = { "q", "<ESC>" },
      cancel = "<C-e>",
    },
  },
}
