-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Install/Configure Indent-Tools

---@type LazySpec
return {
  "arsham/indent-tools.nvim",
  dependencies = { "arsham/arshlib.nvim" },
  event = "User AstroFile",
  config = function() require("indent-tools").config {} end,
}
