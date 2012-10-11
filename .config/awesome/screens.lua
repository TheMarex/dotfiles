-- Screen tags/layouts

--
-- Single screen setup
--
if screen.count() == 1 then
    shifty.config.tags = {
        ["Terminal"] = {
            layout      = awful.layout.suit.tile,
            position    = 1,
            init        = true,
        },
        ["Web"] = {
            layout      = awful.layout.suit.max,
            exclusive   = true,
            position    = 2,
            init        = true
        },
        ["IM"] = {
            layout    = awful.layout.suit.tile,
            mwfact    = 0.80,
            exclusive = true,
            position  = 3,
        },
        ["Music"] = {
            layout    = awful.layout.suit.max,
            position  = 4,
            exclusive = true,
            nopop     = true,
        },
        ["Media"] = {
            layout    = awful.layout.suit.float,
            exclusive = false,
            position  = 5,
        },
        ["Image"] = {
            layout    = awful.layout.suit.max,
            exclusive = false,
            position  = 6,
        },
        ["Office"] = {
            layout   = awful.layout.suit.tile,
            position = 6,
        },
        ["Torrent"] = {
            layout    = awful.layout.suit.tile,
            exclusive = true,
            position = 7,
        },
        ["VM"] = {
            layout    = awful.layout.suit.max,
            exclusive = true,
            position = 8,
        },
        ["Files"] = {
            layout    = awful.layout.suit.tile,
            rel_index = 1,
        },
        ["Update"] = {
            layout    = awful.layout.suit.tile,
            rel_index = 1,
        }
    }
--
-- Dualscreen setup
--
else
    shifty.config.tags = {
        ["Terminal"] = {
            layout      = awful.layout.suit.tile,
            screen      = 2,
            position    = 1,
            init        = true,
        },
        ["Web"] = {
            layout      = awful.layout.suit.max,
            exclusive   = true,
            screen      = 1,
            position    = 2,
            init        = true
        },
        ["IM"] = {
            layout    = awful.layout.suit.tile,
            mwfact    = 0.80,
            exclusive = true,
            screen    = 1,
            position  = 1,
        },
        ["Music"] = {
            layout    = awful.layout.suit.max,
            screen    = 2,
            position  = 2,
            exclusie  = true,
            init      = true,
            spawn     = "banshee",
            nopop     = true,
        },
        ["Media"] = {
            layout    = awful.layout.suit.float,
            exclusive = false,
            screen    = 2,
            position  = 3,
        },
        ["Image"] = {
            layout    = awful.layout.suit.max,
            exclusive = false,
            screen    = 2,
            position  = 6,
        },
        ["Office"] = {
            layout   = awful.layout.suit.tile,
            screen   = 2,
            position = 4,
        },
        ["Torrent"] = {
            layout    = awful.layout.suit.tile,
            exclusive = true,
            screen    = 1,
            position  = 3,
        },
        ["VM"] = {
            layout    = awful.layout.suit.max,
            exclusive = true,
            screen    = 2,
            position  = 5,
        },
        ["Files"] = {
            layout    = awful.layout.suit.tile,
            rel_index = 1,
        },
        ["Update"] = {
            layout    = awful.layout.suit.tile,
            rel_index = 1,
        }
    }
end

-- Default tag options
shifty.config.defaults = {
    floatBars = true,
    layout = awful.layout.suit.tile,
    guess_name = true,
    guess_position = true,
}

