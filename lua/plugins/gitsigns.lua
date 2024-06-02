local M = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile", },
}

function M.config(_, opts)
  require("gitsigns").setup(opts)
end

M.opts = {
  signcolumn = false,
  numhl = true,
}

return M
