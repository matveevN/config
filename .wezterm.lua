local wezterm = require 'wezterm'

-- Создаем конфигурацию
local config = wezterm.config_builder()

-- Отключаем таб-бар
config.enable_tab_bar = false

-- Устанавливаем размер шрифта
config.font_size = 15.0

-- Устанавливаем шрифт
config.font = wezterm.font('JetBrainsMono Nerd Font')

-- Устанавливаем цвета
config.colors = {
  background = "#000000",            -- цвет фона
  foreground = "#ffffff",            -- основной цвет текста
  cursor_bg = "#ffffff",             -- цвет курсора
  cursor_border = "#ffffff",         -- цвет границы курсора
  cursor_fg = "#000000",             -- цвет текста под курсором
  selection_bg = "#b4d5ff",          -- цвет выделения
  selection_fg = "#000000",          -- цвет текста при выделении
  ansi = {
    "#000000", -- color0  (черный)
    "#cc0000", -- color1  (красный)
    "#4e9a06", -- color2  (зеленый)
    "#c4a000", -- color3  (желтый)
    "#3465a4", -- color4  (синий)
    "#75507b", -- color5  (фиолетовый)
    "#06989a", -- color6  (циан)
    "#d3d7cf", -- color7  (серый)
  },
  brights = {
    "#555753", -- color8  (яркий черный)
    "#ef2929", -- color9  (яркий красный)
    "#8ae234", -- color10 (яркий зеленый)
    "#fce94f", -- color11 (яркий желтый)
    "#729fcf", -- color12 (яркий синий)
    "#ad7fa8", -- color13 (яркий фиолетовый)
    "#34e2e2", -- color14 (яркий циан)
    "#eeeeec", -- color15 (яркий белый)
  },
}


-- Возвращаем конфигурацию
return config
