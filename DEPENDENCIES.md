# Neovim config — setup on a new machine

Clone the repo to the standard config path:

```sh
git clone git@github.com:FrMnJ/nvim.git ~/.config/nvim
```

Then just start `nvim`. `lazy.nvim` bootstraps itself on first launch and installs
the plugins from `lua/config/plugins/`.

## Required

| Dependency | Why |
| --- | --- |
| **Neovim >= 0.11** (tested on 0.12.6) | `vim.lsp.enable`, `vim.lsp.config`, `nvim-treesitter` `main` branch |
| **git** | lazy.nvim bootstrap + plugin install |
| **curl**, **tar**, **unzip** | plugin/parser downloads |
| **make** + **C compiler** (`gcc`/`clang`) | builds `telescope-fzf-native` and Tree-sitter parsers |
| **ripgrep** (`rg`) | Telescope `live_grep` (`<space>fg`) |
| **lua-language-server** | `lua_ls` LSP |
| **typescript-language-server** | `ts_ls` LSP (needs `typescript` too) |
| **node + npm** | runs JS files with `<F5>` and provides TS server |
| **racket** | runs Racket files with `<F5>` |
| **clipboard tool** | `vim.opt.clipboard = "unnamedplus"` — `wl-clipboard` (Wayland) or `xclip` (X11) |
| **Nerd Font** | `mini.statusline` is configured with `use_icons = true` |

Optional but recommended: **fd** (`fd-find`) for faster `find_files`.

## Arch Linux

```sh
sudo pacman -S neovim git make gcc curl tar unzip ripgrep fd \
  nodejs npm lua-language-server typescript-language-server \
  racket wl-clipboard ttf-jetbrains-mono-nerd
```

On X11 use `xclip` instead of `wl-clipboard`.

## Debian / Ubuntu

```sh
sudo apt install neovim git make gcc curl tar unzip ripgrep fd-find \
  nodejs npm wl-clipboard
sudo npm install -g typescript typescript-language-server
```

The `neovim` package in Debian stable is often older than 0.11. If so, install
the official AppImage or the unstable PPA. Install `lua-language-server`
manually from its GitHub releases.

## macOS

```sh
brew install neovim git make curl ripgrep fd node npm lua-language-server \
  racket tree-sitter
brew install --cask font-jetbrains-mono-nerd-font
npm install -g typescript typescript-language-server
```

macOS has a built-in clipboard, so no extra clipboard package is needed.

## Language servers

The config enables these in `lua/config/plugins/lsp.lua`:

- `lua_ls` — Lua
- `ts_ls` — JavaScript / TypeScript

They must be on `$PATH`; no `mason.nvim` is used.

## Tree-sitter parsers

`lua/config/plugins/treesitter.lua` installs `javascript`, `lua`, and `python`
on startup. Building them requires `make` and a C compiler. The `tree-sitter`
CLI is optional.

## Verify after install

```sh
nvim --headless "+checkhealth" +qa
```

Check especially `:checkhealth clipboard`, `:checkhealth lsp`, and
`:checkhealth treesitter`.

To reproduce the exact plugin versions from `lazy-lock.json`, run `:Lazy restore`.

## Notes

- Leader is `<space>`; local leader is `\`.
