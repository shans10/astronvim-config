-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Install/Configure Catppuccin Theme

---@type LazySpec
return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  opts = {
    flavour = "mocha",
    dim_inactive = { enabled = true, percentage = 0.35 },
    integrations = {
      aerial = true,
      dap = true,
      dap_ui = true,
      gitsigns = true,
      indent_blankline = true,
      markdown = true,
      mason = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = { background = false },
      },
      neotree = true,
      notify = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = true,
      treesitter = true,
      which_key = true,
      window_picker = true,
    },
  },
}
