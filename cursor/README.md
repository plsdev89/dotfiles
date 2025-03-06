# Cursor Configuration

This repository contains my personal Cursor configuration files, including custom keybindings and settings optimized for a Vim-like editing experience.

## Settings Overview

- **Theme & Appearance**

  - Theme: One Dark Pro
  - Font: JetBrainsMono Nerd Font (size 18)
  - Material Icon Theme
  - Terminal Font Size: 16

- **Editor Preferences**

  - Format on Save: Enabled
  - Default Formatter: Prettier (for JavaScript, TypeScript, JSON)
  - Non-relative imports for JavaScript/TypeScript
  - Preview mode disabled for new files

- **Vim Configuration**
  - Leader key: `<space>`
  - System clipboard integration enabled
  - EasyMotion enabled
  - Incremental search enabled
  - Custom insert mode escape: `jj`

## Key Bindings

### Navigation

- `ctrl-h` - Navigate left
- `ctrl-l` - Navigate right
- `ctrl-k` - Navigate up
- `ctrl-j` - Navigate down
- `ctrl-n` - Toggle sidebar visibility

### File Explorer (when focused)

- `q` - Close file explorer
- `a` - New file
- `c` - Copy file
- `p` - Paste file
- `x` - Cut file
- `d` - Delete file
- `r` - Rename file
- `shift+w` - Collapse all folders
- `shift+r` - Refresh explorer

### Terminal

- `cmd+t` - New terminal
- `cmd+d` - Split terminal

### Vim Leader Commands

- `<leader>e` - Open explorer
- `<leader>fb` - Show all editors
- `<leader>fe` - Focus open editors
- `<leader>ff` - Quick open file
- `<leader>fw` - Open new search editor
- `<leader>fs` - Show all symbols
- `<leader>bs` - Go to symbol
- `<leader>gg` - Open Lazygit
- `<leader>ca` - Source action
- `<leader>ra` - Rename
- `<leader>x` - Close active editor

### Git Navigation

- `]c` - Next change
- `[c` - Previous change
- `hp` - Next dirty diff

### Other

- `shift+k` - Show hover (in editor)
- `shift+cmd+g` - Open source control

## Additional Features

- Disabled various highlighting features for a cleaner interface:
  - Occurrences highlight
  - Syntax highlighting in copies
  - Folding highlight
  - Bracket pair highlight
  - Active indentation highlight
  - Semantic highlighting

## Extensions

The following extensions are automatically installed:

- QuitControl for VSCode (artdiniz.quitcontrol-vscode)
- Lazygit Integration (chaitanyashahare.lazygit)
- ESLint (dbaeumer.vscode-eslint)
- Prettier (esbenp.prettier-vscode)
- Rainbow CSV (mechatroner.rainbow-csv)
- Docker (ms-azuretools.vscode-docker)
- Material Icon Theme (pkief.material-icon-theme)
- Quicktype (quicktype.quicktype)
- Vim (vscodevim.vim)
- GitBlame (waderyan.gitblame)
- One Dark Pro Theme (zhuangtongfa.material-theme)
