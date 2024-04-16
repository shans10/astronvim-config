-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      update_in_insert = false,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        cmdheight = 1, -- enable cmd area
        list = true, -- enable whitespace rendering
        -- listchars = vim.opt.listchars:append({ tab = '› ', trail = '•', lead = '.', extends = '#', nbsp = '.' }), -- change whitespace characters
        listchars = vim.opt.listchars:append { tab = "› ", trail = "•" }, -- change whitespace characters
        scrolloff = 9, -- keep scroll position away from edges
        -- shell = "/usr/bin/fish",
        -- showcmdloc = "statusline", -- show cmd status in statusline
        -- showtabline = 0, -- disable tabline
        swapfile = false, -- disable swapfile creation
        wrap = false, -- sets vim.opt.wrap
        whichwrap = vim.opt.whichwrap:append "<,>[,],h,l", -- automatically go to next line
      },
    },
  },
}
