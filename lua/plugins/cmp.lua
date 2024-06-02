local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    require("plugins.snip"),
    require("plugins.autopairs"),
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
}

function M.opts()
  local cmp = require("cmp")

  return {
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },

    formatting = {
      format = function(_, vim_item)
        local MAX_LABEL_WIDTH = 20
        local label = vim_item.abbr
        local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)

        if truncated_label ~= label then
          vim_item.abbr = truncated_label .. "…"
        end

        return vim_item
      end,
    },

    window = {
      completion = {
        scrollbar = false,
      },
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behaviour = cmp.ConfirmBehaviourInsert,
        select = true,
      }),
    }),

    sources = cmp.config.sources({
      { name = "nvim_lsp", },
      { name = "luasnip", },
      { name = "buffer", },
      { name = "nvim_lua", },
      { name = "path", },
    }),
  }
end

function M.config(_, opts)
  require("cmp").setup(opts)
end

return M
