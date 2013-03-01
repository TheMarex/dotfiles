--
-- Setup widgets
--

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
    awful.button({}, 3, function()
        if instance then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({width=250})
        end
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

cpuwidget = widget({ type = "textbox" })
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
datewidget = delightful.widgets.datetime:load({})[1]

-- Left arrow widget
--larrow = widget({ type = "imagebox" })
--larrow.image = image(theme.arrow_left)
larrow = widget({ type = "textbox" })
larrow.text = " ❬ "

-- Right arrow widget
-- rarrow = widget({ type = "imagebox" })
-- rarrow.image = image(theme.arrow_right)
rarrow = widget({ type = "textbox" })
rarrow.text = " ❭ "

-- Spacer widget
spacer = widget({ type = "imagebox" })
spacer.image = image(theme.spacer)

-- Msg Box
--
msgbox = widget({ type = "textbox" })

function new_msg(data)
    print(data)
    msgbox.text = "Bla"
end

print('Adding signal')

function register_d(bus, iface, signal, callback)
	if dbus then
		bus = bus or "session"
		dbus.add_match(bus, "interface='" .. iface .. "' signal='" .. signal  .. "'")
		dbus.add_signal(iface, function (...)
			local argums = {...}
			local data = {}
			for _,v in pairs(argums) do
				if type(v) == "table" then
					for _,iv in pairs(v) do
						table.insert(data, iv)
					end
				else
					table.insert(data, v)
				end
			end

			if callback ~= nil and type(callback) == "function" then
                print("callback")
                callback(data)
			end
		end)
	else
		error("bashets: You are trying to employ dbus, but no dbus api detected in your build of awesome")
	end
end
register_d(nil, "im.pidgin.purple.PurpleInterface", "ReceivedImMsg", new_msg)


-- CPU Temp
--
tempwidget = widget({ type = "textbox" })
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
freqwidget = widget({ type = "textbox" })
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
memwidget = widget({ type = "textbox" })
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
wifiwidget = widget({ type = "textbox" })
vicious.register(wifiwidget, vicious.widgets.wifi,
	function (widget, args)
        return colorize(args["{ssid}"] .. ": ", whi) .. colorize(args["{link}"], blu)
	end
	, 2, "wlan0")

-- MPD
--
mpdwidget = widget({ type = "textbox" })
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
kbdcfg.current = 1  -- us is our default layout
kbdcfg.widget = widget({ type = "textbox", align = "right" })
kbdcfg.widget.text = " " .. kbdcfg.layout[kbdcfg.current] .. " "
kbdcfg.switch = function ()
   kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
   local lyt = kbdcfg.layout[kbdcfg.current]
   local vrt = kbdcfg.variant[kbdcfg.current]
   local cmd = kbdcfg.cmd .. " " .. lyt
   if vrt ~= nil then
      cmd = cmd .. " -variant " .. vrt
   end
   kbdcfg.widget.text = vrt ~= nil and vrt or lyt
   os.execute(cmd)
end

-- Volumen
--
volumewidgets, volumeicons = delightful.widgets.pulseaudio:load({})

-- Network
--
networkwidgets, _ = delightful.widgets.network:load(
                        {
                            excluded_devices = {"p4p1"},
                            update_interval = 1,
                            no_icon = true,
                        })
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
    prompt_box[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    layout_box[s] = awful.widget.layoutbox(s)
    layout_box[s]:buttons(awful.util.table.join(
            awful.button({}, 1, function() awful.layout.inc(layouts, 1) end),
            awful.button({}, 3, function() awful.layout.inc(layouts, -1) end),
            awful.button({}, 4, function() awful.layout.inc(layouts, 1) end),
            awful.button({}, 5, function() awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist.new(s,
                                            awful.widget.taglist.label.all,
                                            mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              local tmptask = { awful.widget.tasklist.label.currenttags(c, s) }
                                              return tmptask[1], tmptask[2], tmptask[3], nil
                                              --return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    panel_bottom[s] = awful.wibox({position = "bottom", height = 16, screen = s})
    panel_top[s] = awful.wibox({position = "top", height = 16, screen = s})

    panel_top[s].widgets = {
        mytaglist[s],
        rarrow,
        {
            datewidget,
            larrow,
            kbdcfg.widget,
            larrow,
            wifiwidget,
            larrow,
            volumeicons[1],
            larrow,
            batteryicons[1],
            larrow,
            layout_box[s],
            larrow,
            mytasklist[s],
            layout = awful.widget.layout.horizontal.rightleft,
        },
        layout = awful.widget.layout.horizontal.leftright
        }
    panel_bottom[s].widgets = {
            cpuwidget,
            rarrow,
            freqwidget,
            rarrow,
            tempwidget,
            rarrow,
            memwidget,
            rarrow,
            networkwidgets[1],
            rarrow,
            msgbox,
            prompt_box[s],
            {
                mpdwidget,
                larrow,
                layout = awful.widget.layout.horizontal.rightleft,
            },
            layout = awful.widget.layout.horizontal.leftright,
        }

    panel_bottom[s].screen = s
    panel_top[s].screen = s
end

