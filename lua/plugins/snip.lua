local M = {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
}

M.opts = {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

function M.config(_, opts)
  local luasnip = require("luasnip")
  luasnip.config.set_config(opts)
  
  -- vscode format
  from_vscode = require("luasnip.loaders.from_vscode")
  from_vscode.lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
  from_vscode.lazy_load({ paths = "your path!" })
  from_vscode.lazy_load({ paths = vim.g.vscode_snippets_path or "" })

  -- snipmate format
  from_snipmate = require("luasnip.loaders.from_snipmate")
  from_snipmate.load()
  from_snipmate.lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

  -- lua format
  from_lua = require("luasnip.loaders.from_lua")
  from_lua.load()
  from_lua.lazy_load({ paths = vim.g.lua_snippets_path or "" })

  -- https://github.com/NvChad/NvChad/issues/1223
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      if
        luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
        and not luasnip.session.jump_active
      then
        luasnip.unlink_current()
      end
    end,
  })
end

return M
