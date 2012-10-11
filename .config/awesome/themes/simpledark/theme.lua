-- THEME simpledark

require("colors")

theme = {}

theme.font          = "Terminus 8"

theme.bg_normal     = trblk
theme.bg_focus      = trblk
theme.bg_urgent     = red
theme.bg_minimize   = trblk

theme.fg_normal     = blu
theme.fg_focus      = bryel
theme.fg_urgent     = trwhi
theme.fg_minimize   = blk

-- cpu widget
theme.cpu_idle = "#113445"
theme.cpu_low  = "#174961"
theme.cpu_mid  = "#1F6080"
theme.cpu_high = "#2B86B2"
theme.cpu_max  = "#38AFE8"

-- temp widget
theme.temp_low  = "#BE6F00"
theme.temp_mid  = "#ED8B00"
theme.temp_high = "#FCA426"

theme.delightful_net_up   = yel
theme.delightful_net_down = blu

theme.mem_used  = yel
theme.mem_total = blu

theme.border_width  = "1"
theme.border_normal = trblk
theme.border_focus  = blu
theme.border_marked = yel


theme.spacer      = "/home/patrick/.config/awesome/themes/simpledark/icons/seperator/line.png"
theme.arrow_left  = "/home/patrick/.config/awesome/themes/simpledark/icons/seperator/arrow_left.png"
theme.arrow_right = "/home/patrick/.config/awesome/themes/simpledark/icons/seperator/arrow_right.png"

theme.delightful_battery_ac     = "/home/patrick/.config/awesome/themes/simpledark/icons/battery/ac.png"
theme.delightful_battery_full   = "/home/patrick/.config/awesome/themes/simpledark/icons/battery/full.png"
theme.delightful_battery_medium = "/home/patrick/.config/awesome/themes/simpledark/icons/battery/medium.png"
theme.delightful_battery_low    = "/home/patrick/.config/awesome/themes/simpledark/icons/battery/low.png"

theme.delightful_vol_max  = "/home/patrick/.config/awesome/themes/simpledark/icons/volume/max.png"
theme.delightful_vol_med  = "/home/patrick/.config/awesome/themes/simpledark/icons/volume/medium.png"
theme.delightful_vol_min  = "/home/patrick/.config/awesome/themes/simpledark/icons/volume/min.png"
theme.delightful_vol_zero = "/home/patrick/.config/awesome/themes/simpledark/icons/volume/zero.png"
theme.delightful_vol_mute = "/home/patrick/.config/awesome/themes/simpledark/icons/volume/mute.png"

theme.layout_tile       = "/home/patrick/.config/awesome/themes/simpledark/layouts/tile.png"
theme.layout_tileleft   = "/home/patrick/.config/awesome/themes/simpledark/layouts/tileleft.png"
theme.layout_tilebottom = "/home/patrick/.config/awesome/themes/simpledark/layouts/tilebottom.png"
theme.layout_tiletop    = "/home/patrick/.config/awesome/themes/simpledark/layouts/tiletop.png"
theme.layout_fairv      = "/home/patrick/.config/awesome/themes/simpledark/layouts/fairv.png"
theme.layout_fairh      = "/home/patrick/.config/awesome/themes/simpledark/layouts/fairh.png"
theme.layout_spiral     = "/home/patrick/.config/awesome/themes/simpledark/layouts/spiral.png"
theme.layout_dwindle    = "/home/patrick/.config/awesome/themes/simpledark/layouts/dwindle.png"
theme.layout_max        = "/home/patrick/.config/awesome/themes/simpledark/layouts/max.png"
theme.layout_fullscreen = "/home/patrick/.config/awesome/themes/simpledark/layouts/fullscreen.png"
theme.layout_magnifier  = "/home/patrick/.config/awesome/themes/simpledark/layouts/magnifier.png"
theme.layout_floating   = "/home/patrick/.config/awesome/themes/simpledark/layouts/floating.png"

-- TAGLIST
theme.taglist_squares_sel   = "/home/patrick/.config/awesome/themes/simpledark/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/patrick/.config/awesome/themes/simpledark/taglist/squarew.png"

-- TASKLIST
theme.tasklist_floating_icon = "/home/patrick/.config/awesome/themes/simpledark/tasklist/floatingw.png"

-- MENU
theme.menu_submenu_icon = "/home/patrick/.config/awesome/themes/simpledark/submenu.png"
theme.menu_border_color = blk
theme.menu_height = "14"
theme.menu_width  = "90"

-- WALLPAPER
theme.wallpaper_cmd = { "" }
return theme
