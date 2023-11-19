local M = {}

M.client_notifications = {}

M.spinner = require("srv.preferences").spinners.FiraCode

M.get_notification_data = function(client_id, token)
  if not M.client_notifications[client_id] then
    M.client_notifications[client_id] = {}
  end

  if not M.client_notifications[client_id][token] then
    M.client_notifications[client_id][token] = {}
  end

  return M.client_notifications[client_id][token]
end

M.update_spinner = function(client_id, token)
  local notif_data = M.get_notification_data(client_id, token)

  if notif_data.spinner then
    local new_spinner = (notif_data.spinner + 1) % #M.spinner
    notif_data.spinner = new_spinner

    notif_data.notification = vim.notify("", nil, {
      hide_from_history = true,
      icon = M.spinner[new_spinner],
      replace = notif_data.notification,
    })

    vim.defer_fn(function()
      M.update_spinner(client_id, token)
    end, 100)
  end
end

M.format_title = function(title, client_name)
  return client_name .. (#title > 0 and ": " .. title or "")
end

M.format_message = function(message, percentage)
  return (percentage and percentage .. "%\t" or "") .. (message or "")
end

M["$/progress"] = function(_, result, ctx)
  local client_id = ctx.client_id

  local val = result.value

  if not val.kind then
    return
  end

  local notif_data = M.get_notification_data(client_id, result.token)

  if val.kind == "begin" then
    local message = M.format_message(val.message, val.percentage)

    notif_data.notification = vim.notify(message, vim.log.levels.INFO, {
      title = M.format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
      icon = M.spinner[1],
      timeout = false,
      hide_from_history = false,
    })

    notif_data.spinner = 1
    M.update_spinner(client_id, result.token)
  elseif val.kind == "report" and notif_data then
    notif_data.notification =
      vim.notify(M.format_message(val.message, val.percentage), vim.log.levels.INFO, {
        replace = notif_data.notification,
        hide_from_history = false,
      })
  elseif val.kind == "end" and notif_data then
    notif_data.notification = vim.notify(
      val.message and M.format_message(val.message) or "Complete",
      vim.log.levels.INFO,
      {
        icon = "",
        replace = notif_data.notification,
        timeout = 3000,
      }
    )

    notif_data.spinner = nil
  end
end

return M
