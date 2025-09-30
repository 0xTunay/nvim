# Устранение проблем

## Частые ошибки и их решения

### 1. Ошибка "module not found"
**Проблема**: `module 'plugin-name' not found`
**Решение**: Плагины еще не установлены. Запустите Neovim и дождитесь установки:
```bash
nvim
# Дождитесь завершения установки плагинов
```

### 2. Telescope не работает
**Проблема**: `rg: not found` или `fd: not found`
**Решение**: Установите зависимости:
```bash
# macOS
brew install ripgrep fd

# Ubuntu/Debian
sudo apt install ripgrep fd-find

# Arch Linux
sudo pacman -S ripgrep fd
```

### 3. DAP не работает
**Проблема**: `nvim-dap-ui requires nvim-nio`
**Решение**: Зависимость уже добавлена в конфигурацию. Перезапустите Neovim.

### 4. LSP не работает
**Проблема**: Нет автодополнения или диагностики
**Решение**: Установите LSP сервер:
```bash
# C/C++
brew install clangd

# Или через Mason
:Mason
# Найдите и установите clangd
```

### 5. Which-key не показывает подсказки
**Проблема**: Нет меню с горячими клавишами
**Решение**: 
1. Убедитесь, что плагин установлен
2. Нажмите `<Space>` и подождите 300ms
3. Проверьте конфигурацию: `:checkhealth which-key`

### 6. Проблемы с цветовой схемой
**Проблема**: Неправильные цвета или ошибки
**Решение**: Убедитесь, что `termguicolors` включен:
```lua
vim.opt.termguicolors = true
```

## Проверка конфигурации

### Проверка здоровья плагинов
```vim
:checkhealth
```

### Проверка конкретного плагина
```vim
:checkhealth telescope
:checkhealth which-key
:checkhealth dap
```

### Перезагрузка конфигурации
```vim
:source %
# или
:luafile %
```

## Логи и отладка

### Включение отладки
```vim
:lua vim.lsp.set_log_level("debug")
```

### Просмотр логов LSP
```vim
:lua vim.cmd('edit ' .. vim.lsp.get_log_path())
```

### Проверка установленных плагинов
```vim
:Lazy
```

## Восстановление конфигурации

Если что-то сломалось:

1. Удалите кэш Lazy:
```bash
rm -rf ~/.local/share/nvim/lazy
```

2. Перезапустите Neovim:
```bash
nvim
```

3. Дождитесь установки всех плагинов

4. Проверьте здоровье:
```vim
:checkhealth
```

