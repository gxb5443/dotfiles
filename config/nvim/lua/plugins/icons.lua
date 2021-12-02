local present, icons = pcall(require, "nvim-web-devicons")
if not present then
   return
end

local colors = {
   white = "#abb2bf",
   darker_black = "#2a303c",
   black = "#2E3440", --  nvim bg
   black2 = "#343a46",
   one_bg = "#373d49",
   one_bg2 = "#464c58",
   one_bg3 = "#494f5b",
   grey = "#4b515d",
   grey_fg = "#565c68",
   grey_fg2 = "#606672",
   light_grey = "#646a76",
   red = "#BF616A",
   baby_pink = "#de878f",
   pink = "#d57780",
   line = "#3a404c", -- for lines like vertsplit
   green = "#A3BE8C",
   vibrant_green = "#afca98",
   blue = "#7797b7",
   nord_blue = "#81A1C1",
   yellow = "#EBCB8B",
   sun = "#e1c181",
   purple = "#aab1be",
   dark_purple = "#B48EAD",
   teal = "#6484a4",
   orange = "#e39a83",
   cyan = "#9aafe6",
   statusline_bg = "#333945",
   lightbg = "#3f4551",
   lightbg2 = "#393f4b",
   pmenu_bg = "#A3BE8C",
   folder_bg = "#7797b7",
}

icons.setup {
   override = {
      c = {
         icon = "",
         color = colors.blue,
         name = "c",
      },
      css = {
         icon = "",
         color = colors.blue,
         name = "css",
      },
      deb = {
         icon = "",
         color = colors.cyan,
         name = "deb",
      },
      Dockerfile = {
         icon = "",
         color = colors.cyan,
         name = "Dockerfile",
      },
      html = {
         icon = "",
         color = colors.baby_pink,
         name = "html",
      },
      jpeg = {
         icon = "",
         color = colors.dark_purple,
         name = "jpeg",
      },
      jpg = {
         icon = "",
         color = colors.dark_purple,
         name = "jpg",
      },
      js = {
         icon = "",
         color = colors.sun,
         name = "js",
      },
      kt = {
         icon = "󱈙",
         color = colors.orange,
         name = "kt",
      },
      lock = {
         icon = "",
         color = colors.red,
         name = "lock",
      },
      lua = {
         icon = "",
         color = colors.blue,
         name = "lua",
      },
      mp3 = {
         icon = "",
         color = colors.white,
         name = "mp3",
      },
      mp4 = {
         icon = "",
         color = colors.white,
         name = "mp4",
      },
      out = {
         icon = "",
         color = colors.white,
         name = "out",
      },
      png = {
         icon = "",
         color = colors.dark_purple,
         name = "png",
      },
      py = {
         icon = "",
         color = colors.cyan,
         name = "py",
      },
      toml = {
         icon = "",
         color = colors.blue,
         name = "toml",
      },
      ts = {
         icon = "ﯤ",
         color = colors.teal,
         name = "ts",
      },
      rb = {
         icon = "",
         color = colors.pink,
         name = "rb",
      },
      rpm = {
         icon = "",
         color = colors.orange,
         name = "rpm",
      },
      vue = {
         icon = "﵂",
         color = colors.vibrant_green,
         name = "vue",
      },
      xz = {
         icon = "",
         color = colors.sun,
         name = "xz",
      },
      zip = {
         icon = "",
         color = colors.sun,
         name = "zip",
      },
   },
}
