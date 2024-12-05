---@diagnostic disable: undefined-global
-- luacheck: ignore 113
return {
	postfix({
		trig = "++",
		dscr = "post increment expansion",
		match_pattern = "[%a_]+$",
	}, {
		l(l.POSTFIX_MATCH .. " = " .. l.POSTFIX_MATCH .. " + 1;"),
	}),
	postfix({
		trig = "--",
		dscr = "post decrement expansion",
		match_pattern = "[%a_]+$",
	}, {
		l(l.POSTFIX_MATCH .. " = " .. l.POSTFIX_MATCH .. " - 1;"),
	}),

	s(
		{ trig = "logenter", dscr = "enter a function to log" },
		fmt(
			[[
      logger.enter_fn(__func__);
      logger.log("{}"{});
      {}
      ]],
			{
				i(1, "message"),
				i(2, ", data"),
				i(0),
			}
		)
	),

	s({ trig = "logexit", dscr = "exit a function to log" }, t("logger.exit_fn();")),
	s(
		{ trig = "logfn", dscr = "log a function" },
		fmt(
			[[
      logger.enter_fn(__func__);

      logger.log("{}"{});
      {}

      logger.exit_fn();
      ]],
			{
				i(1, "message"),
				i(2, ", data"),
				i(0),
			}
		)
	),
}
