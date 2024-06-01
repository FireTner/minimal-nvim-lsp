local M = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
}

M.opts = {
  fast_wrap = {},
  disable_filetype = {
    "TelescopePrompt",
    "vim",
  },
}

function M.config(_, opts)
  require("nvim-autopairs").setup(opts)

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
