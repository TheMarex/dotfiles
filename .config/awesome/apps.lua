--
-- Matching rules for applications
--
shifty.config.apps = {
    {
        match = {
            class = {
                "Chromium%-browser",
                "Firefox",
            }
        },
        tag = "Web",
    },
    {
        match = {
            class = {
                "Gummi"
            }
        },
        float = false,
        tag = "Office",
    },
    {
        match = {
            class = {
                "Pidgin"
            }
        },
        tag = "IM",
    },
    {
        match = {
            "banshee"
        },
        tag = "Music",
    },
    {
        match = {
            "LibreOffice.*"
        },
        float = false,
        tag = "Office",
    },
    {
        match = {
            "Nautilus"
        },
        tag = "Files",
    },
    {
        match = {
            "Vlc",
            "Totem",
        },
        tag = "Media",
    },
    {
        match = {
            "Transmission",
        },
        tag = "Torrent",
    },
    {
        match = {
            class = {
                "MPlayer",
                "Vlc",
                "Totem",
                "Gimp.*"
            },
        },
        float = true,
        titlebar = true,
    },
    {
        match = {
            "Gimp.*"
        },
        tag = "Image",
        float = false,
    },
    {
        match = {
            "inkscape"
        },
        tag = "Image",
        float = false,
    },
    {
        match = {
            class = {
                "gnome%-panel",
            }
        },
        intrusive = true,
        float = true,
        honorsizehints = true,
    },
    {
        match = {
            class = {
                "clock%-applet",
                "hamster%-applet",
                "Do",
            }
        },
        float = true,
        intrusive = true,
        ontop = true,
    },
    {
        match = {
            class = {
                "VirtualBox",
            },
        },
        tag = "VM",
    },
    {
        match = {
            class = {
                "Update%-manager",
            }
        },
        tag = "Update",
    },
    {
        match = {
            type = {
                "dialog",
            },
        },
        intrusive = true,
    },
    --
    -- Defaults
    --
    {
        match = {""},
        buttons = awful.util.table.join(
            awful.button({}, 1, function (c) client.focus = c; c:raise() end),
            awful.button({modkey}, 1, function(c)
                client.focus = c
                c:raise()
                awful.mouse.client.move(c)
                end),
            awful.button({modkey}, 3, awful.mouse.client.resize)
            )
    },
}

