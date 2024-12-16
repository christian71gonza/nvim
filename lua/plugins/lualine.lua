return {
  'nvim-lualine/lualine.nvim',
  config = function()

    local U = require("core.utils")

    -- Custom mode names.
    -- I want all of them to be the same length so that lualine stays constant.
    local function fmt_mode(s)
        local mode_map = {
            ["COMMAND"] = "COMMND",
            ["V-BLOCK"] = "V-BLCK",
            ["TERMINAL"] = "TERMNL",
            ["V-REPLACE"] = "V-RPLC",
            ["O-PENDING"] = "0PNDNG",
        }
        return mode_map[s] or s
    end

    -- Theme dependant custom colors.
    local text_hl
    local icon_hl
    local green
    local red
    if U.is_default() then
        local C = require("core.utils.theme").palette
        red = C.red
        green = C.green
        icon_hl = { fg = C.gray2 }
        text_hl = { fg = C.gray2 }
    end

    local function get_recording_color()
        if U.is_recording() then
            return { fg = red }
        else
            return { fg = text_hl }
        end
    end

    local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
            return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
            }
        end
    end

    local default_z = {
        {
            "location",
            icon = { "", align = "left" },
            fmt = function(str)
                local fixed_width = 7
                return string.format("%" .. fixed_width .. "s", str)
            end,
        },
        {
            "progress",
            icon = { "", align = "left" },
            separator = { right = "", left = "" },
        },
    }

    local tree = {
        sections = {
            lualine_a = {
                {
                    "mode",
                    fmt = fmt_mode,
                    icon = { "" },
                    separator = { right = " ", left = "" },
                },
            },
            lualine_b = {},
            lualine_c = {
                {
                    U.get_short_cwd,
                    padding = 0,
                    icon = { "   ", color = icon_hl },
                    color = text_hl,
                },
            },
            lualine_x = {},
            lualine_y = {},
            lualine_z = default_z,
        },
        filetypes = { "NvimTree" },
    }

    local telescope = {
        sections = {
            lualine_a = {
                {
                    "mode",
                    fmt = fmt_mode,
                    icon = { "" },
                    separator = { right = " ", left = "" },
                },
            },
            lualine_b = {},
            lualine_c = {
                {
                    function() return "Telescope" end,
                    color = text_hl,
                    icon = { "  ", color = icon_hl },
                },
            },
            lualine_x = {},
            lualine_y = {},
            lualine_z = default_z,
        },
        filetypes = { "TelescopePrompt" },
    }
    require("lualine").setup({
        sections = {
            lualine_a = {
                {
                    "mode",
                    fmt = fmt_mode,
                    icon = { "" },
                    separator = { right = " ", left = "" },
                },
            },
        lualine_b = {},
        lualine_c = {
            {
                U.get_recording_state_icon,
                color = get_recording_color,
                padding = 0,
                separator = "",
            },
            {
                "branch",
                color = text_hl,
                icon = { " ", color = icon_hl },
                separator = "",
                padding = 0,
            },
            {
                "diff",
                color = text_hl,
                icon = { "  ", color = text_hl },
                source = diff_source,
                symbols = {
                    added = "+ ",
                    modified = "~ ",
                    removed = "- ",
                },
                diff_color = {
                    added = icon_hl,
                    modified = icon_hl,
                    removed = icon_hl,
                },
                padding = 0,
            },
        },
        lualine_y = {},
        lualine_z = default_z,
    },
        options = {
            disabled_filetypes = { "dashboard" },
            globalstatus = true,
            section_separators = { left = " ", right = " " },
            component_separators = { left = "", right = "" },
        },
        extensions = {
            telescope,
            ["nvim-tree"] = tree,
        },
    })

    -- Ensure correct background for lualine.
    vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
        callback = function(_) require("lualine").setup({}) end,
        pattern = { "*.*" },
        once = true,
    })
    vim.defer_fn(function() require("lualine").setup({}) end, 1)

    -- Load default theme configuration if applicable.
    if U.is_default() then require("core.utils.theme").setup_lualine() end
  end
}
