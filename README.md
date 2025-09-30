# Neovim Configuration

Полная конфигурация Neovim с современными плагинами для разработки на C++.

## Установка зависимостей

### Системные зависимости
```bash
# macOS
brew install ripgrep fd

# Ubuntu/Debian
sudo apt install ripgrep fd-find

# Arch Linux
sudo pacman -S ripgrep fd
```

### LSP серверы
```bash
# C/C++
brew install clangd

# Или через Mason (встроенный в Neovim)
:Mason
```

### Отладка (DAP)
```bash
# Для C++ отладки
brew install cppdbg

# Или установите через Mason
:Mason
# Затем найдите и установите cppdbg
```

## Установка конфигурации

1. Скопируйте конфигурацию в `~/.config/nvim/`:
```bash
cp -r /path/to/this/config/* ~/.config/nvim/
```

2. Запустите Neovim - Lazy.nvim автоматически установит все плагины:
```bash
nvim
```

## Основные возможности

- 🔍 **Telescope** - мощный поиск файлов и текста
- 🌳 **NeoTree** - файловый менеджер
- 🐛 **DAP** - отладчик для C++
- 📝 **LSP** - автодополнение и диагностика
- 🎨 **Bufferline** - табы буферов
- 🔧 **Git интеграция** - Gitsigns + Fugitive
- ⌨️ **Which-key** - подсказки по горячим клавишам

## Горячие клавиши

См. [KEYBINDINGS.md](KEYBINDINGS.md) для полного списка горячих клавиш.

## Структура конфигурации

```
nvim/
├── init.lua              # Основной файл конфигурации
├── lua/
│   ├── core/             # Основные настройки
│   │   ├── colors.lua    # Цветовые схемы
│   │   ├── mappings.lua  # Горячие клавиши
│   │   ├── plugins.lua   # Управление плагинами
│   │   └── treesitter.lua # Treesitter настройки
│   └── plugins/          # Конфигурации плагинов
│       ├── telescope.lua
│       ├── trouble.lua
│       ├── which-key.lua
│       ├── bufferline.lua
│       ├── dap.lua
│       └── ...
```

