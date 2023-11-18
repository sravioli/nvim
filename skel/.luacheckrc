---@diagnostic disable: lowercase-global

-- Suppress report output for files without warnings.
--
-- - `-qq` - Suppress output of warnings.
-- - `-qqq` - Only output summary.
--
-- (integer 0..3 - default: 0)
quiet = 0

-- Whether to colorize output or not
--
-- (boolean - default: true)
color = true

-- Show warning codes.
--
-- (boolean - default: false)
codes = true

-- Show ranges of columns related to warnings.
--
-- (boolean - default: false)
ranges = true

-- Use custom formatter. `<formatter>` must be a module name or one of:
--
-- - `TAP` - Test Anything Protocol formatter;
-- - `JUnit` - JUnit XML formatter;
-- - `visual_studio` - MSBuild/Visual Studio aware formatter;
-- - `plain` - simple warning-per-line formatter;
-- - `default` - standard formatter.
--
-- (string|function - default: "default")
formatter = "plain"

-- Path to cache file. (default: `.luacheckcache`). See Caching
--
-- If LuaFileSystem is available, Luacheck can cache results of checking files. On
-- subsequent checks, only files which have changed since the last check will be rechecked,
-- improving run time significantly. Changing options (e.g. defining additional globals)
-- does not invalidate cache. Caching can be enabled by using `--cache <cache>` option or
-- `cache` config option. Using `--cache` without an argument or setting `cache` config
-- option to `true` sets `.luacheckcache` as the cache file. Note that `--cache` must be
-- used every time `luacheck` is run, not on the first run only.
--
-- (boolean|string - default: false)
cache = true

-- Check `<jobs>` files in parallel. Requires [LuaLanes][1]. Default number of jobs is set
-- to number of available processing units.
--
-- [1]: http://cmr.github.io/lanes/
--
-- (unsigned - default: 1)
jobs = 1

-- Do not check files matching these globbing patterns. Recursive globs such as `**/*.lua`
-- are supported.
--
-- (array of strings - default: {})
exclude_files = {}

-- Do not(?) check files not matching these globbing patterns.
--
-- (array of strings - default: include all files)
-- include_files = {}

-- Show warnings related to global variables.
--
-- (boolean - default: true)
global = true

-- Show warnings related to unused variables and values.
--
-- (boolean - default: true)
unused = true

-- Show warnings related to redefined variables.
--
-- (boolean - default: true)
redefined = true

-- Show warnings related to unused arguments and loop variables.
--
-- (boolean - default: true)
unused_args = true

-- Show warnings related to unused variables set together with used ones.
--
-- Unused value assigned to a local variable is secondary if its origin is the last item on
-- the RHS of assignment, and another value from that item is used. Secondary values typically
-- appear when result of a function call is put into locals, and only some of them are
-- later used. For example, here value assigned to `b` is secondary, value assigned to `c`
-- is used, and value assigned to `a` is simply unused:
--
--  ```lua
-- local a, b, c = f(), g() return c
-- ```
--
-- A variable is secondary if all values assigned to it are secondary. In the snippet above,
-- `b` is a secondary variable.
--
-- Warnings related to unused secondary values and variables can be removed using
-- `-s`/`--no-unused-secondaries` CLI option or `unused_secondaries` config option.
--
-- (boolean - default: true)
unused_secondaries = true

-- Show warnings related to implicit `self` argument.
--
-- (boolean - default: true)
self = true

-- Set standard globals, default is `max`. `<std>` can be one of:
--
-- - `max` - union of globals of Lua 5.1 - 5.4 and LuaJIT 2.x;
-- - `min` - intersection of globals of Lua 5.1 - 5.4 and LuaJIT 2.x;
-- - `lua51` - globals of Lua 5.1 without deprecated ones;
-- - `lua51c` - globals of Lua 5.1;
-- - `lua52` - globals of Lua 5.2;
-- - `lua52c` - globals of Lua 5.2 compiled with LUA_COMPAT_ALL;
-- - `lua53` - globals of Lua 5.3;
-- - `lua53c` - globals of Lua 5.3 compiled with LUA_COMPAT_5_2;
-- - `lua54` - globals of Lua 5.4;
-- - `lua54c` - globals of Lua 5.4 compiled with LUA_COMPAT_5_3;
-- - `luajit` - globals of LuaJIT 2.x;
-- - `ngx_lua` - globals of Openresty [lua-nginx-module][1] 0.10.10, including standard
--   LuaJIT 2.x globals;
-- - `love` - globals added by [LÖVE][2];
-- - `busted` - globals added by Busted 2.0, by default added for files ending with `_spec.lua`
--   within `spec`, `test`, and `tests` subdirectories;
-- - `rockspec` - globals allowed in rockspecs, by default added for files ending with
--   `.rockspec`;
-- - `luacheckrc` - globals allowed in Luacheck configs, by default added for files ending
--   with `.luacheckrc`;
-- - `none` - no standard globals.
--
-- CLI option `--stds` allows combining built-in sets described above using `+`. For
-- example, `--std max` is equivalent to `--std=lua51c+lua52c+lua53c+luajit`. Leading plus
-- sign adds new sets to current one instead of replacing it. For instance, `--std +love`
-- is suitable for checking files using [LÖVE][2] framework. Custom sets of globals can be
-- defined by mutating global variable `stds` in config. See [Custom sets of globals][3]
--
--
-- [1]: https://github.com/openresty/lua-nginx-module
-- [2]: https://love2d.org
-- [3]: https://luacheck.readthedocs.io/en/stable/cli.html#stdsconfig.html#custom-stds
--
-- (string|set of standard globals	- default: "max")
std = "max"

-- Add custom global variables or fields on top of standard ones.
--
-- CLI options `--globals`, `--new-globals`, `--read-globals`, `--new-read-globals`, and
-- corresponding config options add new allowed globals or fields. E.g. `--read-globals
-- foo --globals foo.bar` allows accessing `foo` global and mutating its `bar` field.
-- `--not-globals` also operates on globals and fields and removes definitions of both
-- standard and custom globals.
--
-- (Array of strings|field definition map	- default: {})
globals = { "vim" }

-- Set custom global variables or fields. Removes custom globals added previously.
--
-- (Array of strings|field definition map	- default: do not overwrite)
-- new_globals = {}

-- Add read-only global variables or fields.
--
-- (Array of strings|field definition map	- default: {})
read_globals = {}

-- Set read-only global variables or fields. Removes read-only globals added previously.
--
-- (Array of strings|field definition map	- default: do not overwrite)
-- new_read_globals = {}

-- Remove custom and standard global variables or fields.
--
-- (array of strings - default: {})
not_globals = {}

-- Equivalent to `--std max`.
--
-- (boolean - default: false)
-- compat = false

-- Allow defining globals implicitly by setting them.
--
-- Luacheck can be configured to consider globals assigned under some conditions to be
-- defined implicitly. When `-d`/`--allow_defined` CLI option or `allow_defined` config
-- option is used, all assignments to globals define them; when `-t`/`--allow_defined_top`
-- CLI option or `allow_defined_top` config option is used, assignments to globals in the
-- top level function scope (also known as main chunk) define them. A warning is produced
-- when an implicitly defined global is not accessed anywhere.
--
-- (boolean - default: false)
allow_defined = false

-- Allow defining globals implicitly by setting them in the top level scope.
--
-- Luacheck can be configured to consider globals assigned under some conditions to be
-- defined implicitly. When `-d`/`--allow_defined` CLI option or `allow_defined` config
-- option is used, all assignments to globals define them; when `-t`/`--allow_defined_top`
-- CLI option or `allow_defined_top` config option is used, assignments to globals in the
-- top level function scope (also known as main chunk) define them. A warning is produced
-- when an implicitly defined global is not accessed anywhere.
--
-- (boolean - default: false)
allow_defined_top = false

-- Limit visibility of implicitly defined globals to their files.
--
-- Files can be marked as modules using `-m`/`--module` CLI option or `module` config
-- option to simulate semantics of the deprecated [module][1] function. Globals implicitly
-- defined inside a module are considired part of its interface, are not visible outside
-- and are not reported as unused. Assignments to other globals are not allowed, even to
-- defined ones.
--
-- [1]: http://www.lua.org/manual/5.1/manual.html#pdf-module
--
-- (boolean - default: false)
module = false

-- Set maximum allowed line length.
--
-- (number|false default: 120)
max_line_length = 95

-- Set maximum allowed length for lines ending with code.
--
-- (number|false default: 120)
max_code_line_length = 95

-- Set maximum allowed length for lines within a string.
--
-- (number|false default: 120)
max_string_line_length = 95

-- Set maximum allowed length for comment lines.
--
-- (number|false default: 120)
max_comment_line_length = 95

-- Set maximum cyclomatic complexity for functions.
--
-- (number|false default: false)
max_cyclomatic_complexity = 10

-- CLI options `--ignore`, `--enable` and `--only` and corresponding config options allow
-- filtering warnings using pattern matching on warning codes, variable names or both. If
-- a pattern contains a slash, the part before slash matches warning code and the part
-- after matches variable name. Otherwise, if a pattern contains a letter or underscore,
-- it matches variable name. Otherwise, it matches warning code. E.g.:
--
--
-- | Pattern | Matching warnings                                                       |
-- | ------- | ----------------------------------------------------------------------- |
-- | 4.2     | Shadowing declarations of arguments or redefining them.                 |
-- | .*_     | Warnings related to variables with `_` suffix.                          |
-- | 4.2/.*_ | Shadowing declarations of arguments with `_` suffix or redefining them. |
--
-- Unless already anchored, patterns matching variable names are anchored at both sides
-- and patterns matching warning codes are anchored at their beginnings. This allows one
-- to filter warnings by category (e.g. `--only 1` focuses `luacheck` on global-related
-- warnings).

-- Filter out warnings matching patterns.
--
-- (array of patterns - default: {})
ignore = {}

-- Do not filter out warnings matching patterns.
--
-- (array of patterns - default: {})
enable = {}

-- Filter out warnings not matching patterns.
--
-- (array of patterns - default: do not filter)
-- only = {}
