return {
  ---Peek lines just when you intend
  "nacro90/numb.nvim",
  event = "CmdlineEnter",
  opts = {
    ---Peek only when the command is only a number instead of when it starts with
    ---a number
    number_only = true,
  },
}
