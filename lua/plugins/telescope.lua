return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local fb_actions = require "telescope._extensions.file_browser.actions"
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      defaults = {
        borderchars = {
        prompt = {"─", "│", "─", "│", '┌', '┐', "┘", "└"},
        results = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      },
        layout_config = {
            height = 0.6,
            width = 0.6,
        },
        mappings = {
          i = {
            ['<C-k>'] = require('telescope.actions').move_selection_previous, -- move to prev result
            ['<C-j>'] = require('telescope.actions').move_selection_next, -- move to next result
            ['<C-l>'] = require('telescope.actions').select_default, -- open file
          },
        },
      },
      pickers = {
        oldfiles = {
          disable_devicons = true,
          prompt_title = false,
          preview_title = false,
          results_title = false
        },
        live_grep = {
          results_title = false,
          prompt_title = false,
          preview_title = false,
          file_ignore_patterns = { 'node_modules', '.git', '.venv' },
          disable_devicons = true,
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
        find_files = {
          results_title = false,
          prompt_title = false,
          preview_title = false,
          disable_devicons = true,
          file_ignore_patterns = { 'node_modules', '.git', '.venv' },
          hidden = true,
        },
      },
      extensions = {
        cmdline = {
            icons = {
                history = "",
                command = "",
                number  = "",
                system  = "",
                unknown = "",
            }
        },
        file_browser = {
          results_title = false,
          prompt_title = false,
          preview_title = false,
          disable_devicons = true,
          hidden = { file_browser = true, folder_browser = true },
    mappings = {
                ["i"] = {
                    ["<A-a>"] = fb_actions.create,
                    ["<A-r>"] = fb_actions.rename,
                    ["<A-m>"] = fb_actions.move,
                    ["<A-y>"] = fb_actions.copy,
                    ["<A-d>"] = fb_actions.remove,
                    ["<A-o>"] = fb_actions.open,
                    ["<A-g>"] = fb_actions.goto_parent_dir,
                    ["<A-e>"] = fb_actions.goto_home_dir,
                    ["<A-w>"] = fb_actions.goto_cwd,
                    ["<A-t>"] = fb_actions.change_cwd,
                    ["<A-f>"] = fb_actions.toggle_browser,
                    ["<A-h>"] = fb_actions.toggle_hidden,
                    ["<A-s>"] = fb_actions.toggle_all,
                },
            },
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'file_browser')

    vim.keymap.set("n", "fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
    
    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', 'ff', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

  end,
}
