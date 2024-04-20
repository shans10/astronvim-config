-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "astrodark",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = function(colors_name)
        local get_hlgroup = require("astroui").get_hlgroup

        -- Global Highlights --
        local highlights = {
          CursorLineFold = { link = "CursorLineNr" }, -- highlight fold indicator as well as line number
          GitSignsCurrentLineBlame = { fg = get_hlgroup("NonText").fg, italic = true }, -- italicize git blame virtual text
          ZenBg = { link = "Normal" }, -- Set zen-mode background to Normal mode
        }

        -- Catppuccin  Highlights --
        if colors_name:match "^catppuccin.*" then
          highlights.TablineFill = { link = "Tabline" }
        end

        return highlights
      end
    },
    -- Icons can be configured throughout the interface
    icons = {
      BookMark = "",
      FileNew = "",
      FileRecent = "",
      Find = "",
      GitBranch = "",
      Plugin = "",
      Project = "",
      Reload = "",
    },
  },
}
