-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        "lua_ls",
        "tsserver",
      },
    },
    -- enable servers that you already have installed without mason
    servers = {
      "clangd",
      "hls",
      "pyright",
      "tsserver",
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        ["<Leader>ld"] = false, -- disable hover diagnostic keymap
        ["<Leader>lD"] = false, -- change description in mappings
        gh = { function() vim.lsp.buf.hover() end, desc = "Hover symbol details" },
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
      },
    },
  },
}
