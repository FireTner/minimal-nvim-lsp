local M = {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonUpdate", },
}

M.opts = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
  },

  PATH = "skip", -- already added in options.lua
}

function M.config(_, opts)
  require("mason").setup(opts)
end

return M
