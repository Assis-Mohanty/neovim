return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        -- Main editor transparency
        hl.Normal = { bg = "NONE" }
        hl.NormalNC = { bg = "NONE" }
        hl.SignColumn = { bg = "NONE" }
        hl.LineNr = { bg = "NONE" }
        hl.CursorLineNr = { bg = "NONE" }
        hl.LineNrAbove = { fg = "#aaaaaa", bg = "NONE" }
        hl.LineNrBelow = { fg = "#aaaaaa", bg = "NONE" }
        
        -- Keep floats/popups solid so you can read them
        hl.NormalFloat = { bg = "#16161e" }
        hl.FloatBorder = { bg = "#16161e" }
        hl.Pmenu = { bg = "#16161e" }
      end,
    },
  },
}
