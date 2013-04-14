--
-- Main config file
--

awful = require("awful")
wibox = require("wibox")
root = require("root")
awful.autofocus = require("awful.autofocus")
beautiful = require("beautiful")
naughty = require("naughty")
shifty  = require("shifty")
vicious = require("vicious")
require("delightful.widgets.pulseaudio")
require("delightful.widgets.network")
require("delightful.widgets.battery")
require("delightful.widgets.datetime")

-- useful for debugging, marks the beginning of rc.lua exec
print("Entered rc.lua: " .. os.time())

-- Variable definitions
theme_path = "/home/patrick/.config/awesome/themes/simpledark/theme.lua"

-- Actually load theme
beautiful.init(theme_path)

--terminal = "terminator"
terminal    = "urxvt256c"
filemanager = terminal .. " -e ranger"
compositor  = "unagi"
browser     = "chromium-browser"
musicplayer = terminal .. " -e ncmpcpp"
messenger   = "pidgin"
modkey      = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}

require('screens')
require('apps')
require('widgets')

shifty.taglist = mytaglist
shifty.init()

require('keys')


-- awful.util.spawn(compositor)
