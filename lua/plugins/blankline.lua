local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
}

M.opts = {
  indent = {
    char = "|",
    tab_char = "|",
  },
  scope = {
    show_start = false,
    show_end = false,
  },
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
}

function M.config(_, opts)
  require("ibl").setup(opts)
end

return M
