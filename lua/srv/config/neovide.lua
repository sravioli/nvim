---Not really a configuration option, but `g:neovide` only exists and is set to
---`v:true` if this Neovim is in Neovide. Useful for configuring things only for
---Neovide in your `init.vim`/`init.lua`:
---
---```lua
---if vim.g.neovide then
---    -- Put anything you want to happen only in Neovide here
---end
---```

---// DISPLAY // -------------------------------------------------------------------

---FONT
---Controls the font used by Neovide. Only setting which is actually controlled through
---an option, and as such it's also documented in `:h guifont`. But to sum it up and
---also add Neovide's extension:
---
--- * The basic format is
---   `Primary\ Font,Fallback\ Font\ 1,Fallback\ Font\ 2:option1:option2:option3`,
---   while you can have as many fallback fonts as you want (even 0) and as many
---   options as you want (also even 0).
--- + Fonts
---   + are separated with `,` (commas).
---   + can contain spaces by either escaping them or using `_` (underscores).
--- + Options
---   + apply to all fonts at once.
---   + are separated from the fonts and themselves through `:` (colons).
---   + can be one of the following:
---     + `hX` — Sets the font size to `X` points, while `X` can be any (even
---       floating-point) number.
---     + `wX` (available since 0.11.2) — Sets the width **relative offset** to be
---       `X` points, while `X` can be again any number. Negative values shift
---       characters closer together, positive values shift them further apart.
---     + `b` — Sets the font **bold**.
---     + `i` — Sets the font _italic_.
---     + `#e-X` (available since 0.10.2) — Sets edge pixels to be drawn opaquely or
---       with partial transparency, while `X` is a type of edging:
---       + antialias (default)
---       + subpixelantialias
---       + alias
---     + `#h-X` (available since 0.10.2) - Sets level of glyph outline adjustment,
---       while `X` is a type of hinting:
---       + full (default)
---       + normal
---       + slight
---       + none
--- + Some examples:
---   + `Hack,Noto_Color_Emoji:h12:b` — Hack at size 12 in bold, with Noto Color Emoji
---     as fallback should Hack fail to contain any glyph.
---   + `Roboto_Mono_Light:h10` — Roboto Mono Light at size 10.
---   + `Hack:h14:i:#e-subpixelantialias:#h-none`
---
---
---```lua
---vim.o.guifont = "Source Code Pro:h14"
---```
vim.opt.guifont = "FiraCode Nerd Font Propo:h10.1:#h-normal"

---LINE SPACING
---Controls spacing between lines, may also be negative.
---
---```lua
---vim.opt.linespace = 0
---```
vim.opt.linespace = 1

---SCALE
---In addition to setting the font itself, this setting allows to change the scale
---without changing the whole font definition. Very useful for presentations. See
---jthe FAQ section about this for a nice recipe to bind this to a hotkey.
---
---```lua
---vim.g.neovide_scale_factor = 1.0
---```
vim.g.neovide_scale_factor = 1.0

---PADDING
---Controls the space between the window border and the actual Neovim, which is
---filled with the background color instead.
---
---```lua
---vim.g.neovide_padding_top = 0
---vim.g.neovide_padding_bottom = 0
---vim.g.neovide_padding_right = 0
---vim.g.neovide_padding_left = 0
---```
vim.g.neovide_padding_top = 3
vim.g.neovide_padding_bottom = 3
vim.g.neovide_padding_right = 3
vim.g.neovide_padding_left = 3

---BACKGROUND COLOR (CURRENTLY MACOS ONLY)
---
---Setting `g:neovide_background_color` to a value that can be parsed by csscolorparser-rs
---will set the color of the whole window to that value.
---
---Note that `g:neovide_transparency` should be 0 if you want to unify transparency
---of content and title bar.
---
---```lua
----- Helper function for transparency formatting
---local alpha = function()
---  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
---end
----- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
---vim.g.neovide_transparency = 0.0
---vim.g.transparency = 0.8
---vim.g.neovide_background_color = "#0f1117" .. alpha()
---```
vim.g.neovide_transparency = 0
vim.g.transparency = 0

---FLOATING BLUR AMOUNT
---Setting `g:neovide_floating_blur_amount_x` and `g:neovide_floating_blur_amount_y`
---controls the blur radius on the respective axis for floating windows.
---
---```lua
---vim.g.neovide_floating_blur_amount_x = 2.0
---vim.g.neovide_floating_blur_amount_y = 2.0
---```
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

---TRANSPARENCY
---Setting `g:neovide_transparency` to a value between 0.0 and 1.0 will set the opacity
---of the window to that value.
---
---```lua
---vim.g.neovide_transparency = 0.8
---```
vim.g.neovide_transparency = 1

---SCROLL ANIMATION LENGTH
---Sets how long the scroll animation takes to complete, measured in seconds.
---
---```lua
---vim.g.neovide_scroll_animation_length = 0.3
---```
vim.g.neovide_scroll_animation_length = 0.3

---HIDING THE MOUSE WHEN TYPING
---By setting this to `v:true`, the mouse will be hidden as soon as you start typing.
---This setting only affects the mouse if it is currently within the bounds of the
---neovide window. Moving the mouse makes it visible again.
---
---```lua
---vim.g.neovide_hide_mouse_when_typing = false
---```
vim.g.neovide_hide_mouse_when_typing = true

---UNDERLINE AUTOMATIC SCALING
---Setting `g:neovide_underline_automatic_scaling` to a boolean value determines whether
---automatic scaling of text underlines (including undercurl, underdash, etc.) is enabled.
---Noticeable for font sizes above 15.
---
---**Note**: This is currently glitchy, and leads to some underlines being clipped by
---the line of text below.
---
---```lua
---vim.g.neovide_underline_automatic_scaling = false
---```
vim.g.neovide_underline_automatic_scaling = false

---THEME
---Set the `background` option when Neovide starts. Possible values: _light_, _dark_,
---_auto_. On systems that support it, _auto_ will mirror the system theme, and will
---update `background` when the system theme changes.
---
---```lua
---vim.g.neovide_theme = 'auto'
---```
vim.g.neovide_theme = "dark"

---// FUNCTIONALITY // -------------------------------------------------------------

---REFRESH RATE
---Setting `g:neovide_refresh_rate` to a positive integer will set the refresh rate of
---the app. This is limited by the refresh rate of your physical hardware, but can be
---lowered to increase battery life.
---
---Also do note that Neovide's frame pacing is far from optimal at the moment, so better
---hardware might not mean better FPS.
---
---```lua
---vim.g.neovide_refresh_rate = 60
---```
vim.g.neovide_refresh_rate = 60

---IDLE REFRESH RATE
---Setting `g:neovide_refresh_rate_idle` to a positive integer will set the refresh
---rate of the app when it is not in focus.
---
---This might not have an effect on every platform (e.g. Wayland).
---
---```lua
---vim.g.neovide_refresh_rate_idle = 5
---```
vim.g.neovide_refresh_rate_idle = 1

---NO IDLE
---Setting `g:neovide_no_idle` to a boolean value will force neovide to redraw all the
---time. This can be a quick hack if animations appear to stop too early.
---
---```lua
---vim.g.neovide_no_idle = true
---```
vim.g.neovide_no_idle = false

---CONFIRM QUIT
---If set to `true`, quitting while having unsaved changes will require confirmation.
---Enabled by default.
---
---```lua
---vim.g.neovide_confirm_quit = true
---```
vim.g.neovide_confirm_quit = true

---FULLSCREEN
---Setting `g:neovide_fullscreen` to a boolean value will set whether the app should
---take up the entire screen. This uses the so called "windowed fullscreen" mode that
---is sometimes used in games which want quick window switching.
---
---```lua
---vim.g.neovide_fullscreen = true
---```
vim.g.neovide_fullscreen = true

---REMEMBER PREVIOUS WINDOW SIZE
---Setting `g:neovide_remember_window_size` to a boolean value will determine whether
---the window size from the previous session or the default size will be used on startup.
---The commandline option `--size` will take priority over this value.
---
---```lua
---vim.g.neovide_remember_window_size = true
---```
vim.g.neovide_remember_window_size = true

---PROFILER
---Setting this to `v:true` enables the profiler, which shows a frametime graph in the
---upper left corner.
---
---```
---vim.g.neovide_profiler = false
---```
vim.g.neovide_profiler = false

---// INPUT SETTINGS //-------------------------------------------------------------

---MACOS ALT IS META
---Interprets Alt + whatever actually as `<M-whatever>`, instead of sending the actual
---special character to Neovim.
---
---```
---vim.g.neovide_input_macos_alt_is_meta = false
---```
-- vim.g.neovide_input_macos_alt_is_meta = false

---IME
---This lets you disable the IME input. For example, to only enables IME in input
---mode and when searching, so that you can navigate normally, when typing some East
---Asian languages, you can add a few auto commands:
---
---```lua
---vim.g.neovide_input_ime = true
---```
--[[
  ```lua
  augroup ime_input
    autocmd!
    autocmd InsertLeave * execute "let g:neovide_input_ime=v:false"
    autocmd InsertEnter * execute "let g:neovide_input_ime=v:true"
    autocmd CmdlineEnter [/\?] execute "let g:neovide_input_ime=v:false"
    autocmd CmdlineLeave [/\?] execute "let g:neovide_input_ime=v:true"
  augroup END
  ```

  ```lua
  local function set_ime(args)
    if args.event:match("Enter$") then
      vim.g.neovide_input_ime = true
    else
      vim.g.neovide_input_ime = false
    end
  end

  local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

  vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = ime_input,
    pattern = "*",
    callback = set_ime
  })

  vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    group = ime_input,
    pattern = "[/\\?]",
    callback = set_ime
  })
  ```
]]
vim.g.neovide_input_ime = true

---TOUCH DEADZONE
---Setting `g:neovide_touch_deadzone` to a value equal or higher than 0.0 will set how
---many pixels the finger must move away from the start position when tapping on the
---screen for the touch to be interpreted as a scroll gesture.
---
---If the finger stayed in that area once lifted or the drag timeout happened, however,
---the touch will be interpreted as tap gesture and the cursor will move there.
---
---A value lower than 0.0 will cause this feature to be disabled and _all_ touch events
---will be interpreted as scroll gesture.
---
---```lua
---vim.g.neovide_touch_deadzone = 6.0
---```
-- vim.g.neovide_touch_deadzone = 6.0

---TOUCH DRAG TIMEOUT
---Setting `g:neovide_touch_drag_timeout` will affect how many seconds the cursor has
---to stay inside `g:neovide_touch_deadzone` in order to begin "dragging"
---
---Once started, the finger can be moved to another position in order to form a visual
---selection. If this happens too often accidentally to you, set this to a higher value
---like `0.3` or `0.7`.
---
---```lua
---vim.g.neovide_touch_drag_timeout = 0.17
---```
-- vim.g.neovide_touch_drag_timeout = 0.17

---// CURSOR SETTINGS //------------------------------------------------------------

---ANIMATION LENGTH
---Setting `g:neovide_cursor_animation_length` determines the time it takes for the
---cursor to complete it's animation in seconds. Set to `0` to disable.
---
---```lua
---vim.g.neovide_cursor_animation_length = 0.13
---```
vim.g.neovide_cursor_animation_length = 0.15

---ANIMATION TRAIL SIZE
---Setting `g:neovide_cursor_trail_size` determines how much the trail of the cursor
---lags behind the front edge.
---
---```lua
---vim.g.neovide_cursor_trail_size = 0.8
---```
vim.g.neovide_cursor_trail_size = 0.4

---ANTIALIASING
---Enables or disables antialiasing of the cursor quad. Disabling may fix some cursor
---visual issues.
---
---```lua
---vim.g.neovide_cursor_antialiasing = true
---```
vim.g.neovide_cursor_antialiasing = true

---ANIMATE IN INSERT MODE
---If disabled, when in insert mode (mostly through `i` or `a`), the cursor will move
---like in other programs and immediately jump to its new position.
---
---```lua
---vim.g.neovide_cursor_animate_in_insert_mode = true
---```
vim.g.neovide_cursor_animate_in_insert_mode = true

---ANIMATE SWITCH TO COMMAND LINE
---If disabled, the switch from editor window to command line is non-animated, and
---the cursor jumps between command line and editor window immediately. Does **not**
---influence animation inside of the command line.
---
---```lua
---vim.g.neovide_cursor_animate_command_line = true
---```
vim.g.neovide_cursor_animate_command_line = true

---UNFOCUSED OUTLINE WIDTH
---Specify cursor outline width in `em`s. You probably want this to be a positive value
---less than 0.5. If the value is <=0 then the cursor will be invisible. This setting
---takes effect when the editor window is unfocused, at which time a block cursor will
---be rendered as an outline instead of as a full rectangle.
---
---```lua
---vim.g.neovide_cursor_unfocused_outline_width = 0.125
---```
vim.g.neovide_cursor_unfocused_outline_width = 0.05

---// CURSOR PARTIClES /------------------------------------------------------------
---There are a number of vfx modes you can enable which produce particles behind the
---cursor. These are enabled by setting `g:neovide_cursor_vfx_mode` to one of the
---following constants.

---NONE AT ALL
---The default, no particles at all.
---
---```lua
---vim.g.neovide_cursor_vfx_mode = ""
---```
-- vim.g.neovide_cursor_vfx_mode = ""

---OTHER AVAILABLE
--- + "railgun"
--- + "torpedo"
--- + "pixiedust"
--- + "sonicboom"
--- + "ripple"
--- + "wireframe"
vim.g.neovide_cursor_vfx_mode = "torpedo"

---// PARTICLE SETTINGS //----------------------------------------------------------
---Options for configuring the particle generation and behavior.

---PARTICLE OPACITY
---Sets the transparency of the generated particles.
---
---```lua
---vim.g.neovide_cursor_vfx_opacity = 200.0
---```
vim.g.neovide_cursor_vfx_opacity = 200.0

---PARTICLE LIFETIME
---Sets the amount of time the generated particles should survive.
---
---```lua
---vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
---```
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2

---PARTICLE DENSITY
---Sets the number of generated particles.
---
---```lua
---vim.g.neovide_cursor_vfx_particle_density = 7.0
---```
vim.g.neovide_cursor_vfx_particle_density = 15.0

---PARTICLE SPEED
---Sets the speed of particle movement.
---
---```lua
---vim.g.neovide_cursor_vfx_particle_speed = 10.0
---```
vim.g.neovide_cursor_vfx_particle_speed = 10.0

---PARTICLE PHASE
---Only for the `railgun` vfx mode.
---
---Sets the mass movement of particles, or how individual each one acts. The higher the
---value, the less particles rotate in accordance to each other, the lower, the more
---line-wise all particles become.
---
---```lua
---vim.g.neovide_cursor_vfx_particle_phase = 1.5
---```
vim.g.neovide_cursor_vfx_particle_phase = 1.5

---PARTICLE CURL
---Only for the `railgun` vfx mode.
---
---Sets the velocity rotation speed of particles. The higher, the less particles actually
---move and look more "nervous", the lower, the more it looks like a collapsing sine
---wave.
---
---```lua
---vim.g.neovide_cursor_vfx_particle_curl = 1.0
---```
vim.g.neovide_cursor_vfx_particle_curl = 1.0
