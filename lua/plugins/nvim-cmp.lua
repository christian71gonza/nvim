return {
    "hrsh7th/nvim-cmp",
    event = { "VeryLazy" },
    dependencies = {
        "hrsh7th/cmp-omni",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        {
            "L3MON4D3/LuaSnip",
            dependencies = { "rafamadriz/friendly-snippets" },
            build = "make install_jsregexp",
        },
    },
    config = function()
        local CMP = require("cmp")
        local U = require("core.utils")

        -- Format the completion menu. Yes, I am that pedantic.
        local function format(_, item)
            local MAX_LABEL_WIDTH = 55
            local function whitespace(max, len)
                return (" "):rep(max - len)
            end

            -- Limit content width.
            local content = item.abbr
            if #content > MAX_LABEL_WIDTH then
                item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. "…"
            else
                item.abbr = content .. whitespace(MAX_LABEL_WIDTH, #content)
            end

            -- Replace kind with icons.
            item.kind = " " .. (U.kind_icons[item.kind] or U.kind_icons.Unknown) .. "│"

            -- Remove gibberish.
            item.menu = nil
            return item
        end

        local formatting = {
            fields = { "kind", "abbr" },
            format = format,
        }

        local window = {
            completion = CMP.config.window.bordered({
                winhighlight = "Normal:Pmenu,FloatBorder:SpecialCmpBorder,Search:None",
                scrollbar = true,
                border = "rounded",
                col_offset = -1,
                side_padding = 0,
            }),
            documentation = CMP.config.window.bordered({
                winhighlight = "Normal:Pmenu,FloatBorder:SpecialCmpBorder,Search:None",
                scrollbar = true,
                border = "rounded",
            }),
        }

        window.documentation.max_height = 18
        window.documentation.max_width = 80
        window.documentation.side_padding = 1

        CMP.setup({
            formatting = formatting,
            window = window,
            performance = {
                debounce = 50,
            },
        })
        require("core.utils.completion")
    end,
}

