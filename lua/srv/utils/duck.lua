---@module 'srv.utils.duck'
---@author sravioli
---@license GNU-GPLv3

---The Duck module makes it possible to have a duck that waddles around the screen.
---@class Duck
local M = {}

---@private
---
---list of active ducks
M.ducks = {}

---@private
---
---Configuration for duck appearance and behavior.
---
---@class Duck.config
---@field character string character representing the duck.
---@field speed     number speed of duck animation.
---@field width     number width of the duck window.
---@field height    number height of the duck window.
---@field color     string color of the duck.
---@field blend     number blend value for the duck window.
M.config = {
  character = "🦆",
  speed = 10,
  width = 2,
  height = 1,
  color = "none",
  blend = 100,
}

---@private
---
---Makes a duck waddle on the screen.
---
---@param duck  number window ID of the duck.
M.waddle = function(duck)
  local timer = vim.loop.new_timer()
  if not timer then
    vim.notify("duck: could not create timer!", vim.log.levels.ERROR)
    return
  end

  local new_duck = { name = duck, timer = timer }
  table.insert(M.ducks, new_duck)

  local waddle_period = 1000 / M.config.speed
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

        if row < 0 and sin < 0 then
          row = vim.o.lines
        end
        if row > vim.o.lines and sin > 0 then
          row = 0
        end
        if col < 0 and cos < 0 then
          col = vim.o.columns
        end
        if col > vim.o.columns and cos > 0 then
          col = 0
        end

        config["row"] = row + 0.5 * sin
        config["col"] = col + 1 * cos

        vim.api.nvim_win_set_config(duck, config)
      end
    end)
  )
end

---Creates a new duck and starts its animation.
function M.hatch()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, 1, true, { M.config.character })

  local duck = vim.api.nvim_open_win(buf, false, {
    relative = "cursor",
    style = "minimal",
    row = 1,
    col = 1,
    width = M.config.width,
    height = M.config.height,
  })

  vim.api.nvim_set_hl(0, "Duck", { fg = M.config.color, blend = M.config.blend })

  vim.api.nvim_win_set_option(duck, "winhighlight", "Normal:Duck" .. duck)
  M.waddle(duck)
end

---Cooks the last hatched duck.
function M.cook()
  local last_duck = M.ducks[#M.ducks]

  if not last_duck then
    vim.notify("You've cooked all the ducks!", vim.log.levels.INFO)
    return
  end

  local duck = last_duck["name"]
  local timer = last_duck["timer"]
  table.remove(M.ducks, #M.ducks)
  timer:stop()

  vim.api.nvim_win_close(duck, true)
end

return M
