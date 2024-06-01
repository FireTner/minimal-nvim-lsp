local M = {
  "nvim-treesitter/nvim-treesitter",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", },
  event = { "BufRead", "InsertEnter", "BufWinEnter", },
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = {
      enable = true,
    },
  },
}

function M.config(_, opts)
  require("nvim-treesitter.configs").setup(opts)
end

return M
