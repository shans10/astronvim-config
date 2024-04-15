-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Install/Configure Noice

local core = require "astrocore"

---@type LazySpec
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = not vim.g.neovide,
    dependencies = { "rcarriga/nvim-notify", init = false, config = true },
    opts = function(_, opts)
      return core.extend_tbl(opts, {
        cmdline = { view = "cmdline" },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = core.is_available "inc-rename.nvim", -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        routes = {
          { filter = { event = "msg_show", find = "^/", ["not"] = { kind = "search_count" } }, opts = { skip = true } }, -- skip searched text message
        },
        views = {
          split = {
            enter = true,
            size = "50%",
          },
        },
      })
    end,
    init = function()
      vim.g.lsp_handlers_enabled = false
      --- Scroll hover documentation
      --
      -- Scroll forwards
      vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
        if not require("noice.lsp").scroll(4) then return "<c-f>" end
      end, { silent = true, expr = true })
      -- Scroll backwards
      vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
        if not require("noice.lsp").scroll(-4) then return "<c-b>" end
      end, { silent = true, expr = true })
    end,
  },

  -- Configure AstroNvim core plugins to play well with noice
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      local noice_opts = require("astrocore").plugin_opts "noice.nvim"
      -- disable the necessary handlers in AstroLSP
      if not opts.lsp_handlers then opts.lsp_handlers = {} end
      if vim.tbl_get(noice_opts, "lsp", "hover", "enabled") ~= false then
        opts.lsp_handlers["textDocument/hover"] = false
      end
      if vim.tbl_get(noice_opts, "lsp", "signature", "enabled") ~= false then
        opts.lsp_handlers["textDocument/signatureHelp"] = false
      end
    end,
  },
  {
    "heirline.nvim",
    optional = true,
    opts = function(_, opts)
      local noice_opts = require("astrocore").plugin_opts "noice.nvim"
      if vim.tbl_get(noice_opts, "lsp", "progress", "enabled") ~= false then -- check if lsp progress is enabled
        opts.statusline[9] = require("astroui.status").component.lsp { lsp_progress = false }
      end
    end,
  },
}
