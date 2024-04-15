-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Install/Configure Rust-Tools

---@type LazySpec
return {
  { "simrat39/rust-tools.nvim", lazy = true }, -- add lsp plugin
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.setup_handlers = require("astrocore").extend_tbl(opts.setup_handlers, {
        -- add custom handler
        rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
      })
      opts.servers = require("astrocore").list_insert_unique(opts.servers, { "rust_analyzer" })
    end,
  },
}
