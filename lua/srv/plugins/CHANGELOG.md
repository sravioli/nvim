# Changelog
All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

- - -
## [0.6.0](https://github.com/sRavioli/nvim/compare/0.5.0..0.6.0) - 2023-07-06
#### Bug Fixes
- **(cmp)** require correct icons - ([f78619c](https://github.com/sRavioli/nvim/commit/f78619c603f4194129b8aa669f6fdf81c38fbe08)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** change mappings for movig buffers around and ordering by language - ([652817f](https://github.com/sRavioli/nvim/commit/652817f8b983f2ae41ee11445224bfd20a1e06d8)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** spacing, change code action map - ([5fdd03e](https://github.com/sRavioli/nvim/commit/5fdd03ea311878acb7337bf3c080b691171c56fa)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** make buffer mappings use the `<leader>b` prefix - ([87a9e76](https://github.com/sRavioli/nvim/commit/87a9e7645a320157c75e48e59472dcd5a0678a7b)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** use preferences kind icons for symbols-outline - ([6871083](https://github.com/sRavioli/nvim/commit/6871083a0458d16ccd3a1d0f3e8b4f14a9c80aa3)) - [@sRavioli](https://github.com/sRavioli)
- **(lsp)** change Lspsaga hover icon - ([696de5b](https://github.com/sRavioli/nvim/commit/696de5b465b631b289f2e46e6b3fd38cce22f951)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** change spectre keymaps `<leader>sw` -> `<leader>sW` - ([8c13bb4](https://github.com/sRavioli/nvim/commit/8c13bb4e51d3463746063214437235ddaa7100dd)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** remove tabout plugin, interferes with cmp - ([dc2cf2b](https://github.com/sRavioli/nvim/commit/dc2cf2b774507db6d7a9d82a2ae62b543047171a)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** use preferences diagnostic icons for barbar - ([9f3a334](https://github.com/sRavioli/nvim/commit/9f3a334452097b15c2e15ae1ebbfd3a2b052784d)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** use correct autocmd to set `'cc'` for lua files - ([c4e4427](https://github.com/sRavioli/nvim/commit/c4e44272cc364d3ebc6ab6876446c83f400cd897)) - [@sRavioli](https://github.com/sRavioli)
#### Documentation
- **(utils)** make `mappings.load()` params optional - ([b2e18df](https://github.com/sRavioli/nvim/commit/b2e18df65366ff1c36be98fcc68827d1c0ca0f77)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** document `utils/fn.lua`, create `Function` class - ([2a24e7e](https://github.com/sRavioli/nvim/commit/2a24e7e98997c471c556314fd82398508922e7c2)) - [@sRavioli](https://github.com/sRavioli)
- document `utils/augroups.lua` - ([cc0895b](https://github.com/sRavioli/nvim/commit/cc0895bc3ab1dbe0ecd16d3785ceb9cc3f4161e0)) - [@sRavioli](https://github.com/sRavioli)
- import vim help pages for `settings.lua` - ([6f297f5](https://github.com/sRavioli/nvim/commit/6f297f5919c8573995f0cb2957286f8bf9640e87)) - [@sRavioli](https://github.com/sRavioli)
- document `preferences.lua` - ([0510760](https://github.com/sRavioli/nvim/commit/0510760c86c6d44623c45b768c18301dfdb89fd7)) - [@sRavioli](https://github.com/sRavioli)
#### Features
- **(dap)** install dap-mason to bridge mason with dap - ([0e6f17d](https://github.com/sRavioli/nvim/commit/0e6f17dba72f46f329d3c11557eac669fa7dbb98)) - [@sRavioli](https://github.com/sRavioli)
- **(dap)** load dap on keys, add config - ([771dff3](https://github.com/sRavioli/nvim/commit/771dff311b40a764171c7c157c06beaa1d2f1a4c)) - [@sRavioli](https://github.com/sRavioli)
- **(dap)** load dap-ui on keymaps, add config - ([1130660](https://github.com/sRavioli/nvim/commit/1130660b58b974c115fbdf6f334e368a82c38c05)) - [@sRavioli](https://github.com/sRavioli)
- **(keymaps)** add icons to mappings descriptions - ([74026fd](https://github.com/sRavioli/nvim/commit/74026fd16896398841111300e746f428c73adaca)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** add icons to keys descriptions - ([4f8b2b4](https://github.com/sRavioli/nvim/commit/4f8b2b4d47423f857773c8df1672f2ff36e3e030)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** add telescope cmd, modify keys to match which-key groups - ([a4cc728](https://github.com/sRavioli/nvim/commit/a4cc728d8b97c61dd7189377c90bd70d4d9a625f)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** configure leap dependencies, add flit.nvim - ([89ef71f](https://github.com/sRavioli/nvim/commit/89ef71f7984072f3d0ed70f3bbf22881e81ff9a9)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** add excluded filetypes for indent-blankline - ([6a5f98c](https://github.com/sRavioli/nvim/commit/6a5f98ceffac126aa010ad541de2bb07eb7458d4)) - [@sRavioli](https://github.com/sRavioli)
- **(plugins)** install abolish.vim, nvim-surround, tabout.nvim and nvim-biscuits - ([df887f8](https://github.com/sRavioli/nvim/commit/df887f8b00632d4ffb31bba9d4572f710b292c56)) - [@sRavioli](https://github.com/sRavioli)
- **(settings)** add `'colorcolumn'` setting back, load correct icons - ([8ca09f5](https://github.com/sRavioli/nvim/commit/8ca09f58749c9562d28687c6dbefb5e3760427a0)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** add which-key default blocks - ([4ccfb93](https://github.com/sRavioli/nvim/commit/4ccfb934d82bcfb96c6d070514d8e40158bad9b3)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** use preferences icons for neo-tree - ([b42315a](https://github.com/sRavioli/nvim/commit/b42315a096bb616e71c9f072bb947ac63eead1d2)) - [@sRavioli](https://github.com/sRavioli)
- **(utils)** add autocmd to change the colorcolumn in lua files - ([92f0912](https://github.com/sRavioli/nvim/commit/92f09126a00110c00d471e33a694c397c5e93ef1)) - [@sRavioli](https://github.com/sRavioli)
#### Refactoring
- **(preferences)** create Preferences and Icons classes, subdivide latter by scope (dap, git, etc.) - ([d5c1b58](https://github.com/sRavioli/nvim/commit/d5c1b5804aa62ba7752d9536cc261ae1566de46e)) - [@sRavioli](https://github.com/sRavioli)
- **(ui)** move require inside the opts block, use preferences icons - ([a400cc9](https://github.com/sRavioli/nvim/commit/a400cc9cca5c225595279faf07eb33eb5f52ad70)) - [@sRavioli](https://github.com/sRavioli)
#### Revert
- **(lsp)** hover icon spacing - ([6d7fae3](https://github.com/sRavioli/nvim/commit/6d7fae32b2dacd06c393146ecb26f20fbe4c7850)) - [@sRavioli](https://github.com/sRavioli)

- - -

Changelog generated by [cocogitto](https://github.com/cocogitto/cocogitto).