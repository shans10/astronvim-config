-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Neovide settings
if vim.g.neovide then
  -- General
  vim.o.guifont = "JetBrainsMono Nerd Font:h11.5"
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_no_idle = true

  -- Cursor
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_trail_size = 0.1

  -- Transparency
  vim.g.neovide_transparency = 0.97
  -- Clear highlight groups
  vim.cmd [[
    hi FloatBorder guibg=none
    hi NormalFloat guibg=none
    hi WhichKeyFloat guibg=none
  ]]
end
