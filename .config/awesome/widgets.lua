--
-- Setup widgets
--


local f = io.popen("ip link")
local network_list = f:read("*all")
f:close()
has_wifi = (network_list:match("wlan%d") ~= nil)

-- Create  main menu
--
mymainmenu = awful.menu(
    {
        items = {
            {"restart", awesome.restart},
            {"quit", awesome.quit},
            {"--------", ""},
            {"open terminal", terminal}},
    })

-- Create tag list
--
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
    awful.button({}, 1, awful.tag.viewonly),
    awful.button({modkey}, 1, awful.client.movetotag),
    awful.button({}, 3, function(tag) tag.selected = not tag.selected end),
    awful.button({modkey}, 3, awful.client.toggletag),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
    )

-- Create task list
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
    awful.button({}, 1, function(c)
        if not c:isvisible() then
            awful.tag.viewonly(c:tags()[1])
        end
        client.focus = c
        c:raise()
        end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
        if client.focus then client.focus:raise() end
        end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
        if client.focus then client.focus:raise() end
        end))

-- CPU usage
--
function colorize(txt, clr)
    return "<span color='" .. clr .. "'>" .. txt .. "</span>"
end

cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget,
                 vicious.widgets.cpu,
                 function (w, args)
                    local function getcolor (a)
                        clr = theme.cpu_idle
                        if     a >= 90 then
                            clr = theme.cpu_max
                        elseif a >= 60 then
                            clr = theme.cpu_high
                        elseif a >= 30 then
                            clr = theme.cpu_mid
                        elseif a >= 10 then
                            clr = theme.cpu_low
                        end
                        return clr
                    end
                    local function format (n)
                        a = args[n+2]
                        frmt = string.format("%3d%%", a)
                        return colorize("CPU " .. n .. ": ", whi) .. colorize(frmt, getcolor(a))
                    end
                    return format(0) .. " " .. format(1)
                 end)

-- Date and time
--
-- datewidget = delightful.widgets.datetime:load({})[1]
datewidget = awful.widget.textclock()
datetooltip = awful.tooltip( { objects = { datewidget } })
months = awful.util.pread("cal -h")
datetooltip:set_text(months)

-- Left arrow widget
larrow = wibox.widget.textbox()
larrow:set_markup(" ❬ ")

-- Right arrow widget
rarrow = wibox.widget.textbox()
rarrow:set_markup(" ❭ ")

-- Spacer widget
spacer = wibox.widget.imagebox()
spacer:set_image(theme.spacer)

-- CPU Temp
--
tempwidget = wibox.widget.textbox()
vicious.register(tempwidget, vicious.widgets.thermal,
	function (widget, args)
        tmp = tonumber(args[1])
		if tmp > 0 then
            clr = theme.temp_low
            if tmp >= 80 then
                clr = theme.temp_high
            elseif tmp >= 60 then
                clr = theme.temp_mid
            end
		    str = colorize(tmp .. "°C", clr)
		else
            str = "-"
		end
        return colorize("Temp: ", whi) .. str
	end
	, 2, "thermal_zone0")

-- CPU Frequ
--
freqwidget = wibox.widget.textbox()
vicious.register(freqwidget, vicious.widgets.cpufreq,
	function (widget, args)
        freq = tonumber(args[1])
		if freq > 0 then
            clr = theme.cpu_low
            if freq >= 2200 then
                clr = theme.cpu_max
            elseif freq >= 1600 then
                clr = theme.cpu_high
            elseif freq >= 1200 then
                clr = theme.cpu_mid
            end
            str = string.format("%4d", freq)
		    str = colorize(str .. " MHz", clr)
		else
            str = "-"
		end
        return colorize("Freq: ", whi) .. str
	end
	, 2, "cpu0")

-- Memory
--
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem,
	function (widget, args)
        used = tonumber(args[2])
        total = tonumber(args[3])
        str_used  = colorize(string.format("%4d MB", used), theme.mem_used)
        str_total = colorize(string.format("%4d MB", total), theme.mem_total)
        return colorize("Mem: ", whi) .. str_used .. "/" .. str_total
	end
	, 2)


-- Wifi
--
wifiwidget = wibox.widget.textbox()
if has_wifi then
    vicious.register(wifiwidget, vicious.widgets.wifi,
        function (widget, args)
            return colorize(args["{ssid}"] .. ": ", whi) .. colorize(args["{link}"], blu)
        end
        , 2, "wlan0")
end

-- MPD
--
mpdwidget = wibox.widget.textbox()
vicious.register(mpdwidget, vicious.widgets.mpd,
	function (widget, args)
        return colorize(args["{Artist}"] .. " - ", whi) .. colorize(args["{Title}"], blu)
	end
	, 2)

-- Keyboard
--
kbdcfg = {}
kbdcfg.cmd = "setxkbmap"
kbdcfg.layout = { "de", "de"}
kbdcfg.variant = { nil, "neo"}
kbdcfg.default = nil
kbdcfg.current = 1  -- de is our default layout
kbdcfg.widget = wibox.widget.textbox()
kbdcfg.widget:set_markup(" " .. kbdcfg.layout[kbdcfg.current] .. " ")
kbdcfg.switch = function ()
   kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
   local lyt = kbdcfg.layout[kbdcfg.current]
   local vrt = kbdcfg.variant[kbdcfg.current]
   local cmd = kbdcfg.cmd .. " " .. lyt
   if vrt ~= nil then
      cmd = cmd .. " -variant " .. vrt
   end
   str = vrt ~= nil and vrt or lyt
   if vrt ~= kbdcfg.default then
       str = colorize(vrt, yel)
   end
   kbdcfg.widget:set_markup(str)
   os.execute(cmd)
end

-- Volumen
--
volumewidgets, volumeicons = delightful.widgets.pulseaudio:load({})

-- Network
--
networkstr = colorize("LAN: ", whi) .. colorize('↓ ${eth0 down_kb}', blu) .. " "  .. colorize('↑ ${eth0 up_kb}', yel)
if has_wifit then
    networkstr = networkstr .. colorize("WLAN: ", whi) .. colorize('↓ ${wlan0 down_kb}', blu) .. " "  .. colorize('↑ ${wlan0 up_kb}', yel)
end
networkwidget = wibox.widget.textbox()
vicious.register(networkwidget, vicious.widgets.net, networkstr, 2)

-- Battery
--
batterywidgets, batteryicons = delightful.widgets.battery:load({})

-- Create bottom panel
--
panel_bottom = {}
panel_top = {}
layout_box = {}
prompt_box = {}
for s = 1, screen.count() do
    prompt_box[s] = awful.widget.prompt()
    layout_box[s] = awful.widget.layoutbox(s)
    layout_box[s]:buttons(awful.util.table.join(
            awful.button({}, 1, function() awful.layout.inc(layouts, 1) end),
            awful.button({}, 3, function() awful.layout.inc(layouts, -1) end),
            awful.button({}, 4, function() awful.layout.inc(layouts, 1) end),
            awful.button({}, 5, function() awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    panel_bottom[s] = awful.wibox({position = "bottom", height = 16, screen = s})
    panel_top[s] = awful.wibox({position = "top", height = 16, screen = s})

    local top_layout = wibox.layout.align.horizontal()
    local top_left = wibox.layout.fixed.horizontal()
    local top_right = wibox.layout.fixed.horizontal()
    top_left:add(mytaglist[s])
    top_left:add(rarrow)

    top_right:add(larrow)
    top_right:add(layout_box[s])
    if batteryicons ~= nil then
        top_right:add(larrow)
        top_right:add(batteryicons[1])
    end
    top_right:add(larrow)
    top_right:add(volumeicons[1])
    if has_wifi then
        top_right:add(larrow)
        top_right:add(wifiwidget)
    end
    top_right:add(larrow)
    top_right:add(kbdcfg.widget)
    top_right:add(larrow)
    top_right:add(datewidget)

    top_layout:set_left(top_left)
    top_layout:set_middle(mytasklist[s])
    top_layout:set_right(top_right)
    panel_top[s]:set_widget(top_layout)

    local bottom_layout = wibox.layout.align.horizontal()
    local bottom_left  = wibox.layout.fixed.horizontal()
    local botton_right  = wibox.layout.fixed.horizontal()
    bottom_left:add(cpuwidget)
    bottom_left:add(rarrow)
    bottom_left:add(freqwidget)
    bottom_left:add(rarrow)
    bottom_left:add(tempwidget)
    bottom_left:add(rarrow)
    bottom_left:add(memwidget)
    bottom_left:add(rarrow)
    bottom_left:add(networkwidget)
    bottom_left:add(rarrow)
    bottom_left:add(prompt_box[s])

    botton_right:add(larrow)
    botton_right:add(mpdwidget)

    bottom_layout:set_left(bottom_left)
    bottom_layout:set_right(botton_right)
    panel_bottom[s]:set_widget(bottom_layout)

    panel_bottom[s].screen = s
    panel_top[s].screen = s
end

