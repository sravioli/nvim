# Changelog

All notable changes to this project will be documented in this file.
See [conventional commits](https://www.conventionalcommits.org/) for commit
guidelines.
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