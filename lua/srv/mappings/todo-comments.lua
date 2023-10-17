return {
  plugin = true,

  n = {
    ["]t"] = {
      function() require("todo-comments").jump_next() end,
      "Next todo comment",
    },

    ["[t"] = {
      function() require("todo-comments").jump_prev() end,
      "Previous todo comment",
    },
  },
}
