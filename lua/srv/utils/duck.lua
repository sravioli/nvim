---@module 'srv.utils.duck'
---@author sravioli
---@license GNU-GPLv3

---@class Duck
local M = {}

local notify = require "notify"

M.list = {}

M.config = {
  character = "🦆",
  speed = 10,
  width = 2,
  height = 1,
  color = "none",
  blend = 100,
}

M.waddle = function(duck, speed)
  local timer = vim.loop.new_timer()
  if not timer then
    notify("duck: could not create timer!", "error")
    return
  end
  local new_duck = { name = duck, timer = timer }
  table.insert(M.list, new_duck)

  local waddle_period = 1000 / (speed or M.config.speed)
  vim.loop.timer_start(
    timer,
    1000,
    waddle_period,
    vim.schedule_wrap(function()
      if vim.api.nvim_win_is_valid(duck) then
        local config = vim.api.nvim_win_get_config(duck)
        local col, row = config["col"][false], config["row"][false]

        math.randomseed(os.time() * duck)
        local angle = 2 * math.pi * math.random()
        local sin = math.sin(angle)
        local cos = math.cos(angle)

        if row < 0 and sin < 0 then row = vim.o.lines end
        if row > vim.o.lines and sin > 0 then row = 0 end
        if col < 0 and cos < 0 then col = vim.o.columns end
        if col > vim.o.columns and cos > 0 then col = 0 end

        config["row"] = row + 0.5 * sin
        config["col"] = col + 1 * cos

        vim.api.nvim_win_set_config(duck, config)
      end
    end)
  )
end

M.hatch = function(character, speed, color)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, 1, true, { character or M.config.character })

  local duck = vim.api.nvim_open_win(buf, false, {
    relative = "cursor",
    style = "minimal",
    row = 1,
    col = 1,
    width = M.config.width,
    height = M.config.height,
  })
  vim.cmd(
    "hi Duck"
      .. duck
      .. " guifg="
      .. (color or M.config.color)
      .. " guibg=none blend="
      .. M.config.blend
  )
  vim.api.nvim_win_set_option(duck, "winhighlight", "Normal:Duck" .. duck)

  M.waddle(duck, speed)
end
M.cook = function()
  local last_duck = M.list[#M.list]

  if not last_duck then
    notify "There are no more ducks to cook!"
    return
  end

  local duck = last_duck["name"]
  local timer = last_duck["timer"]
  table.remove(M.list, #M.list)
  timer:stop()

  vim.api.nvim_win_close(duck, true)
end

M.setup = function(opts) M.config = vim.tbl_deep_extend("force", M.config, opts or {}) end

return M
