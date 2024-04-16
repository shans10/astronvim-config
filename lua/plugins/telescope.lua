-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Telescope

---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-project.nvim",
    "jvgrootveld/telescope-zoxide",
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local is_available = require("astrocore").is_available
        local maps = opts.mappings

        -- File browser
        if is_available "telescope-file-browser.nvim" then
          maps.n["<Leader>."] =
            { function() require("telescope").extensions.file_browser.file_browser() end, desc = "File browser" }
        end

        -- Buffer
        maps.n["<Leader>,"] = {
          function()
            if #vim.t.bufs > 1 then
              require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
            else
              require("astronvim.utils").notify "No other buffers open"
            end
          end,
          desc = "Switch buffer",
        }
        maps.n["<Leader>bb"] = opts.mappings.n["<Leader>,"]

        -- Find
        maps.n["<Leader>fd"] = {
          "<cmd>Telescope find_files cwd=%:p:h find_command=rg,--ignore,--hidden,--files<cr>",
          desc = "Find files in CWD",
        }
        if is_available "telescope-project.nvim" then
          maps.n["<Leader>fp"] =
            { function() require("telescope").extensions.project.project() end, desc = "Find projects" }
        end
        if is_available "telescope-undo.nvim" then
          maps.n["<Leader>fu"] = { "<cmd>Telescope undo<cr>", desc = "Find undos" }
        end
        if is_available "telescope-zoxide" then
          maps.n["<Leader>fz"] = { "<cmd>Telescope zoxide list theme=dropdown<cr>", desc = "Find zoxide directories" }
        end

        -- LSP
        maps.n["<Leader>ld"] = {
          function() require("telescope.builtin").diagnostics { bufnr = 0 } end,
          desc = "Document diagnostics",
        }
        maps.n["<Leader>lD"] =
          { function() require("telescope.builtin").diagnostics() end, desc = "Workspace diagnostics" }
        maps.n["<Leader>le"] =
          { function() require("telescope.builtin").lsp_definitions() end, desc = "Show definition" }
      end,
    },
  },
  opts = function(_, opts)
    local actions = require "telescope.actions"
    local fb_actions = require("telescope").extensions.file_browser.actions
    return require("astrocore").extend_tbl(opts, {
      extensions = {
        file_browser = {
          mappings = {
            i = {
              ["<C-z>"] = fb_actions.toggle_hidden,
            },
            n = {
              z = fb_actions.toggle_hidden,
            },
          },
          previewer = false,
          theme = "dropdown",
        },
        project = {
          base_dirs = {
            "~/Programming",
            "~/dotfiles",
            "~/.config/nvim",
          },
          theme = "dropdown",
          order_by = "asc",
          sync_with_nvim_tree = true,
        },
        zoxide = {
          mappings = {
            ["<C-b>"] = {
              keepinsert = true,
              action = function(selection)
                require("telescope").extensions.file_browser.file_browser { cwd = selection.path }
              end,
            },
          },
        },
      },
      pickers = {
        buffers = {
          path_display = { "smart" },
          mappings = {
            i = { ["<c-d>"] = actions.delete_buffer },
            n = { ["d"] = actions.delete_buffer },
          },
          ignore_current_buffer = true,
          previewer = false,
          sort_mru = true,
          theme = "dropdown",
        },
        find_files = {
          previewer = false,
          theme = "dropdown",
        },
        oldfiles = {
          previewer = false,
          theme = "dropdown",
        },
      },
    })
  end,
  config = function(plugin, opts)
    -- Run the core AstroNvim configuration function with the options table
    require "astronvim.plugins.configs.telescope"(plugin, opts)

    -- Require telescope and load extensions as necessary
    local telescope = require "telescope"
    telescope.load_extension "file_browser"
    telescope.load_extension "project"
    telescope.load_extension "undo"
    telescope.load_extension "zoxide"
  end,
}
