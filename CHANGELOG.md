# Changelog

All notable changes to this project will be documented in this file.
See [conventional commits](https://www.conventionalcommits.org/) for commit
guidelines.
- - -

## [2.0.0](https://github.com/sRavioli/nvim/compare/1.2.2..2.0.0) - 2023-12-08

#### Bug Fixes

- **(heirline:statusline)** add support for Alacritty - ([3c222af](https://github.com/sRavioli/nvim/commit/3c222af7151ec48c876f1a8213be05c2af530dd5)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:none-ls)** use markdownlint-cli2 - ([62bdc37](https://github.com/sRavioli/nvim/commit/62bdc3775a870a34d2901fbfd70c678ec7fa8719)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** update plugins folder to use files instead of folders - ([fef9e5f](https://github.com/sRavioli/nvim/commit/fef9e5f0679a8a087b11265833cda62bcde65fad)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:autocompletion)** load lua snippet first - ([c407e67](https://github.com/sRavioli/nvim/commit/c407e67ad9ca9292d6ba36858c732ffdcfebdb21)) - [@sRavioli](https://github.com/sRavioli)
- **(selene)** lower undefined_variable to warn - ([7492078](https://github.com/sRavioli/nvim/commit/7492078f9522b0e30b800d73a400afd90aa373ec)) - [@sRavioli](https://github.com/sRavioli)
- **(skel)** update .markdownlint.jsonc - ([d83c962](https://github.com/sRavioli/nvim/commit/d83c962834564442ac6d246277c0b40c5b0ed38e)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:events)** rename to events, move functions - ([096dde8](https://github.com/sRavioli/nvim/commit/096dde8134d426353f261b562aa5332270230ed5)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:fn)** update async format function - ([94dc76b](https://github.com/sRavioli/nvim/commit/94dc76b6894d8017d89b4150411e5d314c0ae44f)) - [@sRavioli](https://github.com/sRavioli)
- move to `./fun/` folder - ([5cd2c48](https://github.com/sRavioli/nvim/commit/5cd2c48f38cf06a9ac9146a3695d328a13aacbc2)) - [@sRavioli](https://github.com/sRavioli)
- remove table.unpack - ([b0d68a4](https://github.com/sRavioli/nvim/commit/b0d68a4caf3d31e668510f1946c5b61426f96168)) - [@sRavioli](https://github.com/sRavioli)
- require new plugin file, use correct keymaps loading func - ([ab392be](https://github.com/sRavioli/nvim/commit/ab392be02099573e2b3c0973b697e7288868fcd3)) - [@sRavioli](https://github.com/sRavioli)
- update events require, add filetypes for q close - ([74bdb0a](https://github.com/sRavioli/nvim/commit/74bdb0a5fabcce7c500e7114b3940e4d1cf271fa)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(config:autocommands)** set xml filetype for xaml - ([39ff87b](https://github.com/sRavioli/nvim/commit/39ff87bc9ec2567ab7341330e7101a3251834fe2)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** move lazy configuration - ([7f6b326](https://github.com/sRavioli/nvim/commit/7f6b32669b1416438edce0360ae1da03bbd3d894)) - [@sRavioli](https://github.com/sRavioli)
- **(snippets)** add more markdown snippets - ([8dcf715](https://github.com/sRavioli/nvim/commit/8dcf715a75e5e92525a6b59646eb12fc9968cfa0)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:fun)** change, filename && move functions to separate file - ([aab19c8](https://github.com/sRavioli/nvim/commit/aab19c88f74c8445083dbd6319f75d835dc7e7ca)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(lazy)** update `lazy-lock.json` - ([3a80174](https://github.com/sRavioli/nvim/commit/3a80174c0801022c1e06fa64d2ee101b6f08fd35)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update`lazy-lock.json` - ([6a245de](https://github.com/sRavioli/nvim/commit/6a245de93bcacc3f7c8d1a2fc46c2f712a748e3c)) - [@sRavioli](https://github.com/sRavioli)

#### Style

- add blank line to end of gile - ([7bf0351](https://github.com/sRavioli/nvim/commit/7bf03511ad756495a013e3939be0ff5940badc32)) - [@sRavioli](https://github.com/sRavioli)
- add blank line to end of gile - ([442886e](https://github.com/sRavioli/nvim/commit/442886ef5b699c632bdaba7601fee9d446d34e26)) - [@sRavioli](https://github.com/sRavioli)
- add blank line to end of file - ([b363a9a](https://github.com/sRavioli/nvim/commit/b363a9a978f5bd5a37de83b6cd7a9bff941db26a)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [1.2.2](https://github.com/sRavioli/nvim/compare/1.2.1..1.2.2) - 2023-12-03

#### Bug Fixes

- **(heirline:statusline)** use correct color name - ([2c665b8](https://github.com/sRavioli/nvim/commit/2c665b84d8dc259136c94f3e0ecc887d2ebb29c5)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ft)** apply custom glow style - ([1bedca8](https://github.com/sRavioli/nvim/commit/1bedca8eadd18fb266de45252ab122203962fd3d)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ft)** load `vim-pencil` only on command - ([95c9854](https://github.com/sRavioli/nvim/commit/95c9854564c90ad27c0c7da33e83b024c5910427)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** set shell outside toggleterm - ([1c4de88](https://github.com/sRavioli/nvim/commit/1c4de88c0e8420bf4a2df6aa7ff234fd6c50557c)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** disable terminal shading - ([74e5c51](https://github.com/sRavioli/nvim/commit/74e5c51db30bd64972ae2fc6be4ec769a949c25e)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:fn)** remove mapping related functions - ([d45799a](https://github.com/sRavioli/nvim/commit/d45799ada9dcef1945e6d80609bc402d89c51a1b)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(config:autocommands)** use new update_timestamp function - ([3fcd375](https://github.com/sRavioli/nvim/commit/3fcd375bcb02c443c7c72feb6ced50a889162c34)) - [@sRavioli](https://github.com/sRavioli)
- **(config:settings)** change shell to pwsh - ([25131e6](https://github.com/sRavioli/nvim/commit/25131e64008b1ba5151843844e67984c6d11eea9)) - [@sRavioli](https://github.com/sRavioli)
- **(heirline:statusline)** use load_colors() for heirline - ([c819312](https://github.com/sRavioli/nvim/commit/c819312e1b0c773df80bd27c2aa440aa63f28212)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:fun)** add more utility functions - ([d65bc0a](https://github.com/sRavioli/nvim/commit/d65bc0a39bd03f7f02c1732612145ad997456a25)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(lazy)** update`lazy-lock.json` - ([00d4991](https://github.com/sRavioli/nvim/commit/00d4991e472668711a8da1268e63772d16d307ad)) - [@sRavioli](https://github.com/sRavioli)

#### Style

- **(heirline:statusline)** add spacing - ([4a738a3](https://github.com/sRavioli/nvim/commit/4a738a39a845850bccb953a98ee3d44718ef54a2)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [1.2.1](https://github.com/sRavioli/nvim/compare/1.2.0..1.2.1) - 2023-11-29

#### Bug Fixes

- **(config:settings)** clean up commented out code - ([635c640](https://github.com/sRavioli/nvim/commit/635c6400529f77f54e969531d4bd473d8bb0ff1b)) - [@sRavioli](https://github.com/sRavioli)
- **(fun:providers)** check path before normalizing - ([44dd0a7](https://github.com/sRavioli/nvim/commit/44dd0a7621bf0f895d9b89ab34a02a64ff3345ba)) - [@sRavioli](https://github.com/sRavioli)
- **(fun:providers)** add nil check for provider paths - ([c1fde56](https://github.com/sRavioli/nvim/commit/c1fde560d4cdc01aa8c32b2cf2e96a86b5dcab16)) - [@sRavioli](https://github.com/sRavioli)
- **(heirline:statusline)** change unix icon color, account for nvim-0.10 only func - ([105b4d9](https://github.com/sRavioli/nvim/commit/105b4d98183ea8f9c880e9e561973e36c2436ba0)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:pre)** disable conform.nvim - ([92c860a](https://github.com/sRavioli/nvim/commit/92c860a92aa2134006281b2b371e86bf157d5e34)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ft)** load `vim-ditto` only on cmd - ([f38d8a3](https://github.com/sRavioli/nvim/commit/f38d8a30b1d055578a36fbc81f450c06070241cc)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:treesitter)** change treesitter hover border - ([d59e0c5](https://github.com/sRavioli/nvim/commit/d59e0c5b34f0b3cfae2b5561b7d3dc3a5e544ba7)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** load dropbar only if vim version is >= 0.10.0 - ([df88df2](https://github.com/sRavioli/nvim/commit/df88df27d7247a3800ab7f43b2f63a7c28919f15)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(config:settings)** set localleader key - ([375e777](https://github.com/sRavioli/nvim/commit/375e7775bb3f12748041ed2c7b33a2c3c8686104)) - [@sRavioli](https://github.com/sRavioli)
- **(config:settings)** use fun.providers.enable() - ([d71e1b1](https://github.com/sRavioli/nvim/commit/d71e1b1e8b7a5c8bee37fbfbd29902b7be9e790a)) - [@sRavioli](https://github.com/sRavioli)
- **(heirline:statusline)** update heirline statusline - ([6e1b985](https://github.com/sRavioli/nvim/commit/6e1b98538a561f19a8f9e91dfeb0b126958ac296)) - [@sRavioli](https://github.com/sRavioli)
- **(heirline:statusline)** add search result in terminal statusbar - ([858269d](https://github.com/sRavioli/nvim/commit/858269d03be689f7926d2447b14ff59e64362eed)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:fun)** create new file for functions, add providers utils - ([892a309](https://github.com/sRavioli/nvim/commit/892a30933fdc256772d29326c6f7967e875a2e43)) - [@sRavioli](https://github.com/sRavioli)

#### Hotfixes

- **(heirline)** correctly obtain lsp server list - ([fc4a5cb](https://github.com/sRavioli/nvim/commit/fc4a5cbd92078bebb3a6f709c98b4c4e5dd4e82e)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(lazy)** update`lazy-lock.json` - ([626172f](https://github.com/sRavioli/nvim/commit/626172f7fd26547228f9584de8289743c1a98265)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update`lazy-lock.json` - ([9f74121](https://github.com/sRavioli/nvim/commit/9f74121e678d6fe9ac81983f922f56ba64528385)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update`lazy-lock.json` - ([2615fee](https://github.com/sRavioli/nvim/commit/2615fee6af3daeb4303d094c55bcfc110362988a)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [1.2.0](https://github.com/sRavioli/nvim/compare/1.1.0..1.2.0) - 2023-11-27

#### Bug Fixes

- **(github)** typo on workflow - ([3f2b2d0](https://github.com/sRavioli/nvim/commit/3f2b2d08abbb79b9ec5f15d201e7c69541d8403b)) - [@sRavioli](https://github.com/sRavioli)
- **(heirline:statusline)** move lazy update notification before lsp info - ([cd2f432](https://github.com/sRavioli/nvim/commit/cd2f4329e1c33734b43b9f68916dca5fca4a8bc0)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:pre)** log file search as trace - ([93ddf77](https://github.com/sRavioli/nvim/commit/93ddf77523fbf4c90d13196b6d5e98a995418435)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(config:settings)** change messages language to en - ([d8d43ca](https://github.com/sRavioli/nvim/commit/d8d43ca4108c35c5c9924f8a6f061ee82d917a36)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:pre)** install `conform.nvim` - ([ae0278d](https://github.com/sRavioli/nvim/commit/ae0278d193a1ec24d8427b799cdd46d4c7d4c50e)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:servers)** enable all type hints for `lua_ls` - ([6f6a7d1](https://github.com/sRavioli/nvim/commit/6f6a7d1b93af228cbb5c890e153197446fd84c2e)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings)** add lsp keymap description - ([7031c39](https://github.com/sRavioli/nvim/commit/7031c39c332af08108a2277da0f478a7c83d0fcc)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** change heirline utils require call - ([9fd9bd2](https://github.com/sRavioli/nvim/commit/9fd9bd2321edca7f248e00b3b8df6797086ab625)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add init to utils - ([3e432c2](https://github.com/sRavioli/nvim/commit/3e432c23482802bbc02026dd15eb3eb5f6d00ea7)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:event)** add class comment - ([d443911](https://github.com/sRavioli/nvim/commit/d443911c03fdc6aaa082494ff41c5c3002e33588)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:heirline)** add heirline init - ([2673ebe](https://github.com/sRavioli/nvim/commit/2673ebe5acfe7a736e4aab7ca7c56ae8f3ad276a)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:telescope)** add telescope utils - ([f3dc097](https://github.com/sRavioli/nvim/commit/f3dc097b459c3e233c7a065feb51462000b85003)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(lazy)** update`lazy-lock.json` - ([da4e2f0](https://github.com/sRavioli/nvim/commit/da4e2f01c1a5a52df4a35d1229336c9574763957)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update`lazy-lock.json` - ([d05eb96](https://github.com/sRavioli/nvim/commit/d05eb962f32b902751f7480449b19968014a4cbb)) - [@sRavioli](https://github.com/sRavioli)

#### Style

- **(plugins:ui)** reformat telescope config - ([d79cdda](https://github.com/sRavioli/nvim/commit/d79cdda1bc8542c70757613826d016e3f3ae3703)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [1.1.0](https://github.com/sRavioli/nvim/compare/1.0.0..1.1.0) - 2023-11-27

#### Bug Fixes

- **(config:settings)** set global statusline and foldmethod - ([77ae5aa](https://github.com/sRavioli/nvim/commit/77ae5aa0dcee0126b49cc483114a4b330732e57b)) - [@sRavioli](https://github.com/sRavioli)
- **(init.lua)** use plain load() - ([e57720b](https://github.com/sRavioli/nvim/commit/e57720bb46bda3bf3ed1a16c1f31b5deda10f51e)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:post)** collapse lspsaga winbar config table - ([a120566](https://github.com/sRavioli/nvim/commit/a12056648263c062389500ef8b0467ae7edbdeb7)) - [@sRavioli](https://github.com/sRavioli)
- **(lspconfig)** move server config import near when is used - ([4354d8d](https://github.com/sRavioli/nvim/commit/4354d8d0e4e49edf63d10dbb7b08862fdc3775aa)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings)** enclose mappings in functions - ([9ef949f](https://github.com/sRavioli/nvim/commit/9ef949fc81a83e962c4e7b542267bb08179c86a0)) - [@sRavioli](https://github.com/sRavioli)
- **(plugin:ui)** use closures for spectre keymaps - ([11c3000](https://github.com/sRavioli/nvim/commit/11c3000bdbecc34571fd695b28d0a77f33ef9037)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ft)** remove selene ignore - ([7d2961d](https://github.com/sRavioli/nvim/commit/7d2961db6c4c943ee4c624ae57afd894d4a79859)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ft)** disable `vim-pencil` - ([2dce711](https://github.com/sRavioli/nvim/commit/2dce7114dc16bf51bb5243344b2468216cafd0a0)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:lsp)** use default options for `neodev.nvim` - ([1a9a046](https://github.com/sRavioli/nvim/commit/1a9a0461fc6233aae790b0386e1511c7c9191158)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:motions)** remove selene ignore - ([5b5aec3](https://github.com/sRavioli/nvim/commit/5b5aec324f1dbf56b2569106810441ac303e1e60)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** uninstall `lualine` - ([01dbdbc](https://github.com/sRavioli/nvim/commit/01dbdbcf10bad8a6493d09883d4c29274c678013)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** disable `nvim-ufo` - ([c5ebbcc](https://github.com/sRavioli/nvim/commit/c5ebbcce8b74627d0388c1801a04f33136b4c279)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** remove selene ignore - ([764496c](https://github.com/sRavioli/nvim/commit/764496c77f336377f417ca5e2d8e5d0f4813a72f)) - [@sRavioli](https://github.com/sRavioli)
- **(treesitter)** merge treesitter and treesitter-textobj config - ([37541cf](https://github.com/sRavioli/nvim/commit/37541cfc4be9f42bd289fea18e7103b6711365ae)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:heirline)** remove scrollbar - ([cbbf9ce](https://github.com/sRavioli/nvim/commit/cbbf9ce18309487a77efe340fb35089fbfbbd381)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:nvim-tree)** disable float-preview by default - ([1b45932](https://github.com/sRavioli/nvim/commit/1b459326187c8f4f2b6dc248c2bd38fd74be1d13)) - [@sRavioli](https://github.com/sRavioli)

#### Documentation

- **(utils:fn)** use lua-ls syntax for comments - ([b422f6f](https://github.com/sRavioli/nvim/commit/b422f6fd9b6de2cf659ba03fd2e86f84b11a4a7e)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(mappings)** open folds when searching with hls-lens - ([15b9a30](https://github.com/sRavioli/nvim/commit/15b9a3049e7e8cef068a960cd9dbb79a46579685)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** add heirline config, hide statusline until load - ([17b5b9f](https://github.com/sRavioli/nvim/commit/17b5b9fac3477956920d8c6ce3e2ace75883e4c8)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** lazy load `which-key` on keymaps - ([3df48f5](https://github.com/sRavioli/nvim/commit/3df48f595c7583155bc3daf1e6975b30fe4427e8)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** load kanagawa with lua - ([18b1592](https://github.com/sRavioli/nvim/commit/18b15921d89353c48a63a15f903305194d59f572)) - [@sRavioli](https://github.com/sRavioli)
- **(selene)** allow `mixed_table` - ([6627c11](https://github.com/sRavioli/nvim/commit/6627c119dda924afd2c8fc1b0fc6c9c2ab165692)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:heirline)** add heirline configuration - ([4529734](https://github.com/sRavioli/nvim/commit/4529734c264da52a6f217ca31b0d0e86b8445615)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(cog)** format with taplo - ([9043e47](https://github.com/sRavioli/nvim/commit/9043e47d6171e97093e046f329ad0b9e05f8c779)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update`lazy-lock.json` - ([045f3bb](https://github.com/sRavioli/nvim/commit/045f3bb8bd57f73dbec16933ceb3349ae5ea1a79)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [1.0.0](https://github.com/sRavioli/nvim/compare/0.15.0..1.0.0) - 2023-11-22

#### Bug Fixes

- **(colorscheme)** disable DroBar ovverides - ([13a5f5d](https://github.com/sRavioli/nvim/commit/13a5f5d2744f65cfb3169a5646ec8a5cbb958f58)) - [@sRavioli](https://github.com/sRavioli)
- **(colorschemes)** remove `tokyo-night` (not gonna use) - ([54379f8](https://github.com/sRavioli/nvim/commit/54379f853e57486d2b8410fce69e8d7a5f122d9d)) - [@sRavioli](https://github.com/sRavioli)
- **(colorschemes:kanagawa)** move kanagawa to ui folder - ([4189b6b](https://github.com/sRavioli/nvim/commit/4189b6b3399611b858644b4c10d6627a3e189922)) - [@sRavioli](https://github.com/sRavioli)
- **(config:autocommands)** move augroups in autocommands, remove unused autocommands - ([a34187c](https://github.com/sRavioli/nvim/commit/a34187c6fc7bcee2eabacd2e7330e6db84dffce8)) - [@sRavioli](https://github.com/sRavioli)
- **(config:settings)** remove foldmethod - ([3929970](https://github.com/sRavioli/nvim/commit/3929970323d6daa9ef3ddcf8c52ab4c893f01616)) - [@sRavioli](https://github.com/sRavioli)
- **(config:settings)** use `os.getenv` for paths - ([e40049d](https://github.com/sRavioli/nvim/commit/e40049d11455a909e388ccf27bd35b8eb03bbc0f)) - [@sRavioli](https://github.com/sRavioli)
- **(config:settings)** remove comments from settings - ([a9e37bb](https://github.com/sRavioli/nvim/commit/a9e37bbbaf018e72b7d6334c2139ec129f2ee74a)) - [@sRavioli](https://github.com/sRavioli)
- **(init.lua)** only load `nvim` keymaps on enter to improve performance - ([24f13db](https://github.com/sRavioli/nvim/commit/24f13db31424a557595d6c2be98162c54b0f8018)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** move general config to `lspconfig` - ([c1a2403](https://github.com/sRavioli/nvim/commit/c1a2403bca56da57a16af74c912e3dadbe96eb36)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** move lspconfig to its file - ([01437b8](https://github.com/sRavioli/nvim/commit/01437b843955618d9cfcfff5a962ac57d6f897b1)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:lspconfig)** move `lspconfig` to a single file - ([0c159ed](https://github.com/sRavioli/nvim/commit/0c159ed8c98de13623fcc281ba6661a212715ca0)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:post)** disable `ufo`, chenge provider selector - ([626a7f8](https://github.com/sRavioli/nvim/commit/626a7f86fa548f7da4c790bb2ddc60e5e9bc358c)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:post)** disable `lspsaga` winbar - ([8cd5bd9](https://github.com/sRavioli/nvim/commit/8cd5bd921b337cc70c97312517327285a9d90248)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:post)** uninstall `lsp-progress` - ([c82ddab](https://github.com/sRavioli/nvim/commit/c82ddab6e8a814f5e9f69b4536c22f9800eed48d)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:pre)** change lazy event handler for `none-ls` - ([c687ff3](https://github.com/sRavioli/nvim/commit/c687ff3dab52da74b0d8c29f11fb898537dff200)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings)** put ufo mappings in a closure - ([03fa3ef](https://github.com/sRavioli/nvim/commit/03fa3ef8943481a80432a9ca62305c1d3224e25b)) - [@sRavioli](https://github.com/sRavioli)
- **(plugin:ui)** remove `lsp-progress` from lualine - ([daa1c79](https://github.com/sRavioli/nvim/commit/daa1c79a0d6ff6088d1186aa58210765541b0edc)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ft)** uninstall `follow-md-links`, change `pencil` config - ([4178149](https://github.com/sRavioli/nvim/commit/4178149795c6c68025083f966444b92b1359c8b6)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ft)** do not automatically load `vim-pencil` - ([eb0cf9c](https://github.com/sRavioli/nvim/commit/eb0cf9c938d26d927a1b47bf1d06b6e02380fa96)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:init.lua)** remove plugin spec - ([e0bfa87](https://github.com/sRavioli/nvim/commit/e0bfa87e04fef04e07c690e2390c1f6365b5a9d3)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:motions)** require `on_load` from correct file - ([eb747f5](https://github.com/sRavioli/nvim/commit/eb747f50d0da425018e343e2abfc9767ccb6d7bc)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:motions)** lazy load `comment.nvim` on LazyFile event - ([a176022](https://github.com/sRavioli/nvim/commit/a176022a90854070ad58ada88c116832aa591693)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:motions)** lazy load `vim-repeat` on keymap - ([b5ee05f](https://github.com/sRavioli/nvim/commit/b5ee05f958df06ab001b3ce507c9eea1d5ce9ad0)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:treesitter)** change load event for treesitter - ([ab49d5f](https://github.com/sRavioli/nvim/commit/ab49d5f29751e0887faaab7ad6ade108a49e9efc)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** lazy load `notify` on VeryLazy, delay notifications - ([649cb74](https://github.com/sRavioli/nvim/commit/649cb7428f416996689ea720d9f6e3d5ef851805)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** improve startup by loading `lualine` on VeryLazy - ([de66701](https://github.com/sRavioli/nvim/commit/de66701f162be1492fbda3486567e7eb6ae42fe4)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** lazy load plugins on LazyFile - ([0a2b113](https://github.com/sRavioli/nvim/commit/0a2b11368936d9f5ee41f6499aa539a37ad7d422)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** temporary fix for telescope `find_files` - ([d2a865f](https://github.com/sRavioli/nvim/commit/d2a865f88726bf6ba3fcaeaa885aed64547b1c95)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** change lazy event handler - ([d282c0a](https://github.com/sRavioli/nvim/commit/d282c0a2bd4c2f4a047966244f30130b6732be7a)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:duck)** don't safe require `nvim-notify` use the builtin one - ([4fe591b](https://github.com/sRavioli/nvim/commit/4fe591b4f85d37dc3aed27b82e3a76c57ed146f2)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:fn)** change null-ls augroup - ([d45d7aa](https://github.com/sRavioli/nvim/commit/d45d7aafbba7a0e560cebe4d9572cca6d748f392)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:fun)** remove `lsp-notify` - ([08f7aed](https://github.com/sRavioli/nvim/commit/08f7aedc38e2d191b0576a6f53ef1262ea118760)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:keymaps)** use builtin `vim.notify` - ([22bc93b](https://github.com/sRavioli/nvim/commit/22bc93bddbc1c4da157794525ae2fccd74edb9ce)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:nvim-tree)** remove empty file - ([8bf88db](https://github.com/sRavioli/nvim/commit/8bf88db2a3b99fffdb301ea8e6b0f357c4999512)) - [@sRavioli](https://github.com/sRavioli)
- move `nvim-ufo` to ui folder - ([e79768a](https://github.com/sRavioli/nvim/commit/e79768abc5b76338a8dd68c0109025b6ba2fd85f)) - [@sRavioli](https://github.com/sRavioli)
- move code-action-menu mapping to lazy key handler - ([f1241e6](https://github.com/sRavioli/nvim/commit/f1241e63d71342662e27865ab43804cce8d0d039)) - [@sRavioli](https://github.com/sRavioli)
- correctly lazy load gitsigns - ([09afcf0](https://github.com/sRavioli/nvim/commit/09afcf01bd6fec7bc70c58796408085d4812ca5f)) - [@sRavioli](https://github.com/sRavioli)
- override `vim.notify` on UiEnter - ([8938878](https://github.com/sRavioli/nvim/commit/8938878f23ccdd47811e712461ff8ad3397f8af2)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(config:settings)** update settings - ([5432e03](https://github.com/sRavioli/nvim/commit/5432e0324de3dce525aefa8966756be268a27801)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** configure the lua language server - ([07aeedc](https://github.com/sRavioli/nvim/commit/07aeedc6a9359c89d3a3ce3a4fccc6b8b16cf41c)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp:lspconfig)** install `fidget.nvim` and `diagflow.nvim` - ([0964afa](https://github.com/sRavioli/nvim/commit/0964afa3671f00e399b6d3b7b6f76da716415488)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings)** add mapping to open lazy - ([cd69bf8](https://github.com/sRavioli/nvim/commit/cd69bf89947ca78fa89ab6510c485556006529b3)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings)** add `nvim-ufo` mappings - ([df3c373](https://github.com/sRavioli/nvim/commit/df3c373069e8783b72c28aaf4854593ebc251bee)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings:lsp)** add keymap to toggle inlay hints - ([a27d857](https://github.com/sRavioli/nvim/commit/a27d8572883220d7dcf241d805e215c97c85ddd9)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:lsp)** use notify as a progress handler - ([45e90f1](https://github.com/sRavioli/nvim/commit/45e90f1ceb9cf37f5e385ab8b26a479240117be9)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:motions)** lazy load `nvim-surround` on keymap, uninstall ui - ([ae1b975](https://github.com/sRavioli/nvim/commit/ae1b9758edfa82696c47885a1375f24cc22f382e)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:motions)** better lazy loading for `vim-abolish` - ([68f5c92](https://github.com/sRavioli/nvim/commit/68f5c926fa99c381b883823275e4d20a843b5aa8)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** install `heirline` - ([9d0067d](https://github.com/sRavioli/nvim/commit/9d0067d2c4e64b0367633135ce6e1062c8c0d65a)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** move `dressing` config to separate file - ([52a7470](https://github.com/sRavioli/nvim/commit/52a7470ffc60ea1a40b67e2423013e2e2c6f49b8)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** add `nvim-tree` lazy cmd handlers - ([ab04d26](https://github.com/sRavioli/nvim/commit/ab04d26199a18b2bbee18758b6e9f0e655038e74)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** configure `dropbar` - ([7a48399](https://github.com/sRavioli/nvim/commit/7a48399a23f4d4697626f7cca90cf2c60a121023)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** lazy load `nvim-tree`, open file on creation - ([e41e213](https://github.com/sRavioli/nvim/commit/e41e2134684e8d40597d19ea1910988b47e56250)) - [@sRavioli](https://github.com/sRavioli)
- **(preferences)** add a bunch of new icon kinds - ([3922e00](https://github.com/sRavioli/nvim/commit/3922e00b4c3f35abff375bc77cd2578ca6af1918)) - [@sRavioli](https://github.com/sRavioli)
- **(preferences)** add fira code spinner and progress bar - ([d4b0b3c](https://github.com/sRavioli/nvim/commit/d4b0b3ca81cac33abff198baa40842fc8248913d)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add notify lsp progress tracker - ([0d9b0fc](https://github.com/sRavioli/nvim/commit/0d9b0fce0ca053f7ecc2dca9d412bd909513c717)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:event)** implement `on_very_lazy` function - ([1f0c528](https://github.com/sRavioli/nvim/commit/1f0c5283765490da76a364001db4ee2630f69eef)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:event)** add event related function, add event groups - ([da58352](https://github.com/sRavioli/nvim/commit/da58352961997a569a9e0acc340b4940cd13f348)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:fn)** add function to delay notifications - ([17d3baa](https://github.com/sRavioli/nvim/commit/17d3baa9beb2c3bb4b85f04f304da4601370fb1a)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:fun)** remove `fun` folder - ([ee53a1e](https://github.com/sRavioli/nvim/commit/ee53a1e48aedf2b0ca9ffb954c24db3e10501985)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:lsp)** add some lsp utilities - ([4df6b11](https://github.com/sRavioli/nvim/commit/4df6b113c23597af38e0807970a43a33e211064c)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(lazy)** update`lazy-lock.json` - ([1df92c2](https://github.com/sRavioli/nvim/commit/1df92c20cabee6987515c9e298cb1221a958827f)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update`lazy-lock.json` - ([fb4cb6d](https://github.com/sRavioli/nvim/commit/fb4cb6dc5f7b31d1e800d131fa3795505bdeeee7)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update`lazy-lock.json` - ([c049550](https://github.com/sRavioli/nvim/commit/c049550c7ce57ad22242714e31ca1c402303d482)) - [@sRavioli](https://github.com/sRavioli)

#### Style

- **(lsp:post)** remove commented out lines - ([a5a1ae3](https://github.com/sRavioli/nvim/commit/a5a1ae35e51e43111b843903d8d3d3df88eb2403)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:motions)** remove linter warnings - ([6654377](https://github.com/sRavioli/nvim/commit/66543778f71846cf8c33883db5132bbb537d7b01)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** inline table for `hls-lens` config - ([8492187](https://github.com/sRavioli/nvim/commit/84921875562607f9f3deb9151c5b67d8241a3f18)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.15.0](https://github.com/sRavioli/nvim/compare/0.14.0..0.15.0) - 2023-11-18

#### Bug Fixes

- **(config)** change some augroups name, remove autocmds - ([859110d](https://github.com/sRavioli/nvim/commit/859110d27a285d1c3f15602682d73234eb27a2b9)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:lsp)** remove nvchad types from lua stdpath - ([6444755](https://github.com/sRavioli/nvim/commit/6444755891707903c0f74af7249cc488e57bf38f)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:lsp)** use `vim.notify` instead of `print` - ([2699da6](https://github.com/sRavioli/nvim/commit/2699da6b736c184b540cc41a1173b8f6a39b0e16)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:lsp)** add fixjson intent width - ([943473d](https://github.com/sRavioli/nvim/commit/943473d6ed8682c539e01b4eb6899078e643c6bc)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** don't let `nvim-tree` hijack unnamed buffers - ([53236d9](https://github.com/sRavioli/nvim/commit/53236d96e26ecd694200e17d3a0e739bc073ae2f)) - [@sRavioli](https://github.com/sRavioli)
- **(skel:markdownlint)** allow any heading - ([2b51b07](https://github.com/sRavioli/nvim/commit/2b51b0777b27fe2e2941352b67067547ad96ac21)) - [@sRavioli](https://github.com/sRavioli)
- **(syntax)** typo - ([7f0db29](https://github.com/sRavioli/nvim/commit/7f0db29cac9d3dd800b74aa28db69003b25a3100)) - [@sRavioli](https://github.com/sRavioli)
- use `./skel/.stylua.toml` instead - ([66784a5](https://github.com/sRavioli/nvim/commit/66784a55f3af5570b057f1a69a07ff979f2f3422)) - [@sRavioli](https://github.com/sRavioli)

#### Documentation

- **(skel:clang-format)** reduce comments size - ([4d27038](https://github.com/sRavioli/nvim/commit/4d270380a7e8b2292277a1a8b97e57257c7d45d4)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(cog)** track changelog after format - ([3c5a099](https://github.com/sRavioli/nvim/commit/3c5a099209316ffb7df5059fb88ddeb0e25f66ee)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings:nvim)** add mapping to select last pasted text - ([ea7a893](https://github.com/sRavioli/nvim/commit/ea7a893f7fc205934affec67a0544fb975a9933d)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:lsp)** customize `lsp-lens` icons - ([e6b62af](https://github.com/sRavioli/nvim/commit/e6b62af4051b3c5b82b2ce6745b38da03d95eeaa)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:lsp)** add none-ls luacheck diagnostics - ([ef9df0e](https://github.com/sRavioli/nvim/commit/ef9df0e0ee695b9a214c12bce51008f8ede88ad9)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:lsp)** configure null-ls sources to use fallback `./skel/` files - ([d18b073](https://github.com/sRavioli/nvim/commit/d18b073566da41f4607dd6852f6fa2d61ea35b94)) - [@sRavioli](https://github.com/sRavioli)
- **(skel)** add template `.luacheckrc` - ([7b30a8f](https://github.com/sRavioli/nvim/commit/7b30a8f7debdd281bbab9630135184614673c629)) - [@sRavioli](https://github.com/sRavioli)
- **(skel)** add template `.yamlfix.toml` - ([4bf824e](https://github.com/sRavioli/nvim/commit/4bf824e5ea16989de9f99f517ee225affd7c9271)) - [@sRavioli](https://github.com/sRavioli)
- **(skel:markdownlint)** add skeleton markdownlint config - ([e96aa00](https://github.com/sRavioli/nvim/commit/e96aa002176bdf25b607a58aca31b3274f075178)) - [@sRavioli](https://github.com/sRavioli)
- **(skel:stylua)** add stylua skeleton config - ([6a1dd42](https://github.com/sRavioli/nvim/commit/6a1dd4210a7bfc0bb7d7c08697da7f28af2bc4b0)) - [@sRavioli](https://github.com/sRavioli)
- **(skel:taplo)** add skeleton taplo config - ([1c2ac27](https://github.com/sRavioli/nvim/commit/1c2ac27fb0867798b226c09aa2b0b5a85c34952b)) - [@sRavioli](https://github.com/sRavioli)
- add selene config - ([6fe3061](https://github.com/sRavioli/nvim/commit/6fe3061ecba6c893ea7900b9a76c3f2652a015a0)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(changelog)** format changelog - ([ec247f8](https://github.com/sRavioli/nvim/commit/ec247f8090147c0f3871071097dc1658621356a3)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update `lazy.nvim` lockfile - ([fda122d](https://github.com/sRavioli/nvim/commit/fda122d1440cc92678b9af80cb83f6fa702cbad9)) - [@sRavioli](https://github.com/sRavioli)

#### Style

- **(skel)** fix formatting - ([dca5e07](https://github.com/sRavioli/nvim/commit/dca5e07ac465177b1b0ed4ca7cd9178a60ede40b)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:keymaps)** remove commented out code - ([00c036f](https://github.com/sRavioli/nvim/commit/00c036f8ace856fcd2920e00d6646f4671846865)) - [@sRavioli](https://github.com/sRavioli)
- format with stylua - ([a820491](https://github.com/sRavioli/nvim/commit/a8204919130f20c554d428945061318c9c53aca2)) - [@sRavioli](https://github.com/sRavioli)
- format with stylua - ([0bbe630](https://github.com/sRavioli/nvim/commit/0bbe6307c00da9c68770583d216f2c7a5867b4ff)) - [@sRavioli](https://github.com/sRavioli)
- fix linter warnings - ([7a27d8d](https://github.com/sRavioli/nvim/commit/7a27d8d0a2853a077685ef8077c3a932ca95fb71)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.14.0](https://github.com/sRavioli/nvim/compare/0.13.0..0.14.0) - 2023-11-15

#### Bug Fixes

- **(colorschemes:kanagawa)** disable transparency, update add `keywordStyle` - ([ceb6162](https://github.com/sRavioli/nvim/commit/ceb6162040d8d8ed49fcf84ffc1ff6fc2730844b)) - [@sRavioli](https://github.com/sRavioli)
- **(config:neovide)** add fallback font, reduce linespace - ([e256f92](https://github.com/sRavioli/nvim/commit/e256f92afb67037d0bf3682a87828038ad0d4805)) - [@sRavioli](https://github.com/sRavioli)
- **(gitignore)** track `lazy-lock.json` - ([ed3351f](https://github.com/sRavioli/nvim/commit/ed3351f650c0ac98f1ce8ac938bf5c37a55837c9)) - [@sRavioli](https://github.com/sRavioli)
- **(plugin:lsp)** `null-ls` -> `none-ls` - ([1326764](https://github.com/sRavioli/nvim/commit/13267649b9944a334d2ab602bf30d263c693a4cd)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ft)** disable `vim-ditto` on Glow preview and change float dimensions - ([a3324de](https://github.com/sRavioli/nvim/commit/a3324de1c975fefa4cf34e2e091fd41ea3ef6341)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ft)** change `vim-ditto` mapping prefix - ([7c9fbe4](https://github.com/sRavioli/nvim/commit/7c9fbe41892004b70a3e925dcaee6063381bb30a)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:lsp)** prefer `lazy.nvim` syntax for `lsp-progress` config - ([a487944](https://github.com/sRavioli/nvim/commit/a48794469acf3f8a2ddc2b38b0c93e1794f5a207)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:motions)** lazy load telescope refactoring - ([7bc4fd7](https://github.com/sRavioli/nvim/commit/7bc4fd7c0a8150374ac16885ca72c3171efa7afd)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** uninstall `neo-tree` - ([ee13d99](https://github.com/sRavioli/nvim/commit/ee13d997b61f636fe860b180db6948acd7cb2e8d)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** use `vim.opt.<name>:get()` to obtain width and height for toggleterm - ([a51434b](https://github.com/sRavioli/nvim/commit/a51434bf12bbaecc7cbc39473fb9f7421714a995)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** remove unsupported telescope `layout_config` option - ([cf8d055](https://github.com/sRavioli/nvim/commit/cf8d055d86509b644e6251c2af5b96f5e83de891)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** change telescope config, lazy load fzf sorter - ([68179e4](https://github.com/sRavioli/nvim/commit/68179e4e3980845cf9e3d6c3d61fc42dee915072)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** display only nerd font v3 icons for `icon-picker` - ([12436dc](https://github.com/sRavioli/nvim/commit/12436dc026e620c5755e2499a5f71adc46196180)) - [@sRavioli](https://github.com/sRavioli)
- **(snippets)** remove `tex` snippets - ([cf6ce9a](https://github.com/sRavioli/nvim/commit/cf6ce9af5c14f0e46f8d82cc852552cd8c016fe9)) - [@sRavioli](https://github.com/sRavioli)
- **(syntax)** typo - ([192fdab](https://github.com/sRavioli/nvim/commit/192fdab17549886225ebce116fa5bb942a544868)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:nvim-tree)** remove unused functions - ([f547a96](https://github.com/sRavioli/nvim/commit/f547a96735024f43fed13e79f3b8204f178e24e6)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:nvim-tree)** disable linter warnings - ([49231fb](https://github.com/sRavioli/nvim/commit/49231fbda4b01064cc06091d9b10a79c7c0983c1)) - [@sRavioli](https://github.com/sRavioli)

#### Documentation

- **(plugins:ui)** adjust comments for neo-tree - ([a4daf1f](https://github.com/sRavioli/nvim/commit/a4daf1f7090bb24d19ddc9e131ee70869f7c8fcf)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:duck)** add documentation to `duck` - ([bea18b9](https://github.com/sRavioli/nvim/commit/bea18b9a47f0aaaf35aac8f49fb824d76827e3ec)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(colorschemes:kanagawa)** link `nvim-tree` highlights - ([565fa28](https://github.com/sRavioli/nvim/commit/565fa2862fbf5cf00bb6155d651326710b5951af)) - [@sRavioli](https://github.com/sRavioli)
- **(config:augroups)** add autogroup for vimhelp files - ([f94edae](https://github.com/sRavioli/nvim/commit/f94edaefb5bb2e54197ad5aa46c426a5fa73dc78)) - [@sRavioli](https://github.com/sRavioli)
- **(config:autocommands)** load `nvim-notify` on UiEnter, remap keys in vimhelp - ([2e7cdb4](https://github.com/sRavioli/nvim/commit/2e7cdb4fc665a794d5654112210f5b6ef1c6618e)) - [@sRavioli](https://github.com/sRavioli)
- **(config:settings)** disable netrw - ([c0da5cd](https://github.com/sRavioli/nvim/commit/c0da5cd9de7bd3aa80df4f76d12e8352d15ffb02)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** track `lazy-lock.json` - ([53d7a6c](https://github.com/sRavioli/nvim/commit/53d7a6cf4bff123a3307fb986aaed3afae04de05)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ft)** load ditto on text files - ([54d64d1](https://github.com/sRavioli/nvim/commit/54d64d1ea9f9cd292ae2b8506f5a72f27a1eace6)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:motions)** add `nvim-toggler` toggle pair - ([d312c6b](https://github.com/sRavioli/nvim/commit/d312c6bfd71c3a588f9dc865f9f25a981f397533)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** add `dressing.nvim` dependency for `nvim-tree`, add lazy maps - ([dd40fcd](https://github.com/sRavioli/nvim/commit/dd40fcd75819e3e4841d0a2348de5495830a09a7)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** adapt to new `float-preview` on_attach, load default mappings for `nvim-tree` - ([056d9bd](https://github.com/sRavioli/nvim/commit/056d9bd6a07c87c912dc76f2c309678c5badae73)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** register `vim-ditto` mapping group in `which-key` - ([33c1171](https://github.com/sRavioli/nvim/commit/33c117112f1b1128f44a895381118e5071d08171)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** install `nvim-tree` (to substitute `neo-tree`) - ([8b265cf](https://github.com/sRavioli/nvim/commit/8b265cf5a3b12f8bf055635aee97a7b3be683205)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** add lua node_types for indent-blankline scopes - ([e21e394](https://github.com/sRavioli/nvim/commit/e21e3940eb60393c113479234d153dc87957cf90)) - [@sRavioli](https://github.com/sRavioli)
- **(skel)** add template `.clang-format` - ([6c1e838](https://github.com/sRavioli/nvim/commit/6c1e8386d2969ad34cadd58b9102ade3878bc94b)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add lazy loading function - ([d9078b1](https://github.com/sRavioli/nvim/commit/d9078b1987bbe630b6eb4c18fec774da3bcd6394)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:duck)** safe require `nvim-notify`, use neovim lua api - ([1e8e32e](https://github.com/sRavioli/nvim/commit/1e8e32e06142461237d73c52bfac2aa44c12fa85)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:keymaps)** allow loading keymap table - ([aa15f02](https://github.com/sRavioli/nvim/commit/aa15f0246da1691dbac79c7106b339a18bea130f)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:nvim-tree)** maybe implement `lsp-file-operations` - ([6dbdb75](https://github.com/sRavioli/nvim/commit/6dbdb755e3e5265471c1bd342bc30be7230cffdf)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:nvim-tree)** modify `on_attach()` to auto-close float window on events - ([ac23f8b](https://github.com/sRavioli/nvim/commit/ac23f8b7e07d0c7cca10d2ce4e4765deec1daf8d)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:nvim-tree)** embed and refactor "[JMarkin/nvim-tree.lua-float-preview](https://github.com/JMarkin/nvim-tree.lua-float-preview)" - ([3e1dc0e](https://github.com/sRavioli/nvim/commit/3e1dc0eda7528a53a799d246af8cf9ace2958dde)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:nvim-tree)** embed and refactor ["JMarkin/nvim-tree.lua-float-preview"](https://github.com/JMarkin/nvim-tree.lua-float-preview) - ([ecc2e77](https://github.com/sRavioli/nvim/commit/ecc2e77d6000b107818b1c314ab48c49ac190ce4)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(lazy)** update \lazy.nvim\ lockfile - ([33dd699](https://github.com/sRavioli/nvim/commit/33dd699c2d645278cfa7d89e280bc68e8bbeb9d9)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update `lazy.nvim` lockfile - ([2e09e67](https://github.com/sRavioli/nvim/commit/2e09e67dc9d9314b4c9fcaefafd5e192a6134561)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update `lazy.nvim` lockfile - ([0b7b91e](https://github.com/sRavioli/nvim/commit/0b7b91e991c27afffe0cefc331ab0e57e947b790)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update `lazy.nvim` lockfile - ([8c9db8e](https://github.com/sRavioli/nvim/commit/8c9db8eb726fe03e5a8c7795cfc0f8e89b4ba372)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update `lazy.nvim` lockfile - ([cb5d541](https://github.com/sRavioli/nvim/commit/cb5d5415328ef8affe1bd52827341cad226fc061)) - [@sRavioli](https://github.com/sRavioli)
- **(lazy)** update `lazy.nvim` lockfile - ([2d9451c](https://github.com/sRavioli/nvim/commit/2d9451c5cc59d2a2bc58593e980ed9238956f779)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings)** adapt `duck` function calls - ([7274536](https://github.com/sRavioli/nvim/commit/7274536a481efaff8a2aebe9824419e3195b75c3)) - [@sRavioli](https://github.com/sRavioli)
- format changelog - ([ae91a22](https://github.com/sRavioli/nvim/commit/ae91a22463ddf9556edcbd36d21383b3485a5aa6)) - [@sRavioli](https://github.com/sRavioli)

#### Refactoring

- **(utils:nvim-tree)** move helpers to different file - ([af5925e](https://github.com/sRavioli/nvim/commit/af5925ea14bb258facecfb83c6dedb7ad86a8614)) - [@sRavioli](https://github.com/sRavioli)

#### Style

- **(preferences)** change class name - ([7035625](https://github.com/sRavioli/nvim/commit/7035625d16b1ac6f3acd093bbbfea5fbc923800f)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.13.0](https://github.com/sRavioli/nvim/compare/0.12.0..0.13.0) - 2023-11-10

#### Features

- **(cog)** add changelog autoformat pre-bump hook - ([cd6d315](https://github.com/sRavioli/nvim/commit/cd6d31513427b7b69bcb24ed0660ebd8914818db)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(changelog)** format changelog - ([3f5a7a9](https://github.com/sRavioli/nvim/commit/3f5a7a9322e587d9265c4cd2c7a5661f31d30b07)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.12.0](https://github.com/sRavioli/nvim/compare/0.11.1..0.12.0) - 2023-11-10

#### Bug Fixes

- **(cog)** remove changelog formatting - ([fcf9e28](https://github.com/sRavioli/nvim/commit/fcf9e28cfc7221ead1db8a70288d549867ce265b)) - [@sRavioli](https://github.com/sRavioli)
- **(config)** move configuration files to `config` folder - ([877e9bc](https://github.com/sRavioli/nvim/commit/877e9bca2d5ba45f41510b32c7236ca63d140eac)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings)** conform mappings to new spec - ([97914eb](https://github.com/sRavioli/nvim/commit/97914eb52a9cc09ad46cde1b9b5d5819740bdcf7)) - [@sRavioli](https://github.com/sRavioli)
- **(mapppings)** remove `todo-comments` keymaps, use `lazy.nvim` key handler - ([a68fdea](https://github.com/sRavioli/nvim/commit/a68fdeadd635058bbb5df2d1200cc3bc71a7a441)) - [@sRavioli](https://github.com/sRavioli)
- **(plugin:ui)** change `toggleterm` float dimensions to function, update highlights - ([4f3d2d4](https://github.com/sRavioli/nvim/commit/4f3d2d4dd8c293f7a0f7cf3f14c577b05f5a219a)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:autocompletion)** don't pcall luasnip in it's config - ([96df81f](https://github.com/sRavioli/nvim/commit/96df81fa6e5e8ff8a0ccdc442634565ef19c7629)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:autocompletion)** make `cmp` folder a single file, move other files to `utils` - ([b7e4b14](https://github.com/sRavioli/nvim/commit/b7e4b14ffdfd3cda3dbe06cae820149d171f39b7)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:lsp)** use new keymaps api - ([43c11cb](https://github.com/sRavioli/nvim/commit/43c11cbb4d8027255602de19a792bf8f91a1b634)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:lsp)** correctly lazy load `lspsaga` mappings - ([0d9a68a](https://github.com/sRavioli/nvim/commit/0d9a68a3a39a0d24b7c8a7eea06b98515e30dc47)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:treesitter)** change opts to table, load mappings after config - ([d0c2b36](https://github.com/sRavioli/nvim/commit/d0c2b3654f18b7c38867697917d0e7f4e23d88ab)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** change scrollbar highlights - ([b7c54a1](https://github.com/sRavioli/nvim/commit/b7c54a1def0a7fb37a855fa17a689bed2eeb3724)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** disable `neo-tree` libuv file watcher [#914](https://github.com/nvim-neo-tree/neo-tree.nvim/issues/914) - ([597ba84](https://github.com/sRavioli/nvim/commit/597ba844a6592b6ba8f3ccea4d1ad51315fbeef3)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** load `barbar` mappings after setup, not during init - ([4b800d2](https://github.com/sRavioli/nvim/commit/4b800d2f54eeb0e3a1557c94c0e7bd8ea4ffc900)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:fn)** load correct config files - ([c27ceee](https://github.com/sRavioli/nvim/commit/c27ceee38a1b831900fe51d89446111c63bfd544)) - [@sRavioli](https://github.com/sRavioli)
- load correct configuration files - ([39fe0d3](https://github.com/sRavioli/nvim/commit/39fe0d37618e92406c0532022ac5a4a40b2b355a)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(colorschemes:kanagawa)** disable kanagawa transparency - ([4f1857c](https://github.com/sRavioli/nvim/commit/4f1857c34a4daad26bebd00644bf7c4c1da2e7bc)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings)** add mappings for `duck.lua` - ([9982f18](https://github.com/sRavioli/nvim/commit/9982f182d8196863c9982198b79cb45242f1d77e)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings)** add hls-lens keymaps - ([d72bca9](https://github.com/sRavioli/nvim/commit/d72bca958eb0afb860d90473c67fc45375bbeac9)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ft)** install `vim-pencil` - ([6a189b7](https://github.com/sRavioli/nvim/commit/6a189b78e911bd50f693558041a00c54172bdc39)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:motions)** install `numb.nvim` to peek lines - ([1a451ec](https://github.com/sRavioli/nvim/commit/1a451ec0f137d39b985960a952952d528f0c18ac)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:treesitter)** install `neogen` for better annotations - ([528a60a](https://github.com/sRavioli/nvim/commit/528a60abd2e96ecd62ee91f17ddc4df1d5e87613)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** setup `hls-lens` for scrollbar - ([7ec7868](https://github.com/sRavioli/nvim/commit/7ec7868b2a464453a736e92b564f6f800c5971c9)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** install `scrollbar` - ([f2c1b89](https://github.com/sRavioli/nvim/commit/f2c1b89ae8045b44e42b99d9e08742e7b67b5980)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** install `hls-lens` - ([0c07f6c](https://github.com/sRavioli/nvim/commit/0c07f6ccbc84e2d6a568af2ebbbeb0ec42c12196)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** add neogen keymap group to `which-key` - ([a5a61e2](https://github.com/sRavioli/nvim/commit/a5a61e21d575141f77367cb43b9aea628c59857d)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** group empty directories in `neo-tree` - ([6575a60](https://github.com/sRavioli/nvim/commit/6575a601ff326b3eb9063b008e3fcafb7f15c639)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** load `neo-tree` when running `nvim .` - ([f5f96ac](https://github.com/sRavioli/nvim/commit/f5f96ac23fb00ab9bf5f65c88808c1e1ab71e98a)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** change `indent-blankline` indent char - ([dfcb388](https://github.com/sRavioli/nvim/commit/dfcb388d5eb5bc1dd17b3de8e42b9836290f8460)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** use new keymaps api for loading `gitsigns` keymaps - ([21aacfb](https://github.com/sRavioli/nvim/commit/21aacfb4ec6817cbe1decb017284ad0118a70ba8)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:duck)** add module annotations for `duck.lua` - ([e99f038](https://github.com/sRavioli/nvim/commit/e99f0382ca6e39ab66a9954659e1ab986d51ea35)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:duck)** integrate `duck` plugin - ([a6bec47](https://github.com/sRavioli/nvim/commit/a6bec47ec6752ca189eb9a16ee1074f710699f14)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:keymaps)** create keymaps spec, add functions to load mappings - ([def7d72](https://github.com/sRavioli/nvim/commit/def7d720298bb0d61078d7b9e82b153a84ec1691)) - [@sRavioli](https://github.com/sRavioli)
- load keymaps with new function - ([fe62677](https://github.com/sRavioli/nvim/commit/fe62677cc54189b606b3495a919ea8f58de4e860)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(changelog)** format changelog - ([9f41050](https://github.com/sRavioli/nvim/commit/9f41050c3d526d2329f4a3616f95c09c86ce617b)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:keymaps)** update keymaps module license name - ([0e4f4bc](https://github.com/sRavioli/nvim/commit/0e4f4bcbeba0006f635a320def4d902a6f51b35b)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.11.1](https://github.com/sRavioli/nvim/compare/0.11.0..0.11.1) - 2023-11-07

#### Bug Fixes

- remove extra changelog - ([3ec0410](https://github.com/sRavioli/nvim/commit/3ec04102770be654d6de8d67c41604daabfd39cf)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.10.4](https://github.com/sRavioli/nvim/compare/0.10.3..0.10.4) - 2023-11-06

#### Bug Fixes

- remove extra changelog - ([70007e6](https://github.com/sRavioli/nvim/commit/70007e63d19176e602a4b697c7c7bec565adcd92)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(colorschemes:kanagawa)** make inactive buffer tab fg as comment - ([70d5714](https://github.com/sRavioli/nvim/commit/70d57148556f59663a4232186e01f24ac278d108)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.10.3](https://github.com/sRavioli/nvim/compare/0.10.2..0.10.3) - 2023-11-06

#### Features

- **(plugins:ui)** change `toggleterm` float size - ([4987db3](https://github.com/sRavioli/nvim/commit/4987db3ef2c50b72bde3a53a3913aab23b3a4c7d)) - [@sRavioli](https://github.com/sRavioli)

#### Hotfixes

- **(colorscheme:kanagawa)** `deleted` -> `removed` (1st isn't a kanagawa highlight) - ([2c5e6d6](https://github.com/sRavioli/nvim/commit/2c5e6d6aa947bca19d315b97f04fa232b8cad8dc)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.10.1](https://github.com/sRavioli/nvim/compare/0.10.0..0.10.1) - 2023-11-06

#### Bug Fixes

- **(colorschemes:kanagawa)** use vsc colors for git status for barbar - ([c5e7f54](https://github.com/sRavioli/nvim/commit/c5e7f54c0ef7eee8020447f45ea2d130a8c2a4ed)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(cog)** restore the formatting of the changelog - ([ec3c84c](https://github.com/sRavioli/nvim/commit/ec3c84c0e9f5f20dc4e00fde4c76b9e1ea821862)) - [@sRavioli](https://github.com/sRavioli)
- **(snippets:markdown)** add snippet to quickly add obsidian metadata to university notes - ([087fda3](https://github.com/sRavioli/nvim/commit/087fda3f62f1a2e47e67237931d6748cad77a453)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.10.0](https://github.com/sRavioli/nvim/compare/0.9.7..0.10.0) - 2023-11-01

#### Bug Fixes

- **(cmp:functions)** use plain text in cmp autocompletion menu if `lspkind` isn't present - ([c82cd9b](https://github.com/sRavioli/nvim/commit/c82cd9b0aaf0aba4edcffd5f9d43d70291039160)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp:sources)** remove sources that where polliting results - ([54c9db6](https://github.com/sRavioli/nvim/commit/54c9db63ead338c8a40d74109bba388aba5d791c)) - [@sRavioli](https://github.com/sRavioli)
- **(colorschemes:kanagawa)** redefine all cmp highlights - ([3480869](https://github.com/sRavioli/nvim/commit/3480869ba0f8edd3546fcb97b6406e4a4c3674ae)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(cmp)** make possible to use bottom-down sorting in autocompletion menu - ([7146f5f](https://github.com/sRavioli/nvim/commit/7146f5f06866da1f4d179d98285d5d5cf2d98e6d)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(plugins:colorschemes)** remove comments, specify the wave theme - ([65bfe50](https://github.com/sRavioli/nvim/commit/65bfe5053e5fb69ff279041f73cb042e0f9997d0)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.9.7](https://github.com/sRavioli/nvim/compare/0.9.6..0.9.7) - 2023-10-26

#### Hotfixes

- **(plugins:ft)** `desc` -> `desc` in `vim-ditto` - ([3c5de61](https://github.com/sRavioli/nvim/commit/3c5de6188133afde16483ab19d39ad172f404a56)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.9.6](https://github.com/sRavioli/nvim/compare/0.9.5..0.9.6) - 2023-10-26

#### Bug Fixes

- **(plugins:autocompletion)** remove `vimtex` from luasnip dependencies - ([cb4221d](https://github.com/sRavioli/nvim/commit/cb4221d1d2d844e058450d5f047be2ea553fd9e5)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(plugins:ft)** install `vimtex`, update `vim-ditto`, move `obsidian.nvim` to bottom - ([7f4d9fd](https://github.com/sRavioli/nvim/commit/7f4d9fd3bade7582a959838a5c5369f96975bda8)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.9.5](https://github.com/sRavioli/nvim/compare/0.9.4..0.9.5) - 2023-10-25

#### Features

- **(plugins:ft)** install `vim-ditto` - ([eb9718a](https://github.com/sRavioli/nvim/commit/eb9718a71df6f3799015c8a6d04b9939a7afd066)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(vim-ditto)** add dittofile - ([10013a7](https://github.com/sRavioli/nvim/commit/10013a7c3952d4f958e33083b91de4076d6b4601)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.9.3](https://github.com/sRavioli/nvim/compare/0.9.2..0.9.3) - 2023-10-23

#### Bug Fixes

- **(mappings:lspsaga)** add `<CR>` to keymap end, change mapping - ([4d17eec](https://github.com/sRavioli/nvim/commit/4d17eec5ca622332a73aaafabd8f8bc1cd161e4c)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** use correct colors for lualine groups, use icons for fileformat - ([bbf8670](https://github.com/sRavioli/nvim/commit/bbf867004d7748be94ea35e0bb4a996378e1bace)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(plugins:ui)** change `zen-mode` window width - ([de58991](https://github.com/sRavioli/nvim/commit/de589916e8d3aad5225ce3d2042040a1406e0b9b)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** enable indent-blankline scope highlight - ([db33d4e](https://github.com/sRavioli/nvim/commit/db33d4e28078b309addf53049f6ca83b33f8193f)) - [@sRavioli](https://github.com/sRavioli)
- **(snippets:latex)** add snippets - ([f8a54f0](https://github.com/sRavioli/nvim/commit/f8a54f06d71f527858df2dc13dc2b32c409afb2f)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(utils:fn)** fix typo in documentation - ([8c255aa](https://github.com/sRavioli/nvim/commit/8c255aa02a76d93549e7ddf76045a2010c12c734)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.9.2](https://github.com/sRavioli/nvim/compare/0.9.1..0.9.2) - 2023-10-19

#### Bug Fixes

- **(plugins:ui)** use custom kinds for `nvim-notify` - ([39ab120](https://github.com/sRavioli/nvim/commit/39ab120978e0390670fdb2a7a73d1ddb50bb2247)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** change neo-tree indent markers, don't highlight as comment - ([337a28e](https://github.com/sRavioli/nvim/commit/337a28ed4a03340e698049c97a44715760a082f7)) - [@sRavioli](https://github.com/sRavioli)
- **(stylua)** change stylua formatting method - ([9c897b6](https://github.com/sRavioli/nvim/commit/9c897b659b3c00a763d2d6748ac5295f8daa1f02)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(plugins:motions)** add markdown checkbox switcher for `nvim-toggler` - ([6b82f2c](https://github.com/sRavioli/nvim/commit/6b82f2caf74c9888c94f98c444064a624d73194f)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:motions)** install `surround-ui` - ([afc9ba0](https://github.com/sRavioli/nvim/commit/afc9ba0f20936944b65772f1de2b0b1cf3ad9093)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** install `nvim-colorizer` - ([e9de0e4](https://github.com/sRavioli/nvim/commit/e9de0e45e61df1d27c32f7b9ad9d17454a74ef8a)) - [@sRavioli](https://github.com/sRavioli)
- **(preferences)** add new diagnostics icons - ([9c84613](https://github.com/sRavioli/nvim/commit/9c846134bf91591dc59d812cea6faacfccb68323)) - [@sRavioli](https://github.com/sRavioli)
- **(snippets:toml)** add stylua config as toml snippet - ([bfdbb24](https://github.com/sRavioli/nvim/commit/bfdbb24b3833507a6b9b99c5f3a81e0e7c0b0f8b)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(plugins:lsp)** handle `null-ls` deprecaiton, use `none-ls` - ([f9e3a2f](https://github.com/sRavioli/nvim/commit/f9e3a2f2c1ae91b9cc8e1fa88f7c341fcd3bfc72)) - [@sRavioli](https://github.com/sRavioli)
- format with stylua - ([44ba336](https://github.com/sRavioli/nvim/commit/44ba336445aa2e10f8eff0453af5ba8f6f41a96f)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.9.1](https://github.com/sRavioli/nvim/compare/0.9.0..0.9.1) - 2023-10-16

#### Bug Fixes

- **(colorscheme)** remove neovide theme - ([07984d2](https://github.com/sRavioli/nvim/commit/07984d26064df6bc74f8804c98a90850af56c6a2)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(colorscheme)** comments are italicised - ([3f68f50](https://github.com/sRavioli/nvim/commit/3f68f50e5cd655ddac065a2989df93bdbb0668f6)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins:ui)** install `nvim-notify` - ([4915378](https://github.com/sRavioli/nvim/commit/4915378fbecef2a081db1f801e56cf3ae54e58b3)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** recompile `kanagawa.nvim` when inside neovide, restore on exit - ([23cc60e](https://github.com/sRavioli/nvim/commit/23cc60ef9baa5a76a6a2d0d6857ebb47afc57464)) - [@sRavioli](https://github.com/sRavioli)
- **(utils:fn)** notify when toggling typewriter scroll - ([d0b6743](https://github.com/sRavioli/nvim/commit/d0b67437df61480f9dfd70f965141c01266e4aa9)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(plugins)** add more toggle switches - ([0d1b7d1](https://github.com/sRavioli/nvim/commit/0d1b7d19c8467e01b4ccf607453eaa26ebdc7936)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.9.0](https://github.com/sRavioli/nvim/compare/0.8.1..0.9.0) - 2023-10-16

#### Bug Fixes

- **(plugins)** remove old `ui` folder - ([47c7c95](https://github.com/sRavioli/nvim/commit/47c7c95c1b22d4263e3b33ae1397a8a99dd4606e)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(snippets)** add snippet to evaluate fractions inside parentheses - ([5b6eaa1](https://github.com/sRavioli/nvim/commit/5b6eaa1692792d5b8f2588ad3aa7724e94e1adc5)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- remove useles changelog - ([f30f0ad](https://github.com/sRavioli/nvim/commit/f30f0ad87c802ace365a2852da90b785bf7e1795)) - [@sRavioli](https://github.com/sRavioli)

#### Refactoring

- **(plugins)** ditch `editor folder`, group plugins in a better way - ([278a291](https://github.com/sRavioli/nvim/commit/278a2911d2b61618a2c9bada9dea036c49d629e6)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** move colorschemes to own folder - ([db22efe](https://github.com/sRavioli/nvim/commit/db22efe3219084c51966e2babf2fae48986bf758)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.8.1](https://github.com/sRavioli/nvim/compare/0.8.0..0.8.1) - 2023-10-15

#### Hotfixes

- **(snippets)** make `format.binomial.expand_simple()` not solve `n - k` - ([03cbaf9](https://github.com/sRavioli/nvim/commit/03cbaf9754f13d8bf2683192092ae79ae0e3f0f0)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.8.0](https://github.com/sRavioli/nvim/compare/0.7.6..0.8.0) - 2023-10-15

#### Bug Fixes

- **(autocommands)** disable automatic typewriter toggle for md files - ([8f8a6f5](https://github.com/sRavioli/nvim/commit/8f8a6f54dfb86f68f9eef16f0904bcb51076f15e)) - [@sRavioli](https://github.com/sRavioli)
- **(codespell)** remove italian - ([ac49c66](https://github.com/sRavioli/nvim/commit/ac49c66438485e258b4a3fd725f89c613e1b5e03)) - [@sRavioli](https://github.com/sRavioli)
- **(mappings)** conform typewriter toggle to toggle keymaps - ([b874bb3](https://github.com/sRavioli/nvim/commit/b874bb34cb83811b1ab943eb1f37008a522ffbfc)) - [@sRavioli](https://github.com/sRavioli)
- **(neovide)** disable transparency and fullscreen, increase padding - ([1818dd5](https://github.com/sRavioli/nvim/commit/1818dd540363569958ec10eb4380dc68ef9fd658)) - [@sRavioli](https://github.com/sRavioli)
- **(snippets)** make logic operator triggers uppercase to prevent accidental expansion - ([a36fdae](https://github.com/sRavioli/nvim/commit/a36fdae8fc691a556dca378dcdfb0f00eebba34d)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** LDoc comments - ([bac69cc](https://github.com/sRavioli/nvim/commit/bac69cc19b77fe493944fb78bf6c4472b41e95d5)) - [@sRavioli](https://github.com/sRavioli)
- remove codespell configuration file - ([3f42447](https://github.com/sRavioli/nvim/commit/3f4244781e572af5055aa9f39a0926270e839b6c)) - [@sRavioli](https://github.com/sRavioli)
- temporary disable theme compilation at runtime - ([1b3aac8](https://github.com/sRavioli/nvim/commit/1b3aac803c7a602881c8bf8180e8f1cf844e35e0)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(mappings)** activate code action keybinds - ([dc13bfb](https://github.com/sRavioli/nvim/commit/dc13bfbca852780a4eaa2fe19c6778b3bb3eb62d)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** disable virtual text lightbulb, disable code actions and diagnostics - ([bfdcf73](https://github.com/sRavioli/nvim/commit/bfdcf73d13cedf7cac75532ac98ef61b97fa6ee5)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add better documentation for typewriter function - ([e06ee8d](https://github.com/sRavioli/nvim/commit/e06ee8d895227db23ef44a11445410235c772157)) - [@sRavioli](https://github.com/sRavioli)

#### Refactoring

- **(snippets)** move all formatting functions into the `format` class and categorize them - ([86accb8](https://github.com/sRavioli/nvim/commit/86accb83d623cbd9e6d4e82b587c9544e84ea0db)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** rewrite function to update timestamp - ([efac941](https://github.com/sRavioli/nvim/commit/efac9412e05a610cd4cd3b3fc49c57cf6ab28f2e)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.6](https://github.com/sRavioli/nvim/compare/0.7.5..0.7.6) - 2023-10-13

#### Bug Fixes

- **(snippets)** turn `ox` trigger into `oX` to prevent accidental expansion - ([835aafd](https://github.com/sRavioli/nvim/commit/835aafd48af0d6965431d60980cf72e9c3aea818)) - [@sRavioli](https://github.com/sRavioli)
- **(snippets)** incorrect spelling and spacing for snippet - ([3fd9c7b](https://github.com/sRavioli/nvim/commit/3fd9c7b5187721d9997dcd8604c1cee45c21933b)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(neovide)** add settings for neovide - ([bf1c794](https://github.com/sRavioli/nvim/commit/bf1c79441409fbff40e4e582baf12edffeba824b)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** load neovide seettings if running neovide - ([e6b8753](https://github.com/sRavioli/nvim/commit/e6b87531159435665a8f60e96a4261084ce024cb)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** disable transparency for neovide, recompile at runtime - ([379bcdc](https://github.com/sRavioli/nvim/commit/379bcdc9fd13202546b114d67bffed4b99efadfa)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.4](https://github.com/sRavioli/nvim/compare/0.7.3..0.7.4) - 2023-10-06

#### Bug Fixes

- **(plugins)** disable scopes for indent-blankline - ([1faa43c](https://github.com/sRavioli/nvim/commit/1faa43cbfd6428e4dca8e39fae906a5854a29d3b)) - [@sRavioli](https://github.com/sRavioli)
- **(snippets)** rewrite LaTeX snippets from scratch, add more snippets - ([1fe9ab4](https://github.com/sRavioli/nvim/commit/1fe9ab44e3f5f6e6f1cd4a54207d0463b9258a0f)) - [@sRavioli](https://github.com/sRavioli)
- **(snippets)** adjust spacing for obsidian metadata snippet - ([7135d1e](https://github.com/sRavioli/nvim/commit/7135d1e4c6b9bbe69c62c4a97cf685c794983099)) - [@sRavioli](https://github.com/sRavioli)
- **(treesitter)** use clangd compiler - ([758e20e](https://github.com/sRavioli/nvim/commit/758e20e7d736df3ecde05e077afbad2a736236ff)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** disable mkdwn auto-align table and adjust shiftwidth - ([7ac8323](https://github.com/sRavioli/nvim/commit/7ac8323d0267a90bdf799b7d862b178e07ca56e6)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(ft)** add vimlatex - ([1081ff9](https://github.com/sRavioli/nvim/commit/1081ff979e5fa550bc3308f3f340d56cea315822)) - [@sRavioli](https://github.com/sRavioli)
- **(luasnip)** add luasnip deps, add `ft_func` and `load_ft_func` - ([bd75cbe](https://github.com/sRavioli/nvim/commit/bd75cbe7357915060a9303c55408ae1e39826397)) - [@sRavioli](https://github.com/sRavioli)
- **(snippets)** add latex and lua snippets - ([a47557a](https://github.com/sRavioli/nvim/commit/a47557a4f8614d0d54af5d0b30a6cdc2eaeb57e7)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add luasnip utility functions - ([abb4de2](https://github.com/sRavioli/nvim/commit/abb4de255977d34bbfea073851c532feff9fe897)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** create function to update 'last modified' field on save - ([0a01312](https://github.com/sRavioli/nvim/commit/0a01312dea4d2dd99c985c165d9cc478f3c0b226)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.3](https://github.com/sRavioli/nvim/compare/0.7.2..0.7.3) - 2023-09-25

#### Bug Fixes

- adjust luasnip snippet path - ([7b54d6e](https://github.com/sRavioli/nvim/commit/7b54d6e9a0dfe5b1119578bfa0ab4b6c559569bc)) - [@sRavioli](https://github.com/sRavioli)
- remove luasnip build on windows - ([5bb69ce](https://github.com/sRavioli/nvim/commit/5bb69ce61a4872fb73b2192aed39525e617a28a6)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(lsp)** move to tectonic - ([aeb50bf](https://github.com/sRavioli/nvim/commit/aeb50bfd9c5428167453b6bfa37d0a93fbac138e)) - [@sRavioli](https://github.com/sRavioli)
- add obsidian snippets - ([f4a0829](https://github.com/sRavioli/nvim/commit/f4a0829c3fff776e746e54af1972d7523e335561)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- bump - ([ebc55eb](https://github.com/sRavioli/nvim/commit/ebc55eb31f3c86401805357fbccd860e1ca16d9f)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.2](https://github.com/sRavioli/nvim/compare/0.7.1..0.7.2) - 2023-09-09

#### Bug Fixes

- manually invoke config for lsp-progress - ([040eb12](https://github.com/sRavioli/nvim/commit/040eb121835a8141b2372e3c578547d18ea72668)) - [@sRavioli](https://github.com/sRavioli)
- make lsp-progress callback smaller - ([d610fed](https://github.com/sRavioli/nvim/commit/d610feda43bf4ed5c8217a641d7061576aeb94be)) - [@sRavioli](https://github.com/sRavioli)
- remove border from assets, already in preferences - ([aadc82d](https://github.com/sRavioli/nvim/commit/aadc82da95478fe7d0605df4d64b3662ce0ead28)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(plugins)** add plugins for markdown - ([893b6dd](https://github.com/sRavioli/nvim/commit/893b6dd9260267fc5ce43b74ed4b53f63c4f6573)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** `:Neotree reveal toggle` would sometimes error - ([9b70cbf](https://github.com/sRavioli/nvim/commit/9b70cbf3ff0369b7aa6164235e2f597f0f1cc734)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(changelog)** format - ([442f683](https://github.com/sRavioli/nvim/commit/442f6831f0c8539db4cf9a26d02be8c730177fc0)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.1](https://github.com/sRavioli/nvim/compare/0.7.0..0.7.1) - 2023-07-12

#### Bug Fixes

- **(plugins)** typo in lsp-progress declaration - ([6997066](https://github.com/sRavioli/nvim/commit/699706651bbd26b08e4e96b6ff5deaf4844a10be)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** don't create opts table, pass empty table in `telescope.fd()` - ([baa9420](https://github.com/sRavioli/nvim/commit/baa94208124d3f6613be35cf5b0433946a09210c)) - [@sRavioli](https://github.com/sRavioli)
- change nerdicons keymap - ([ade4e48](https://github.com/sRavioli/nvim/commit/ade4e48678bb16501d975295521d73279b98d14d)) - [@sRavioli](https://github.com/sRavioli)

#### Documentation

- **(settings)** remove redundant comment when requiring module - ([14e678b](https://github.com/sRavioli/nvim/commit/14e678bfaf2dd3641955c841ae9a82637602cf16)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(cog)** add post bump hooks - ([95ffe66](https://github.com/sRavioli/nvim/commit/95ffe6644c92e012ff2ca1582159a26d3331c73c)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** add alpha configuration - ([be8782d](https://github.com/sRavioli/nvim/commit/be8782d061adef9f207d437c334ae9f6431d1f92)) - [@sRavioli](https://github.com/sRavioli)
- add plugins section for filetype - ([7e19bd6](https://github.com/sRavioli/nvim/commit/7e19bd61101a6c47e89651fd54c1deccd5eb3534)) - [@sRavioli](https://github.com/sRavioli)
- import assets from old config - ([4cc07b2](https://github.com/sRavioli/nvim/commit/4cc07b2b39ce0fe1139abbb7349d5bf05d142ea5)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(changelog)** format - ([262176e](https://github.com/sRavioli/nvim/commit/262176e8878775757f957a6d5ea77e042a918fe2)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.0](https://github.com/sRavioli/nvim/compare/0.6.3..0.7.0) - 2023-07-12

#### Bug Fixes

- **(cmp)** disable buffer-lines source - ([898ad4b](https://github.com/sRavioli/nvim/commit/898ad4b93333797164f235a3e7003540dbf72b1b)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** call correct lspsaga command on hover docs - ([97154de](https://github.com/sRavioli/nvim/commit/97154de5de630d8088682bb0e01f780f3c3a2ff3)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(keymaps)** add undo break-point for the space key - ([cb63d14](https://github.com/sRavioli/nvim/commit/cb63d148e9488831b5075ee30ec92590236d8344)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add shell for function to automatically update timestamps - ([470c8e3](https://github.com/sRavioli/nvim/commit/470c8e37ffdfea4398948a252de236bff99adaea)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.6.3](https://github.com/sRavioli/nvim/compare/0.6.2..0.6.3) - 2023-07-11

#### Bug Fixes

- **(keymaps)** change select all mapping to `<A-a>` - ([99c9659](https://github.com/sRavioli/nvim/commit/99c96590e573093e8974ff4aec6697f1ee229017)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(lsp)** update lspsaga config - ([243c1b8](https://github.com/sRavioli/nvim/commit/243c1b8a0291ee104b37febca783d87f8c4a11b8)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** personalize neorg concealer - ([a052781](https://github.com/sRavioli/nvim/commit/a05278165fec999b224542a0d6a0a45f0454fb36)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add autocmd to activate concealer for norg files - ([35bb98f](https://github.com/sRavioli/nvim/commit/35bb98fcc1904fbd196a716b859cfec2ab8deabb)) - [@sRavioli](https://github.com/sRavioli)

#### Revert

- **(keymaps)** use `<cmd>` instead of lua functions for lspsaga - ([a5aed0f](https://github.com/sRavioli/nvim/commit/a5aed0f477b49823a8632a4f2fc182d86c4efed8)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.6.2](https://github.com/sRavioli/nvim/compare/0.6.1..0.6.2) - 2023-07-10

#### Bug Fixes

- **(plugins)** ignore `**node_modules/*` when searching all files w/ Telescope - ([c1985de](https://github.com/sRavioli/nvim/commit/c1985de9384043a09304eb05b2185bbf19d98e92)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** remove filetype exclude for indent-blankline - ([5542963](https://github.com/sRavioli/nvim/commit/55429639ac0d1a9730515a897340c790cdf1c293)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** remove which-key unused mappings - ([038b309](https://github.com/sRavioli/nvim/commit/038b3095b078f839abbf6ad4c1836e122a151172)) - [@sRavioli](https://github.com/sRavioli)
- remove weird changelog - ([dca320b](https://github.com/sRavioli/nvim/commit/dca320b29784e9e4710c714fcf1c1bed35326d01)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(keymaps)** improve line moving mappings - ([364e1d3](https://github.com/sRavioli/nvim/commit/364e1d3bcf11a16968db68677c87cc3febaaf305)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** load more neorg modules - ([acc2e36](https://github.com/sRavioli/nvim/commit/acc2e3663c1bec66ff97e75629cd8f754904a993)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** install zen-mode - ([2bffd37](https://github.com/sRavioli/nvim/commit/2bffd3766dcf9f0e4bc50ab9929bd8038821ee09)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.6.1](https://github.com/sRavioli/nvim/compare/0.6.0..0.6.1) - 2023-07-06

#### Bug Fixes

- **(cog)** add branch whitelists - ([5f07b87](https://github.com/sRavioli/nvim/commit/5f07b8710cf6346fe99e63cd42eed19a322905fb)) - [@sRavioli](https://github.com/sRavioli)
- **(cog)** keep cog config up to date - ([56c072c](https://github.com/sRavioli/nvim/commit/56c072c972542c2c8a5b9c12cbd2a360bc97d09d)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** rewrite workflow run - ([6ade1e2](https://github.com/sRavioli/nvim/commit/6ade1e250337543215a054fc1183e07d01791c86)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** add permission to write to workflow - ([bf32f97](https://github.com/sRavioli/nvim/commit/bf32f9700965b9af0c6e5bf1509059a75d960eb8)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** make workflow run on dispatch - ([feba023](https://github.com/sRavioli/nvim/commit/feba023a65d5893f860022927792a2135cf0b515)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** semicolons in workflow - ([5738405](https://github.com/sRavioli/nvim/commit/5738405a0447940924cb40c01405aafd5862f36a)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** add git config in workflow - ([7088c37](https://github.com/sRavioli/nvim/commit/7088c37c74ba52cccb8c4aaed2b48540d2b65f37)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** auto release workflow formatting - ([5c291a4](https://github.com/sRavioli/nvim/commit/5c291a43e15f8379471749876cf0a80800f2d6f1)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** disable actionlint - ([505a199](https://github.com/sRavioli/nvim/commit/505a1990d470ad310bb0c9ce56f020004dcf0634)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** load correct diagnostic signs - ([c72c32f](https://github.com/sRavioli/nvim/commit/c72c32f993dca812c70f2e2075f78dffb2b268aa)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** incorrect null-ls symbol spacing - ([9264745](https://github.com/sRavioli/nvim/commit/92647451d24a7906090e858f71da1196443f02f2)) - [@sRavioli](https://github.com/sRavioli)
- . - ([5966c23](https://github.com/sRavioli/nvim/commit/5966c234ba25aa69bcdda1762f6746e2eb9106d2)) - [@sRavioli](https://github.com/sRavioli)
- add - ([dd652a4](https://github.com/sRavioli/nvim/commit/dd652a442093ad7e8f9b01f737d5dc6146caf9e2)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(github)** add auto release action - ([72ce306](https://github.com/sRavioli/nvim/commit/72ce306b780ba6ffb82a80fdb99f331148f28fba)) - [@sRavioli](https://github.com/sRavioli)

#### Hotfixes

- **(cog)** remove old configs - ([39a2064](https://github.com/sRavioli/nvim/commit/39a2064fc3e63b41b4eec0c486e83ff7055dce36)) - [@sRavioli](https://github.com/sRavioli)
- **(cog)** use correct git push command - ([9c93656](https://github.com/sRavioli/nvim/commit/9c936568b356934358a1a1efea9047bdb0f5d55d)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** move action in `workflows/` folder - ([ca63ea0](https://github.com/sRavioli/nvim/commit/ca63ea04f38433ad07ffdee8b55ff1e894846e59)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(version)** 0.6.3 - ([41e9af8](https://github.com/sRavioli/nvim/commit/41e9af8988b57dc969f03053d5fb36192a000131)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.6.2 - ([7a6ae11](https://github.com/sRavioli/nvim/commit/7a6ae1152e41b6e8fa73be02b1ff6498369d314f)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.6.1 - ([0c42dd8](https://github.com/sRavioli/nvim/commit/0c42dd89f1712c8a9b90a84583337dab604f7aff)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.0 - ([6f9e9c6](https://github.com/sRavioli/nvim/commit/6f9e9c697c7156a8b853c2587baa3e9c92a9dab2)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.5 - ([3aaf10e](https://github.com/sRavioli/nvim/commit/3aaf10e4ef533ce3ad1c6622fb131d88e005208b)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.4 - ([debc2df](https://github.com/sRavioli/nvim/commit/debc2df2ed86f73ae5da6174faeb3888ba6d1f01)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.3 - ([50b8ce7](https://github.com/sRavioli/nvim/commit/50b8ce7c2d6115fe9a6a09789d7f539f4c66e2df)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.2 - ([e40ea2b](https://github.com/sRavioli/nvim/commit/e40ea2b3bfc4798ed22d1eb1f6bc6b257f66fdd8)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.1 - ([7451766](https://github.com/sRavioli/nvim/commit/74517665c341a58814e82adfbba91f2248c98974)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.0 - ([f883273](https://github.com/sRavioli/nvim/commit/f883273c2c1c7a3527da43d7e6f35b3df6dd2ab1)) - [@sRavioli](https://github.com/sRavioli)
- add yamlfix file - ([05839bc](https://github.com/sRavioli/nvim/commit/05839bc095a0ed6867c30a1d0be1bae6a2ca3a4c)) - [@sRavioli](https://github.com/sRavioli)

#### Refactoring

- **(github)** rewrite release workflow - ([1d5d09c](https://github.com/sRavioli/nvim/commit/1d5d09c442dc03f108fdef991bcad2b3f45b98d3)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.6.3](https://github.com/sRavioli/nvim/compare/0.6.2..0.6.3) - 2023-07-06

#### Bug Fixes

- **(github)** add permission to write to workflow - ([bf32f97](https://github.com/sRavioli/nvim/commit/bf32f9700965b9af0c6e5bf1509059a75d960eb8)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** make workflow run on dispatch - ([feba023](https://github.com/sRavioli/nvim/commit/feba023a65d5893f860022927792a2135cf0b515)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.6.2](https://github.com/sRavioli/nvim/compare/0.6.1..0.6.2) - 2023-07-06

#### Bug Fixes

- **(github)** semicolons in workflow - ([5738405](https://github.com/sRavioli/nvim/commit/5738405a0447940924cb40c01405aafd5862f36a)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.6.1](https://github.com/sRavioli/nvim/compare/0.6.0..0.6.1) - 2023-07-06

#### Bug Fixes

- **(cog)** add branch whitelists - ([5f07b87](https://github.com/sRavioli/nvim/commit/5f07b8710cf6346fe99e63cd42eed19a322905fb)) - [@sRavioli](https://github.com/sRavioli)
- **(cog)** keep cog config up to date - ([56c072c](https://github.com/sRavioli/nvim/commit/56c072c972542c2c8a5b9c12cbd2a360bc97d09d)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** add git config in workflow - ([7088c37](https://github.com/sRavioli/nvim/commit/7088c37c74ba52cccb8c4aaed2b48540d2b65f37)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** auto release workflow formatting - ([5c291a4](https://github.com/sRavioli/nvim/commit/5c291a43e15f8379471749876cf0a80800f2d6f1)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** disable actionlint - ([505a199](https://github.com/sRavioli/nvim/commit/505a1990d470ad310bb0c9ce56f020004dcf0634)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** load correct diagnostic signs - ([c72c32f](https://github.com/sRavioli/nvim/commit/c72c32f993dca812c70f2e2075f78dffb2b268aa)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** incorrect null-ls symbol spacing - ([9264745](https://github.com/sRavioli/nvim/commit/92647451d24a7906090e858f71da1196443f02f2)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(github)** add auto release action - ([72ce306](https://github.com/sRavioli/nvim/commit/72ce306b780ba6ffb82a80fdb99f331148f28fba)) - [@sRavioli](https://github.com/sRavioli)

#### Hotfixes

- **(cog)** remove old configs - ([39a2064](https://github.com/sRavioli/nvim/commit/39a2064fc3e63b41b4eec0c486e83ff7055dce36)) - [@sRavioli](https://github.com/sRavioli)
- **(cog)** use correct git push command - ([9c93656](https://github.com/sRavioli/nvim/commit/9c936568b356934358a1a1efea9047bdb0f5d55d)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** move action in `workflows/` folder - ([ca63ea0](https://github.com/sRavioli/nvim/commit/ca63ea04f38433ad07ffdee8b55ff1e894846e59)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(version)** 0.7.0 - ([6f9e9c6](https://github.com/sRavioli/nvim/commit/6f9e9c697c7156a8b853c2587baa3e9c92a9dab2)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.5 - ([3aaf10e](https://github.com/sRavioli/nvim/commit/3aaf10e4ef533ce3ad1c6622fb131d88e005208b)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.4 - ([debc2df](https://github.com/sRavioli/nvim/commit/debc2df2ed86f73ae5da6174faeb3888ba6d1f01)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.3 - ([50b8ce7](https://github.com/sRavioli/nvim/commit/50b8ce7c2d6115fe9a6a09789d7f539f4c66e2df)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.2 - ([e40ea2b](https://github.com/sRavioli/nvim/commit/e40ea2b3bfc4798ed22d1eb1f6bc6b257f66fdd8)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.1 - ([7451766](https://github.com/sRavioli/nvim/commit/74517665c341a58814e82adfbba91f2248c98974)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.0 - ([f883273](https://github.com/sRavioli/nvim/commit/f883273c2c1c7a3527da43d7e6f35b3df6dd2ab1)) - [@sRavioli](https://github.com/sRavioli)
- add yamlfix file - ([05839bc](https://github.com/sRavioli/nvim/commit/05839bc095a0ed6867c30a1d0be1bae6a2ca3a4c)) - [@sRavioli](https://github.com/sRavioli)

#### Refactoring

- **(github)** rewrite release workflow - ([1d5d09c](https://github.com/sRavioli/nvim/commit/1d5d09c442dc03f108fdef991bcad2b3f45b98d3)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.0](https://github.com/sRavioli/nvim/compare/0.6.0..0.7.0) - 2023-07-06

#### Bug Fixes

- **(cog)** keep cog config up to date - ([56c072c](https://github.com/sRavioli/nvim/commit/56c072c972542c2c8a5b9c12cbd2a360bc97d09d)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** auto release workflow formatting - ([5c291a4](https://github.com/sRavioli/nvim/commit/5c291a43e15f8379471749876cf0a80800f2d6f1)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** disable actionlint - ([505a199](https://github.com/sRavioli/nvim/commit/505a1990d470ad310bb0c9ce56f020004dcf0634)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** load correct diagnostic signs - ([c72c32f](https://github.com/sRavioli/nvim/commit/c72c32f993dca812c70f2e2075f78dffb2b268aa)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** incorrect null-ls symbol spacing - ([9264745](https://github.com/sRavioli/nvim/commit/92647451d24a7906090e858f71da1196443f02f2)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(github)** add auto release action - ([72ce306](https://github.com/sRavioli/nvim/commit/72ce306b780ba6ffb82a80fdb99f331148f28fba)) - [@sRavioli](https://github.com/sRavioli)

#### Hotfixes

- **(cog)** remove old configs - ([39a2064](https://github.com/sRavioli/nvim/commit/39a2064fc3e63b41b4eec0c486e83ff7055dce36)) - [@sRavioli](https://github.com/sRavioli)
- **(cog)** use correct git push command - ([9c93656](https://github.com/sRavioli/nvim/commit/9c936568b356934358a1a1efea9047bdb0f5d55d)) - [@sRavioli](https://github.com/sRavioli)
- **(github)** move action in `workflows/` folder - ([ca63ea0](https://github.com/sRavioli/nvim/commit/ca63ea04f38433ad07ffdee8b55ff1e894846e59)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(version)** 0.7.5 - ([3aaf10e](https://github.com/sRavioli/nvim/commit/3aaf10e4ef533ce3ad1c6622fb131d88e005208b)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.4 - ([debc2df](https://github.com/sRavioli/nvim/commit/debc2df2ed86f73ae5da6174faeb3888ba6d1f01)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.3 - ([50b8ce7](https://github.com/sRavioli/nvim/commit/50b8ce7c2d6115fe9a6a09789d7f539f4c66e2df)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.2 - ([e40ea2b](https://github.com/sRavioli/nvim/commit/e40ea2b3bfc4798ed22d1eb1f6bc6b257f66fdd8)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.1 - ([7451766](https://github.com/sRavioli/nvim/commit/74517665c341a58814e82adfbba91f2248c98974)) - [@sRavioli](https://github.com/sRavioli)
- **(version)** 0.7.0 - ([f883273](https://github.com/sRavioli/nvim/commit/f883273c2c1c7a3527da43d7e6f35b3df6dd2ab1)) - [@sRavioli](https://github.com/sRavioli)
- add yamlfix file - ([05839bc](https://github.com/sRavioli/nvim/commit/05839bc095a0ed6867c30a1d0be1bae6a2ca3a4c)) - [@sRavioli](https://github.com/sRavioli)

#### Refactoring

- **(github)** rewrite release workflow - ([1d5d09c](https://github.com/sRavioli/nvim/commit/1d5d09c442dc03f108fdef991bcad2b3f45b98d3)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.5](https://github.com/sRavioli/nvim/compare/0.7.4..0.7.5) - 2023-07-06

#### Hotfixes

- **(cog)** remove old configs - ([39a2064](https://github.com/sRavioli/nvim/commit/39a2064fc3e63b41b4eec0c486e83ff7055dce36)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.4](https://github.com/sRavioli/nvim/compare/0.7.3..0.7.4) - 2023-07-06

#### Hotfixes

- **(cog)** use correct git push command - ([9c93656](https://github.com/sRavioli/nvim/commit/9c936568b356934358a1a1efea9047bdb0f5d55d)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.3](https://github.com/sRavioli/nvim/compare/0.7.2..0.7.3) - 2023-07-06

#### Bug Fixes

- **(cog)** keep cog config up to date - ([56c072c](https://github.com/sRavioli/nvim/commit/56c072c972542c2c8a5b9c12cbd2a360bc97d09d)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.2](https://github.com/sRavioli/nvim/compare/0.7.1..0.7.2) - 2023-07-06

#### Bug Fixes

- **(github)** auto release workflow formatting - ([5c291a4](https://github.com/sRavioli/nvim/commit/5c291a43e15f8379471749876cf0a80800f2d6f1)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.1](https://github.com/sRavioli/nvim/compare/0.7.0..0.7.1) - 2023-07-06

#### Hotfixes

- **(github)** move action in `workflows/` folder - ([ca63ea0](https://github.com/sRavioli/nvim/commit/ca63ea04f38433ad07ffdee8b55ff1e894846e59)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.7.0](https://github.com/sRavioli/nvim/compare/0.6.0..0.7.0) - 2023-07-06

#### Bug Fixes

- **(lsp)** disable actionlint - ([505a199](https://github.com/sRavioli/nvim/commit/505a1990d470ad310bb0c9ce56f020004dcf0634)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** load correct diagnostic signs - ([c72c32f](https://github.com/sRavioli/nvim/commit/c72c32f993dca812c70f2e2075f78dffb2b268aa)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** incorrect null-ls symbol spacing - ([9264745](https://github.com/sRavioli/nvim/commit/92647451d24a7906090e858f71da1196443f02f2)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(github)** add auto release action - ([72ce306](https://github.com/sRavioli/nvim/commit/72ce306b780ba6ffb82a80fdb99f331148f28fba)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- add yamlfix file - ([05839bc](https://github.com/sRavioli/nvim/commit/05839bc095a0ed6867c30a1d0be1bae6a2ca3a4c)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.5.0](https://github.com/sRavioli/nvim/compare/0.4.0..0.5.0) - 2023-07-04

#### Bug Fixes

- **(cmp)** add rg as source and remove diagraph - ([ca867df](https://github.com/sRavioli/nvim/commit/ca867dfda91bc90aedfb91e8cfd8a40074f31e74)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** description spacing - ([cff0502](https://github.com/sRavioli/nvim/commit/cff0502911a5de1439e24d3c0b11334571564436)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** load leap on keymaps, change config - ([be387c1](https://github.com/sRavioli/nvim/commit/be387c1f7e4d3ccddc0be19ee1087c88562a11aa)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(keymaps)** change plugins keymaps - ([0ebdcd7](https://github.com/sRavioli/nvim/commit/0ebdcd76ad2bdb9714801a525e0406beab7945e4)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install trouble - ([6852bf1](https://github.com/sRavioli/nvim/commit/6852bf166a7283a448cd4e60bd0100cad157caa0)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** change some events - ([b551270](https://github.com/sRavioli/nvim/commit/b5512707776c65adbd7b1e0583fe10df39d713b3)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** add which-key groups, and register them - ([e675b76](https://github.com/sRavioli/nvim/commit/e675b768a33afae21253429f8912fb00534579a4)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(cmp)** uninstall diagraph source - ([4364fba](https://github.com/sRavioli/nvim/commit/4364fbae3242e6aef25ea496dfd9d8ce1bb6df4e)) - [@sRavioli](https://github.com/sRavioli)

#### Refactoring

- move everything to user folder (`srv`) - ([eb07517](https://github.com/sRavioli/nvim/commit/eb0751788ebd956ba31c7b91fd571f85f563c2d5)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.4.0](https://github.com/sRavioli/nvim/compare/0.3.0..0.4.0) - 2023-07-03

#### Bug Fixes

- **(lsp)** remove signs from `on_attach()` since they are loaded globally - ([3505793](https://github.com/sRavioli/nvim/commit/3505793ac29ec23aafb472a97d3dfeb8a2f21f0f)) - [@sRavioli](https://github.com/sRavioli)
- **(lualine)** require signs, rewrite lsp progress function - ([8ffa655](https://github.com/sRavioli/nvim/commit/8ffa6551992416defc12f2ff6d0551814bc32c68)) - [@sRavioli](https://github.com/sRavioli)
- **(lualine)** use preferred diagnostic signs - ([9c11edf](https://github.com/sRavioli/nvim/commit/9c11edf67da6e90f5e223c7349a940799b24b438)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** load correct diagnostic signs - ([2612993](https://github.com/sRavioli/nvim/commit/2612993c3746f4d053dc1255ec70eae88deaad4f)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(preferences)** use more readable diagnostic signs - ([2808508](https://github.com/sRavioli/nvim/commit/2808508951ed6f86aff3ad6271f0f6dd3754c50f)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.3.0](https://github.com/sRavioli/nvim/compare/0.2.0..0.3.0) - 2023-07-03

#### Bug Fixes

- **(cmp)** remove cmp dependencies and sources (doxygen, otter) - ([8f8988e](https://github.com/sRavioli/nvim/commit/8f8988e2b47637b7b8fed455cf1b0aaf96678ccd)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** remove tabnine source - ([d0ec20b](https://github.com/sRavioli/nvim/commit/d0ec20b41ccd0d96eb5c669fd311ab2139ae990b)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** cmp icons are no longer clipped in the menu - ([17b34a2](https://github.com/sRavioli/nvim/commit/17b34a282ecf286607e49145d8575b307b2de415)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** capitalize ctrl key - ([57d9106](https://github.com/sRavioli/nvim/commit/57d91069a35aa68e2e9be9f00d00f40336caab97)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** adjust spacing between icon and description - ([0b69773](https://github.com/sRavioli/nvim/commit/0b69773d2e09a8bb77a17aba878ab2ef6ffdd607)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** change `:` to `<cmd>` - ([952210b](https://github.com/sRavioli/nvim/commit/952210b6c1c0d1224e29351f115aa4845b3d196e)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** disable non functional mapping - ([246ecc3](https://github.com/sRavioli/nvim/commit/246ecc354a3156d5c1fe9b5b8329b4e0c4e8732d)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** change hover mappings, remove definition keymaps - ([53846c7](https://github.com/sRavioli/nvim/commit/53846c73d3edbad80e8d4b4e96784fff59a29736)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** remove nvim-navic (use lspsaga) - ([24a61c5](https://github.com/sRavioli/nvim/commit/24a61c5b1980b6da8526fa77526dc3da58290692)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** change nerdicons confirm mapping - ([a239b52](https://github.com/sRavioli/nvim/commit/a239b524d4cf1df830a462fc7579c7ad55ceb1e3)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** remove EOL symbols for indent-blankline - ([bfbf85d](https://github.com/sRavioli/nvim/commit/bfbf85d8f343b409cf830967d89310f9de4f15f6)) - [@sRavioli](https://github.com/sRavioli)
- **(telescope)** remove find buffers (use barbar), change find in buffer mapping - ([2c0198d](https://github.com/sRavioli/nvim/commit/2c0198d6fc0fe0dd79182b827c2840ea92a9ee17)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** remove barbecue autocommand - ([bac6520](https://github.com/sRavioli/nvim/commit/bac6520907d74a91f5c32b5d6afaff29c4dbf29a)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** nvim does not spam with notification if barbecue is not present - ([f1e1cf6](https://github.com/sRavioli/nvim/commit/f1e1cf6d93750024b6d8aceb13a41c9d5167aec2)) - [@sRavioli](https://github.com/sRavioli)
- use new loading mapping syntax - ([e38dc73](https://github.com/sRavioli/nvim/commit/e38dc737e3165f7ffb6c52dd98c7f633540e7a30)) - [@sRavioli](https://github.com/sRavioli)
- remove barbecue, change hover keymap - ([5ad8b80](https://github.com/sRavioli/nvim/commit/5ad8b801d44a6436fb78c8115a164896218e2752)) - [@sRavioli](https://github.com/sRavioli)
- adopt new mappings syntax - ([233479f](https://github.com/sRavioli/nvim/commit/233479f43cd25fcfe940a8bff76c7c6d08438f12)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(cmp)** add sources - ([cb22397](https://github.com/sRavioli/nvim/commit/cb2239793d25369c6644d247debe8d40fe7b3d0c)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** add dependencies - ([622f8ed](https://github.com/sRavioli/nvim/commit/622f8ed51448c45c18cc96d36ff452acc23d44ee)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** enable ghost text - ([5d623ef](https://github.com/sRavioli/nvim/commit/5d623ef4f14e8cf413f5b0f9e49f119b8c885fa2)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** use new sources, add sorting function - ([45d1310](https://github.com/sRavioli/nvim/commit/45d13105e855c976440a2421bccaa3ff12e597d4)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** load nvim-cmp also on `CmdlineEnter` - ([00bc66c](https://github.com/sRavioli/nvim/commit/00bc66c507164be9af0470d500c3b41572566e91)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** add icons to mappings description - ([722ec61](https://github.com/sRavioli/nvim/commit/722ec611c9ea126074d4ed81d5fc210c8af90283)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** configure lsp further - ([8a41f80](https://github.com/sRavioli/nvim/commit/8a41f80c60ca76c1c900e703a538acf745a6ed71)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** load navic, remove navbuddy - ([582b595](https://github.com/sRavioli/nvim/commit/582b595b3311bee9e4c0cce60433c706e25f69de)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install lsp-lens and symbols-outline - ([75736dc](https://github.com/sRavioli/nvim/commit/75736dc4535138b7fa158379b88119829aa837d3)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install nerdicons - ([972dd2a](https://github.com/sRavioli/nvim/commit/972dd2a64a2a52113664096202bdd248331c6b4a)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install nvim-toggler - ([c12d953](https://github.com/sRavioli/nvim/commit/c12d953c2b8c97ba200c25123174bcd74bda15d3)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** configure lsp servers - ([f088799](https://github.com/sRavioli/nvim/commit/f088799b650f3f9b0474e417dc07fdb22d46e92e)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install indent-blankline - ([60bf014](https://github.com/sRavioli/nvim/commit/60bf0146affb377eff82855a36a28ec96b2d4131)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install barbacue.nvim - ([94631c6](https://github.com/sRavioli/nvim/commit/94631c682920c2e9c8e39bf7896a8674aa6f4aa9)) - [@sRavioli](https://github.com/sRavioli)
- **(preferences)** add more symbols - ([aa8930b](https://github.com/sRavioli/nvim/commit/aa8930bb92153f0f96762b56d9f6c8d9ad37778c)) - [@sRavioli](https://github.com/sRavioli)
- install lsp-progress and add it to lualine - ([2fc83cd](https://github.com/sRavioli/nvim/commit/2fc83cd7f0ba2c5dd1b3d37e819c015cea2bb6ea)) - [@sRavioli](https://github.com/sRavioli)
- source `plugins.lsp.post` module - ([9136500](https://github.com/sRavioli/nvim/commit/91365007b8e7edfeef403a75b97701d13c66636d)) - [@sRavioli](https://github.com/sRavioli)
- define diagnostic symbol globally - ([aa628fd](https://github.com/sRavioli/nvim/commit/aa628fd43dd3611e51b49491d2ccad121586973b)) - [@sRavioli](https://github.com/sRavioli)
- move to `preference.lua` some defaults - ([903cfda](https://github.com/sRavioli/nvim/commit/903cfda4385d85a16808fefffdd94aabccbd0d98)) - [@sRavioli](https://github.com/sRavioli)
- install lspsaga mappings - ([3d7ce84](https://github.com/sRavioli/nvim/commit/3d7ce84a71d50db80d88839239e13e7d5a58791d)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(keymaps)** restore `:` in text (instead of `<cmd>`) - ([6dd7062](https://github.com/sRavioli/nvim/commit/6dd70620edbf2892e52a5b67549ce094c42ff534)) - [@sRavioli](https://github.com/sRavioli)
- formatting - ([eb3570e](https://github.com/sRavioli/nvim/commit/eb3570eda681a9e9189c4b00f045627f3f676eba)) - [@sRavioli](https://github.com/sRavioli)
- format changelog - ([d5f57e4](https://github.com/sRavioli/nvim/commit/d5f57e46f28eb357e8ba829ee5158865be6f175c)) - [@sRavioli](https://github.com/sRavioli)

#### Refactoring

- **(cmp)** add sources for cmdline, search and normal - ([c810351](https://github.com/sRavioli/nvim/commit/c810351857e09084313932546ce4e558a538b933)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** move nvim-cmp dependencies to separate file - ([a257d4f](https://github.com/sRavioli/nvim/commit/a257d4fd3140eb671cd2d731abea860e5734ac1c)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** use lspsaga lua api, add icons to descriptions - ([837b489](https://github.com/sRavioli/nvim/commit/837b489dbfcc2df54a459f3cb83fba9c3b69fb50)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** rename `load_mappings` to `mappings.load` - ([ba56c13](https://github.com/sRavioli/nvim/commit/ba56c130a0e9fa6a6da3719a99e4a39b32b001e8)) - [@sRavioli](https://github.com/sRavioli)
- change `--` comments to `---` - ([8ec23a2](https://github.com/sRavioli/nvim/commit/8ec23a2a06f095e401489e8099b42896049e2716)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.2.0](https://github.com/sRavioli/nvim/compare/0.1.0..0.2.0) - 2023-06-30

#### Features

- **(plugins)** adjust lazy.nvim configuration - ([c653dbe](https://github.com/sRavioli/nvim/commit/c653dbec43127a4da48c7eba3701f77c2ca443f2)) - [@sRavioli](https://github.com/sRavioli)
- add codespell config file - ([c66506b](https://github.com/sRavioli/nvim/commit/c66506b67b31394719df483fc595b86e009b0240)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- update - ([f67fdcc](https://github.com/sRavioli/nvim/commit/f67fdcc4799889473004d0f8d768cd96f2dea94a)) - [@sRavioli](https://github.com/sRavioli)

#### Revert

- format licence to normal status - ([5bc0fc2](https://github.com/sRavioli/nvim/commit/5bc0fc27eb8409b14e0640b8ac48f64ea00868bc)) - [@sRavioli](https://github.com/sRavioli)

- - -

## [0.1.0](https://github.com/sRavioli/nvim/compare/2a32d50bc7d3875995f878c8d34a8e35c11d9e96..0.1.0) - 2023-06-30

#### Bug Fixes

- **(cmp)** make cmp menu single line in cmdline - ([807dd99](https://github.com/sRavioli/nvim/commit/807dd9992805175603ffa3f39053830ca8907697)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** remove documentation border, rm useless winhighlight - ([4ac0889](https://github.com/sRavioli/nvim/commit/4ac088942097f67ead0bd0fbc37db72690e19dc2)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** load function from correct file - ([464ebcd](https://github.com/sRavioli/nvim/commit/464ebcdde1c28812e3a446ce6721fcc3ed1a6d81)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** require correct cmp file - ([9bfb481](https://github.com/sRavioli/nvim/commit/9bfb481a34fba12af5949ccebc7c414336fdbd84)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** rename table to reflect filename - ([b5fe693](https://github.com/sRavioli/nvim/commit/b5fe6936ffee7a5759e4f3a98dc7485f8dcb7a04)) - [@sRavioli](https://github.com/sRavioli)
- **(colorscheme)** remove bg highlight for mason and lazy - ([d925483](https://github.com/sRavioli/nvim/commit/d925483422ca8d509ca1f474356e2b17356a127a)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** change find_files telescope mappings - ([cca5bd9](https://github.com/sRavioli/nvim/commit/cca5bd97db3cb9bb296a6221ce3f3aa0f5b0f480)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** use correct telescope commands, use custom for Ctrl-p - ([44fd206](https://github.com/sRavioli/nvim/commit/44fd206b79292c033d963c87e5b2f41262d96414)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** add todo-comments mappings - ([3c09da1](https://github.com/sRavioli/nvim/commit/3c09da16142d5725d828adcea15deb503e818ed8)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** don't declare variable, return table - ([ed018c5](https://github.com/sRavioli/nvim/commit/ed018c5640eb83909fcd6391227b360d8157013b)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** change neotree open command - ([cb582e4](https://github.com/sRavioli/nvim/commit/cb582e44de4e0f70e88e187cbe176812bf3a78d0)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** remove unused variable - ([83a8d90](https://github.com/sRavioli/nvim/commit/83a8d904ee1698cc4c6c98d08710abc7df6821b2)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** remove severity sort - ([af47efe](https://github.com/sRavioli/nvim/commit/af47efed0a2ad5eedb2715f056d5905bc3e0f9aa)) - [@sRavioli](https://github.com/sRavioli)
- **(lualine)** move diagnostic to right, load on UIEnter - ([09323c8](https://github.com/sRavioli/nvim/commit/09323c80f66f32ab4dbd43cffaa4cb719ab215bf)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** start null-ls on LspAttach - ([27adb75](https://github.com/sRavioli/nvim/commit/27adb7502f20a99b8af003e135850c17a2b6bd99)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** move toggleterm config inside `opts` table - ([a9873e4](https://github.com/sRavioli/nvim/commit/a9873e4735c1d50ebbedfc1404c036044a8e07dc)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** remove toggleterm - ([dbd1c8e](https://github.com/sRavioli/nvim/commit/dbd1c8e5c0899c16ddaf461bd295ba54a404f12e)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** make `dependencies` the last node of a plugin, add events - ([e59a791](https://github.com/sRavioli/nvim/commit/e59a791125bb42f96b44b895c4b01eae1d8abc70)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** fix cmp highlights - ([fd1ad7a](https://github.com/sRavioli/nvim/commit/fd1ad7afe29df3fbf519605b99210144931c43c7)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** require colorscheme for UI components - ([c59d369](https://github.com/sRavioli/nvim/commit/c59d3696f8051a2af32043dba1b15f4cabd26c74)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** set mapleader - ([766f85e](https://github.com/sRavioli/nvim/commit/766f85e92e51c474d83f9d57d9b7409dc14ef05c)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** disable unnamed clipboard (slow otherwise) - ([8b122b7](https://github.com/sRavioli/nvim/commit/8b122b74e22183ce52183f69f1801283bbd0a40d)) - [@sRavioli](https://github.com/sRavioli)
- **(snippets)** remove LuaSnip import and nodes - ([d2d0e87](https://github.com/sRavioli/nvim/commit/d2d0e87f393018dfff23e5dfb17dc10a1d418e9a)) - [@sRavioli](https://github.com/sRavioli)
- **(theme)** remove italic style from comments - ([b8c0cf3](https://github.com/sRavioli/nvim/commit/b8c0cf303ea1ce74bf77de1cb89af51637b9bdcd)) - [@sRavioli](https://github.com/sRavioli)
- **(theme)** make PmenuSel highlight darker - ([7880072](https://github.com/sRavioli/nvim/commit/7880072d609b35feab3084cd61e0d931ccb2e842)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** declare and return table instead of bare return - ([47ff867](https://github.com/sRavioli/nvim/commit/47ff8677ebb66f118ec38daa6e6afbfbbbaeac48)) - [@sRavioli](https://github.com/sRavioli)
- remove useless prints, make syntax shorter - ([8421abc](https://github.com/sRavioli/nvim/commit/8421abc972e3209cab717625ebaa221c54da983f)) - [@sRavioli](https://github.com/sRavioli)
- remove backup folder - ([fe5272c](https://github.com/sRavioli/nvim/commit/fe5272c767d6f4c9e806d2861e73ab5a852c076d)) - [@sRavioli](https://github.com/sRavioli)
- remove lazy-nvim file (moved to `plugins/init.lua`), source plugins - ([134a783](https://github.com/sRavioli/nvim/commit/134a78351a68d1675d98e13524a095d6e2cb75fc)) - [@sRavioli](https://github.com/sRavioli)
- remove `@version`, change module description - ([08a9f17](https://github.com/sRavioli/nvim/commit/08a9f170eeefa4f5a3f19e773048fbb28fcbc4cb)) - [@sRavioli](https://github.com/sRavioli)
- remove useless line - ([7b2b55f](https://github.com/sRavioli/nvim/commit/7b2b55f044ddc78380ad5eb12b8d7766b0f7d67e)) - [@sRavioli](https://github.com/sRavioli)
- add spaces after barbar icons - ([bb21350](https://github.com/sRavioli/nvim/commit/bb21350e54dacaccf377a4f4b7b6f784bbc1f1c1)) - [@sRavioli](https://github.com/sRavioli)
- formatting - ([2053d40](https://github.com/sRavioli/nvim/commit/2053d402559665bd682c2d29068b582d63f255e4)) - [@sRavioli](https://github.com/sRavioli)
- use the new mapping syntax - ([d70ebed](https://github.com/sRavioli/nvim/commit/d70ebed972b54e66cfddc5f565e7e65a0a6c4838)) - [@sRavioli](https://github.com/sRavioli)
- use the load_mappings() function to load mappings - ([aa58cb1](https://github.com/sRavioli/nvim/commit/aa58cb1428a831c1510610aa014cce205e620c84)) - [@sRavioli](https://github.com/sRavioli)
- use correct require path - ([166684d](https://github.com/sRavioli/nvim/commit/166684d7e14b947b023815479cf04651e7cc61c9)) - [@sRavioli](https://github.com/sRavioli)
- load settings before plugins - ([0b5f9dc](https://github.com/sRavioli/nvim/commit/0b5f9dcb3b7c1ad39ec28d41d98d3b9836acf76c)) - [@sRavioli](https://github.com/sRavioli)
- rename prefs to preferences in various requires - ([25f765c](https://github.com/sRavioli/nvim/commit/25f765c31944a40837051b060b416baece4867c2)) - [@sRavioli](https://github.com/sRavioli)
- rename prefs.lua to preferences.lua - ([4e283ce](https://github.com/sRavioli/nvim/commit/4e283ce690e66b6f003cc3db36a1c178d65d922d)) - [@sRavioli](https://github.com/sRavioli)
- set border to preferred style - ([97b164e](https://github.com/sRavioli/nvim/commit/97b164ef4f5e490c5cae5761089d1ffec1fc60a5)) - [@sRavioli](https://github.com/sRavioli)

#### Features

- **(cmp)** install otter.nvim and add it to cmp sources - ([5bbd85c](https://github.com/sRavioli/nvim/commit/5bbd85cee7a8a3d31fbb73088b68409ee872fceb)) - [@sRavioli](https://github.com/sRavioli)
- **(cmp)** auto select first entry - ([76e944a](https://github.com/sRavioli/nvim/commit/76e944a39ca7574abe40171f9c7a23c146f47536)) - [@sRavioli](https://github.com/sRavioli)
- **(colorscheme)** override hi groups for barbar, remove bg_gutter - ([2aa179e](https://github.com/sRavioli/nvim/commit/2aa179ea3a520dce4fe00e14574069a4520acc33)) - [@sRavioli](https://github.com/sRavioli)
- **(config)** add files for settings - ([fcca3d1](https://github.com/sRavioli/nvim/commit/fcca3d175d442929015a32f565be3114aa47ad44)) - [@sRavioli](https://github.com/sRavioli)
- **(configs)** add nvim-cmp - ([21c6c0c](https://github.com/sRavioli/nvim/commit/21c6c0cb9002e724f8a9eae698ae440902809073)) - [@sRavioli](https://github.com/sRavioli)
- **(gitignore)** ignore `.luarc.json` - ([091f82b](https://github.com/sRavioli/nvim/commit/091f82bb9adff1e94a84c67179dfb7e2aff9e94c)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** add toggleterm mappings - ([04c244f](https://github.com/sRavioli/nvim/commit/04c244fccedf94f621274beba9d58b303c058952)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** add telescope mappings - ([35bc3f4](https://github.com/sRavioli/nvim/commit/35bc3f4866b09e48abf4002f803d15e09f2eda6d)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** fix mappings, add undo break-points - ([ae139cb](https://github.com/sRavioli/nvim/commit/ae139cbe98d6c614bfdba3a7eb7b06739947902f)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** change neo-tree mapping to toggle - ([ea33562](https://github.com/sRavioli/nvim/commit/ea3356286a412db8cd4d37da0eafcf660342e134)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** add neotree mappings - ([1b87647](https://github.com/sRavioli/nvim/commit/1b8764767f96b40d8b6f530834736fd640fe097c)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** add LSP mapings - ([9e6737e](https://github.com/sRavioli/nvim/commit/9e6737ea49776762e5a7eb174a1476ce7b32aff9)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** source treesitter mappings - ([1898c5e](https://github.com/sRavioli/nvim/commit/1898c5eb1213741a01a4662a61c390b2f0296cb6)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** source barbar mappings - ([13b78fb](https://github.com/sRavioli/nvim/commit/13b78fbb68ed09fcf58fb0357874e4e4e1c526e3)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** add barbar mappings - ([195cd89](https://github.com/sRavioli/nvim/commit/195cd89d44970657935479cd1587ac21ec241ff2)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** add basic mappings - ([3c78b31](https://github.com/sRavioli/nvim/commit/3c78b312edaff4c3d1b48ba5df051d3144949f23)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** enable neodev - ([c5a7192](https://github.com/sRavioli/nvim/commit/c5a71929cb8e070e9bc89970b59b9ce64655db03)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** only show popup window, severity sort gutter signs - ([a991981](https://github.com/sRavioli/nvim/commit/a991981ff9617d09b9c362fc9dee812ece5ce2c0)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** safe require, customize capabilities - ([a83aebf](https://github.com/sRavioli/nvim/commit/a83aebfd2b6c029d4378fd61485580f49af6c059)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** add workspace library files - ([fe8ebbf](https://github.com/sRavioli/nvim/commit/fe8ebbfffd63daa7c2f45343b80446f58be12bca)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** load lsp mapping when attaching to buffer - ([ee600e4](https://github.com/sRavioli/nvim/commit/ee600e493c452a9a7bfee399e813d51c366770d8)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** add cmp to lsp setup - ([408ac63](https://github.com/sRavioli/nvim/commit/408ac636123bc62bc2e4d9f0a3524e69b3f0c42b)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install nvim-spectre - ([8c5f973](https://github.com/sRavioli/nvim/commit/8c5f9734bb71d550f71c1f89790173e691ef5f34)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install nvim-dap-ui - ([efd1679](https://github.com/sRavioli/nvim/commit/efd16799eb707913e0a5a5d42a5608869e4a615f)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install dap - ([200075b](https://github.com/sRavioli/nvim/commit/200075b4b09ecbb73f3049507d345600852a87c6)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install toggleterm - ([ca4117f](https://github.com/sRavioli/nvim/commit/ca4117f875cb02bf20eba1de537d3e81412fbf25)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** add telescope configurations - ([07e9279](https://github.com/sRavioli/nvim/commit/07e9279dfabcf05e4d93cc13b1991e9a3ad82d69)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install neorg - ([c7ba532](https://github.com/sRavioli/nvim/commit/c7ba53212cbd4fef73bfa71b3872356ea47a5168)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** add nvim-dap (not enabled) - ([66c6440](https://github.com/sRavioli/nvim/commit/66c6440d55ac0c86e822cd1383abf70566d9184b)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install leap.nvim - ([320177d](https://github.com/sRavioli/nvim/commit/320177d463c8b5ed6b5086609435355bd3c06a43)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install telescope - ([8467fc5](https://github.com/sRavioli/nvim/commit/8467fc5dfc3c6699bdee9d77b21d394262146b87)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install Comment.nvim - ([b9f1421](https://github.com/sRavioli/nvim/commit/b9f1421cfb505272a938dd39a046bf646144cb2b)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** move gitsigns to editor folder - ([e4f1153](https://github.com/sRavioli/nvim/commit/e4f11535ba3fe9ba1b90fd550eaf0913d25ee523)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install nvim-autopairs, add it to cmp - ([4f3d9a0](https://github.com/sRavioli/nvim/commit/4f3d9a08a5a31fbf86265263e8f4e901f345bc84)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install neo-tree and null-ls - ([5944eb4](https://github.com/sRavioli/nvim/commit/5944eb453f0f1cff194777e992527e805ba07dea)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** add events for nvim-lspconfig - ([0259e08](https://github.com/sRavioli/nvim/commit/0259e087ce832491bc6869cacc6cf7889f8f161a)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** activate cmp-doxygen, configure LuaSnip - ([ef7f20d](https://github.com/sRavioli/nvim/commit/ef7f20d13e0fef4784989c9d26f79cb148886077)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** customize lualine - ([668f4be](https://github.com/sRavioli/nvim/commit/668f4be5028e2f59d2797866214f6e05a1e799d4)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install and configure minimally lualine - ([4dc535f](https://github.com/sRavioli/nvim/commit/4dc535f715256ab6bb387b3cb4124919db9b6e5c)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** add comment separators - ([b82f08c](https://github.com/sRavioli/nvim/commit/b82f08c0cb6263b800feccc922ac805ce245b589)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install and configure barbar.nvim - ([f2b52a0](https://github.com/sRavioli/nvim/commit/f2b52a0a89be34ae1380e9e646ae9754dea8ccb9)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** make neodev options local - ([729d78e](https://github.com/sRavioli/nvim/commit/729d78e9a0ff902e798d32cd07f2a52bcaabc768)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** add colorscheme (kanagawa), add mason and neodev - ([e5620dd](https://github.com/sRavioli/nvim/commit/e5620dd2f9c6bd9b44a320d22afc032db9eaf949)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install lazy.nvim - ([0c0b713](https://github.com/sRavioli/nvim/commit/0c0b7130f4e6bfe7059cad6bd32000f08321eb71)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** switch to unnamedplus clipboard - ([f9c1f5b](https://github.com/sRavioli/nvim/commit/f9c1f5b0b95063102860c822c42eb00c0cdf91b9)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** add pumblend option - ([e447d8e](https://github.com/sRavioli/nvim/commit/e447d8ec9daba7854d1acacb328dd84ce772e664)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** load luasnip snippets - ([7049aa2](https://github.com/sRavioli/nvim/commit/7049aa2c2703f7745e25534826c73870314c78d5)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** add paths to neovim providers - ([ced6e21](https://github.com/sRavioli/nvim/commit/ced6e21dad9ba1a2da88c153639712f0704c3149)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** do not show vim mode - ([afb362f](https://github.com/sRavioli/nvim/commit/afb362f02199d03493bc4f14ad5fe59639426bdc)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** add mason binaries to path - ([3146989](https://github.com/sRavioli/nvim/commit/314698934cde16fdf349f3ba68e07bf3f085f450)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** use termgui colors - ([32b06ee](https://github.com/sRavioli/nvim/commit/32b06ee39b87c3afe935b4985a8f522de53eba12)) - [@sRavioli](https://github.com/sRavioli)
- **(syntax)** add pseudocode builtin - ([6393040](https://github.com/sRavioli/nvim/commit/6393040b5c18b52e6aa2c648b0f52e650cd8649f)) - [@sRavioli](https://github.com/sRavioli)
- **(theme)** add blending and make barbar pick bold - ([dda8d7f](https://github.com/sRavioli/nvim/commit/dda8d7ff96871dfa5ebb2215113446f72bb5213b)) - [@sRavioli](https://github.com/sRavioli)
- **(theme)** add cmp highlights - ([3561f75](https://github.com/sRavioli/nvim/commit/3561f757c25caf3ef34aa51801cbbbcba7beccfe)) - [@sRavioli](https://github.com/sRavioli)
- **(theme)** add barbar highlight groups - ([4717940](https://github.com/sRavioli/nvim/commit/471794015f5290ad717ca95cc9b06b8b81ba2fd3)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** add Lazy module to lualine - ([1e29426](https://github.com/sRavioli/nvim/commit/1e294261c58021e16e1f3de70acbfb100d2a4621)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add various telescope function, organize in sections - ([4029580](https://github.com/sRavioli/nvim/commit/40295805b16cd69b43fe1e3fc0f0c5edacc0b7fe)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add fn to retrieve OS - ([b2cf71b](https://github.com/sRavioli/nvim/commit/b2cf71b2045800467f734bfb25895a8d644ba7bd)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add null_ls function to format buffer asynchronously - ([4b2c73c](https://github.com/sRavioli/nvim/commit/4b2c73c56fb67df0f4557bc53e946f841515cecb)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add function to severity sort icons - ([bbe9e9a](https://github.com/sRavioli/nvim/commit/bbe9e9ae4c55d34f254cb11e7d6529d6bd02d0ac)) - [@sRavioli](https://github.com/sRavioli)
- install hover.nvim, use its keymaps - ([bd91001](https://github.com/sRavioli/nvim/commit/bd910010dc6d331a930aacb4d6821ab1e6c0e927)) - [@sRavioli](https://github.com/sRavioli)
- sort modules in ascending order - ([e767a64](https://github.com/sRavioli/nvim/commit/e767a6417a48268367f39ee96366791552534cbc)) - [@sRavioli](https://github.com/sRavioli)
- install todo-comments and add mappings - ([7252abf](https://github.com/sRavioli/nvim/commit/7252abfb6fe94d001e29f900c8c56715205f533b)) - [@sRavioli](https://github.com/sRavioli)
- source editor module - ([0def135](https://github.com/sRavioli/nvim/commit/0def1352cae3afde2521efb0d5aa46415380af86)) - [@sRavioli](https://github.com/sRavioli)
- add pseudocode syntax file - ([ea320e1](https://github.com/sRavioli/nvim/commit/ea320e1b20865a4b97e00a7860101d9d858f2264)) - [@sRavioli](https://github.com/sRavioli)
- install and configure gitsigns - ([a2905c8](https://github.com/sRavioli/nvim/commit/a2905c89925d8957c6c9c94eb49e498295984fe1)) - [@sRavioli](https://github.com/sRavioli)
- load neovim providers - ([a390efb](https://github.com/sRavioli/nvim/commit/a390efbbbce6aa012afdfafa36782231bdfcd78c)) - [@sRavioli](https://github.com/sRavioli)
- lazy load plugin mappings on their startup - ([77d6ab8](https://github.com/sRavioli/nvim/commit/77d6ab83cb0520bded845da0cfed35ba09ae8ae7)) - [@sRavioli](https://github.com/sRavioli)
- add neo-tree config - ([d0c4b5d](https://github.com/sRavioli/nvim/commit/d0c4b5dcec1edb72acaf18e84890b997de163604)) - [@sRavioli](https://github.com/sRavioli)
- load neo-tree config - ([bfe54b8](https://github.com/sRavioli/nvim/commit/bfe54b83fb8f490fb2cfc42ab78be445e11ec204)) - [@sRavioli](https://github.com/sRavioli)
- add neo-tree and null-ls configs - ([a15bcef](https://github.com/sRavioli/nvim/commit/a15bcefeb2f49e389def202f26eee7efbc361f37)) - [@sRavioli](https://github.com/sRavioli)
- enable cmp doxygen source - ([4f36c9a](https://github.com/sRavioli/nvim/commit/4f36c9a5fdfb23599f87b490f8808067d9e895af)) - [@sRavioli](https://github.com/sRavioli)
- configure LuaSnip - ([114946d](https://github.com/sRavioli/nvim/commit/114946d73942c66f3229d65bfc14cd9cd6a841ec)) - [@sRavioli](https://github.com/sRavioli)
- lazy load tree-sitter mappings - ([cd24d04](https://github.com/sRavioli/nvim/commit/cd24d0412cefabd1654f4bf199d49bafca175bdd)) - [@sRavioli](https://github.com/sRavioli)
- lazy load barbar mappings - ([be11f88](https://github.com/sRavioli/nvim/commit/be11f88247d17e958a4d7e2a37ea438813b7b8f5)) - [@sRavioli](https://github.com/sRavioli)
- implement function to load mappings - ([8257327](https://github.com/sRavioli/nvim/commit/8257327ec9a5dd4442900de45909521fcfb3b7fa)) - [@sRavioli](https://github.com/sRavioli)
- install nvim-treesitter, add mappings and config - ([5d96d48](https://github.com/sRavioli/nvim/commit/5d96d481ae60469cd001fd2b6906cd5736f3306b)) - [@sRavioli](https://github.com/sRavioli)
- require user autocommands - ([927f93f](https://github.com/sRavioli/nvim/commit/927f93fd5e6770d9c705bfd9f09d1fb30872c95f)) - [@sRavioli](https://github.com/sRavioli)
- create assets folder, add preferred border style - ([367f24e](https://github.com/sRavioli/nvim/commit/367f24e1a4888ba18a100baba9047701a28b51d0)) - [@sRavioli](https://github.com/sRavioli)

#### Miscellaneous Chores

- **(config)** add settings file - ([7a4e4f8](https://github.com/sRavioli/nvim/commit/7a4e4f8ec3617d6cf6c5db3cec209b7400d352a2)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** adjust spacing, lazy load - ([4078cd7](https://github.com/sRavioli/nvim/commit/4078cd7713e2ab2989773fbbb42494368dc7a981)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** import old mappings - ([cd42c95](https://github.com/sRavioli/nvim/commit/cd42c95f192473281c05ff7eaf8b138471925070)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** import all editor mappings from prev config - ([0ff68f4](https://github.com/sRavioli/nvim/commit/0ff68f40c0783fc6037a8b6b8d8b1d174a1ab29a)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** add lua_ls configuration - ([3161319](https://github.com/sRavioli/nvim/commit/3161319474dcb8201ac5aceb5863a819264f257f)) - [@sRavioli](https://github.com/sRavioli)
- add changelog - ([ec19249](https://github.com/sRavioli/nvim/commit/ec19249d9b4039e98663cb5b209ef8f4fb413a5a)) - [@sRavioli](https://github.com/sRavioli)
- adjust formatting - ([4a2fbd2](https://github.com/sRavioli/nvim/commit/4a2fbd2d76bd80650b495b62eb53aa4f40ad6416)) - [@sRavioli](https://github.com/sRavioli)
- import snippets from prev config - ([881887b](https://github.com/sRavioli/nvim/commit/881887b8157a54063567f1ea1abd0f12624ada1e)) - [@sRavioli](https://github.com/sRavioli)
- import augroups, autocmds and fns from prev config - ([434b7c7](https://github.com/sRavioli/nvim/commit/434b7c7044aea7d7330810df7c8d11e80e820f64)) - [@sRavioli](https://github.com/sRavioli)
- import lsp setup from old config - ([d238186](https://github.com/sRavioli/nvim/commit/d2381864591e4daad20f09022839f93b6fb24318)) - [@sRavioli](https://github.com/sRavioli)
- import old settings - ([3fda48f](https://github.com/sRavioli/nvim/commit/3fda48f12806aa13576aaac95c5e901e998aeed8)) - [@sRavioli](https://github.com/sRavioli)
- add mason-lspconfig configuration - ([e389c64](https://github.com/sRavioli/nvim/commit/e389c64fa10fc9300271233ccd8ac174b22a13da)) - [@sRavioli](https://github.com/sRavioli)
- add license - ([336a7bf](https://github.com/sRavioli/nvim/commit/336a7bf4317f59b90fbf6f171419a72a81a847fe)) - [@sRavioli](https://github.com/sRavioli)
- add sylua configuration file - ([8681ec5](https://github.com/sRavioli/nvim/commit/8681ec55f47db14cddeba187ca2737b6973a01f5)) - [@sRavioli](https://github.com/sRavioli)
- add gitignore - ([e555cd9](https://github.com/sRavioli/nvim/commit/e555cd961c16cfe4a75baadb14ae1736f2161c3f)) - [@sRavioli](https://github.com/sRavioli)

#### Refactoring

- **(keymaps)** rename `editor.lua` to `nvim.lua` - ([a803bdc](https://github.com/sRavioli/nvim/commit/a803bdcacf98f4298d9e5a26b0726507f16fd949)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** lazy load plugins on keymaps, not on events - ([b406462](https://github.com/sRavioli/nvim/commit/b406462da30206bb02512eb2b96b1dfc18eae467)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** adapt lazy-nvim plugins syntax, organize plugins better - ([b9a471b](https://github.com/sRavioli/nvim/commit/b9a471b7a9b6f590fb50f0a3db0e0fbcbc7f4167)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** configure cmp in separate folder - ([81c29f4](https://github.com/sRavioli/nvim/commit/81c29f412c8f906afa23a90298d49456a3e15f11)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** setup dependencies directly in main plugin dependencies table - ([eea7afc](https://github.com/sRavioli/nvim/commit/eea7afce4b34e6eea7f290550b211186e3c91a04)) - [@sRavioli](https://github.com/sRavioli)
- use `M` table, remove `@version` tag, add functions - ([f256304](https://github.com/sRavioli/nvim/commit/f256304adf72b79ef2ac6e6ab250495027703005)) - [@sRavioli](https://github.com/sRavioli)
- move mason.nvim config out of mason-lspconfig - ([fb82239](https://github.com/sRavioli/nvim/commit/fb822397a1ece00f73a0dc78ad33d8a01db97172)) - [@sRavioli](https://github.com/sRavioli)
- move border preference from assets to preference file - ([394f6cc](https://github.com/sRavioli/nvim/commit/394f6ccdadad5f0ca451ab049e3008e0b3209afb)) - [@sRavioli](https://github.com/sRavioli)

#### Revert

- load null-ls on BufWinEnter - ([2c866a1](https://github.com/sRavioli/nvim/commit/2c866a1eba591c6fc0b205c0fd1f4f0e991add05)) - [@sRavioli](https://github.com/sRavioli)

- - -

- - -
Changelog generated by [cocogitto](https://github.com/cocogitto/cocogitto).
