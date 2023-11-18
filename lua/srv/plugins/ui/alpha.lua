return {
  ---a lua powered greeter like vim-startify / dashboard-nvim
  "goolord/alpha-nvim",
  enabled = false,
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local present, alpha = pcall(require, "alpha")
    if not present then
      return
    end

    local term_size = {
      width = math.floor(vim.fn.winwidth(0) * 0.85),
      height = math.floor(vim.fn.winheight(0) * 0.45),
    }

    local function term()
      return {
        type = "terminal",
        -- use chafa as preprocessor to print image/gif
        command = [[Chafa.exe ]]
          .. vim.fn.stdpath "config"
          .. [[/assets/370z.gif ]]
          .. [[--animate on --center on --clear ]]
          .. [[--colors full --color-extractor average --color-space din99d ]]
          .. [[--dither diffusion --dither-grain 1 --dither-intensity 1 ]]
          .. [[--duration inf --fill quad,half,hhalf,vhalf,space,solid,block ]]
          .. [[--font-ratio 157/398 --optimize 9 --scale max --speed 25fps ]]
          .. [[--symbols quad,half,hhalf,vhalf ]],
        -- set width and height dynamically
        width = term_size.width,
        height = term_size.height,
        opts = {
          position = "center",
          hl = "String",
        },
      }
    end

    local function button(sc, txt, keybind)
      local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

      local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 5,
        width = 36,
        align_shortcut = "right",
        hl_shortcut = "Number",
        hl = "Normal",
      }

      if keybind then
        opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
      end

      return {
        type = "button",
        val = txt,
        on_press = function()
          local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
          vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
      }
    end

    local function subheader()
      local date = os.date " 󰃮 %d/%m/%Y "
      local time = os.date "  %H:%M "
      local plugins = "  " .. require("lazy.stats").stats().count .. " plugins "

      local v = vim.version()
      local version = "  v" .. v.major .. "." .. v.minor .. "." .. v.patch

      local val = date .. time .. plugins .. version

      return {
        type = "text",
        val = val,
        opts = {
          position = "center",
          hl = "Constant",
        },
      }
    end

    local function buttons()
      return {
        type = "group",
        val = {
          button("SPC n", "  New File", ":ene <BAR> startinsert <CR>"),
          button("SPC f", "  Find File", ":Telescope find_files<CR>"),
          button("SPC r", "  Recent File", ":Telescope oldfiles<CR>"),
          button("SPC w", "󰮗  Find Word", ":Telescope live_grep<CR>"),
          button("SPC g", "  Open Diff View", ":DiffviewOpen<CR>"),
          button(
            "SPC s",
            "  Open Config",
            ":cd "
              .. vim.fn.stdpath "config"
              .. "| :e ./init.lua"
              .. "| :vsplit ./lua/srv/mappings/init.lua<CR>"
          ),
          button("SPC q", "  Exit Neovim", ":qa!<CR>"),
        },
      }
    end

    require "alpha.term"

    local options = {
      header = term(),
      subheader = subheader(),
      buttons = buttons(),
      -- footer = footer(),
    }

    local config = {
      layout = {
        options.header,
        { type = "padding", val = 5 },
        options.subheader,
        { type = "padding", val = 1 },
        options.buttons,
        { type = "padding", val = 1 },
        options.footer,
      },
    }

    alpha.setup(config)
  end,
}
