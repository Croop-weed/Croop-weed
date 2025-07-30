return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          [[=================     ===============     ===============   ========  ========]],
          [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
          [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
          [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
          [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
          [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
          [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
          [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
          [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
          [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
          [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
          [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
          [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
          [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
          [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
          [[||.=='    _-'                                                     `' |  /==.||]],
          [[=='    _-'                        N E O V I M                         \/   `==]],
          [[\   _-'                                                                `-_   /]],
          [[ `''                                                                      ``' ]],
        },
        center = {
          {
            icon = " ",
            desc = "Find File",
            key = "f",
            key_hl = "Number",
            action = "Telescope find_files",
          },
          {
            icon = " ",
            desc = "Recent Files",
            key = "r",
            key_hl = "Number",
            action = "Telescope oldfiles",
          },
          {
            icon = " ",
            desc = "Open Projects",
            key = "p",
            key_hl = "Number",
            action = "Telescope projects",
          },
          {
            icon = " ",
            desc = "Edit Dotfiles",
            key = "d",
            key_hl = "Number",
            action = "Telescope find_files cwd=~/.config",
          },

          {
            icon = " ",
            desc = "Restore Last Session",
            key = "s",
            key_hl = "Number",
            action = "lua require('persistence').load()",
          },
          {
            icon = "󰈙 ",
            desc = "New File",
            key = "n",
            key_hl = "Number",
            action = "enew",
          },
          {
            icon = " ",
            desc = "Quit",
            key = "q",
            key_hl = "Number",
            action = "q",
          },
        },
        footer = {
          "󰛨 Keep hacking NeoVim!",
        },
      },
    })
  end,
}
