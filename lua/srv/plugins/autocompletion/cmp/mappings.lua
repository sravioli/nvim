local cmp = require "cmp"
local ls = require "luasnip"
local cmp_fn = require "srv.plugins.autocompletion.cmp.functions"

return {
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),

  ["<M-p>"] = cmp.mapping(function()
    if ls.choice_active() then ls.change_choice(-1) end
  end, { "i", "s" }),

  ["<M-n>"] = cmp.mapping(function()
    if ls.choice_active() then ls.change_choice(1) end
  end, { "i", "s" }),

  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif ls.jumpable(-1) then
      ls.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
    -- this way you will only jump inside the snippet region
    elseif ls.expand_or_jumpable() then
      ls.expand_or_jump()
    elseif cmp_fn.has_words_before() then
      cmp.complete()
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<CR>"] = cmp.mapping {
    i = function(fallback)
      if cmp.visible() then
        cmp.confirm { behavior = cmp.ConfirmBehavior.Insert, select = false }
      else
        fallback()
      end
    end,
    s = cmp.mapping.confirm { select = true },
    c = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = true },
  },
}
