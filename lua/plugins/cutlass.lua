-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Install/Configure Cutlass

---@type LazySpec
return {
  "gbprod/cutlass.nvim",
  event = { "User AstroFile" },
  opts = { cut_key = "x" },
  override_del = true,
}
