-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Alpha dashboard

---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local get_icon = require("astroui").get_icon

      opts.section.buttons.val = {
        opts.button("LDR S l", get_icon "Reload" .. "  Reload last session  "),
        opts.button("LDR f o", get_icon "FileRecent" .. "  Recently opened files  "),
        opts.button("LDR f f", get_icon "Find" .. "  Find file  "),
        opts.button("LDR f n", get_icon "FileNew" .. "  New file  "),
        opts.button("LDR f p", get_icon "Project" .. "  Open project  "),
        opts.button("LDR f '", get_icon "BookMark" .. "  Jump to bookmark  "),
      }
    end,
  },
}
