return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    local cmdline = {
      format = {
        cmdline = { title = "", icon = " " },
        lua = { title = "", icon = "󰢱 " },
        help = { title = "", icon = "󰋖 " },
        input = { title = "", icon = " " },
        filter = { title = "", icon = " " },
        search_up = { icon = "    " },
        search_down = { icon = "    " },
      },
    }
    require("noice").setup({
      cmdline = cmdline,
      messages = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
    })
  end
}

