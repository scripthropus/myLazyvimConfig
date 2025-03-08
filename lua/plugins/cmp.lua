return {
  -- nvim-cmpを有効化して設定
  {
    "hrsh7th/nvim-cmp",
    -- enabled = trueで明示的に有効化
    enabled = true,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")

      -- 標準的なnvim-cmpの設定
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          -- タブキーで補完候補を選択・確定
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end, { "i", "s" }),

          -- Shift+Tabで前の候補に移動
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),

          -- Enterキーはそのままに
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- blink.cmpを無効化（オプション）
  {
    "blink.cmp",
    enabled = false,
  },
}
