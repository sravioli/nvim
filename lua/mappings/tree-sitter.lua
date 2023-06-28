local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

local mappings = {
  plugin = true,
  n = {
    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    [";"] = { ts_repeat_move.repeat_last_move_next, "Repeat next with treesitter" },
    [","] = {
      ts_repeat_move.repeat_last_move_previous,
      "Repeat prev with treesitter",
    },
    -- vim way: ; goes to the direction you were moving.
    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    ["f"] = { ts_repeat_move.builtin_f, "f movement (treesitter)" },
    ["F"] = { ts_repeat_move.builtin_F, "F movement (treesitter)" },
    ["t"] = { ts_repeat_move.builtin_t, "t movement (treesitter)" },
    ["T"] = { ts_repeat_move.builtin_T, "T movement (treesitter)" },
  },

  x = {
    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    [";"] = { ts_repeat_move.repeat_last_move_next, "Repeat next with treesitter" },
    [","] = {
      ts_repeat_move.repeat_last_move_previous,
      "Repeat prev with treesitter",
    },
    -- vim way: ; goes to the direction you were moving.
    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    ["f"] = { ts_repeat_move.builtin_f, "f movement (treesitter)" },
    ["F"] = { ts_repeat_move.builtin_F, "F movement (treesitter)" },
    ["t"] = { ts_repeat_move.builtin_t, "t movement (treesitter)" },
    ["T"] = { ts_repeat_move.builtin_T, "T movement (treesitter)" },
  },

  o = {
    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    [";"] = { ts_repeat_move.repeat_last_move_next, "Repeat next with treesitter" },
    [","] = {
      ts_repeat_move.repeat_last_move_previous,
      "Repeat prev with treesitter",
    },
    -- vim way: ; goes to the direction you were moving.
    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    ["f"] = { ts_repeat_move.builtin_f, "f movement (treesitter)" },
    ["F"] = { ts_repeat_move.builtin_F, "F movement (treesitter)" },
    ["t"] = { ts_repeat_move.builtin_t, "t movement (treesitter)" },
    ["T"] = { ts_repeat_move.builtin_T, "T movement (treesitter)" },
  },
}

return mappings
