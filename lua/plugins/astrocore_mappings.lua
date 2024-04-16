-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize AstroCore Mappings

---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    local get_icon = require("astroui").get_icon
    local utils = require "utils"
    local maps = opts.mappings

    --- NORMAL MODE ---
    --
    -- Disable mappings
    maps.n["<Leader>bb"] = false
    maps.n["<Leader>bl"] = false
    -- maps.n["<Leader>bp"] = false
    maps.n["<Leader>br"] = false
    -- Disable default buffer sort keybindings
    maps.n["<Leader>bs"] = false
    maps.n["<Leader>bse"] = false
    maps.n["<Leader>bsi"] = false
    maps.n["<Leader>bsm"] = false
    maps.n["<Leader>bsp"] = false
    maps.n["<Leader>bsr"] = false

    -- Usability remaps
    maps.n["J"] = { "mzJ`z" }
    maps.n["<C-d>"] = { "<C-d>zz" }
    maps.n["<C-u>"] = { "<C-u>zz" }

    -- Standard Leader-key operations
    maps.n["<Leader><C-w>"] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD to current file" }

    -- Better search
    maps.n["n"] = { utils.better_search "n", desc = "Next search" }
    maps.n["N"] = { utils.better_search "N", desc = "Previous search" }

    -- Better increment/decrement
    maps.n["-"] = { "<C-x>", desc = "Decrement number" }
    maps.n["+"] = { "<C-a>", desc = "Increment number" }

    -- External terminal
    maps.n["<Leader>tt"] = { "<cmd>!alacritty<cr><cr>", desc = "Open alacritty in cwd" }

    -- Buffer Standalone Keybindings

    maps.n.L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" }
    maps.n.H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" }
    maps.n["<Leader>ba"] = { "ggVG", desc = "Select all" }
    maps.n["<Leader>bd"] = { function() require("astrocore.buffer").close() end, desc = "Delete buffer" }
    maps.n["<Leader>bf"] =
      { function() require("astrocore.buffer").close(0, true) end, desc = "Force delete buffer" }
    maps.n["<Leader>bi"] = { "gg=G", desc = "Indent all" }
    maps.n["<Leader>bl"] = { function() require("astrocore.buffer").prev() end, desc = "Last buffer" }
    maps.n["<leader>bl"] = { utils.last_buffer(), desc = "Last buffer" }
    maps.n["<Leader>bL"] =
      { function() require("astrocore.buffer").close_left() end, desc = "Close all buffers to the left" }
    maps.n["<Leader>bR"] =
      { function() require("astrocore.buffer").close_right() end, desc = "Close all buffers to the right" }
    maps.n["<Leader>bs"] = { "<cmd>w<cr>", desc = "Save buffer" }
    maps.n["<Leader>bS"] = { "<cmd>wa<cr>", desc = "Save all buffers" }
    maps.n["<Leader>bt"] = { "<cmd>%s/\\s\\+$//e | noh<cr>", desc = "Remove trailing whitespaces" }
    maps.n["<Leader>by"] = { "ggVGy", desc = "Yank buffer" }

    -- Buffer Sort
    maps.n["<Leader>b<C-s>"] = { desc = get_icon("Sort", 1, true) .. "Sort Buffers" }
    maps.n["<Leader>b<C-s>e"] =
      { function() require("astrocore.buffer").sort "extension" end, desc = "By extension" }
    maps.n["<Leader>b<C-s>r"] =
      { function() require("astrocore.buffer").sort "unique_path" end, desc = "By relative path" }
    maps.n["<Leader>b<C-s>p"] =
      { function() require("astrocore.buffer").sort "full_path" end, desc = "By full path" }
    maps.n["<Leader>b<C-s>i"] =
      { function() require("astrocore.buffer").sort "bufnr" end, desc = "By buffer number" }
    maps.n["<Leader>b<C-s>m"] =
      { function() require("astrocore.buffer").sort "modified" end, desc = "By modification" }

    --- INSERT MODE ---
    --
    -- Move line up or down
    maps.i["<A-j>"] = { "<Esc><cmd>m .+1<cr>gi", desc = "Move line down" }
    maps.i["<A-k>"] = { "<Esc><cmd>m .-2<cr>gi", desc = "Move line up" }

    -- Save File
    maps.i["<C-s>"] = { "<Esc><cmd>w<cr>", desc = "Save file" }

    --- VISUAL MODE ---
    --
    -- Better increment/decrement
    maps.x["+"] = { "g<C-a>", desc = "Increment number" }
    maps.x["-"] = { "g<C-x>", desc = "Decrement number" }

    -- Paste over text without losing it
    maps.x["p"] = { [["_dP]], desc = "Paste with preserve" }
  end,
}
