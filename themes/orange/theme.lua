-----------------------------------------------------------------------------------------------------------------------
--                                                  Orange theme                                                     --
-----------------------------------------------------------------------------------------------------------------------
local awful = require("awful")

local theme = {}
local wa = mouse.screen.workarea

-- Color scheme
-----------------------------------------------------------------------------------------------------------------------
theme.color = {
	main      = "#B22B00",
	gray      = "#575757",
	bg        = "#161616",
	bg_second = "#181818",
	wibox     = "#202020",
	icon      = "#a0a0a0",
	text      = "#aaaaaa",
	urgent    = "#064A71",
	highlight = "#ffffff",

	border    = "#404040",
	shadow1   = "#141414",
	shadow2   = "#313131",
	shadow3   = "#1c1c1c",
	shadow4   = "#767676"
}

-- Common
-----------------------------------------------------------------------------------------------------------------------
theme.path = awful.util.get_configuration_dir() .. "themes/orange"
theme.homedir = os.getenv("HOME")

-- Main config
------------------------------------------------------------

theme.panel_height        = 36 -- panel height
theme.border_width        = 4  -- window border width
theme.useless_gap         = 4  -- useless gap

theme.wallpaper = theme.path .. "/wallpaper/custom.png" -- wallpaper file

-- Fonts
------------------------------------------------------------
theme.fonts = {
	main     = "Roboto 13",      -- main font
	menu     = "Roboto 13",      -- main menu font
	tooltip  = "Roboto 13",      -- tooltip font
	notify   = "Play bold 14",   -- redflat notify popup font
	clock    = "Play bold 12",   -- textclock widget font
	qlaunch  = "Play bold 14",   -- quick launch key label font
	keychain = "Play bold 14",   -- key sequence tip font
	title    = "Roboto bold 13", -- widget titles font
	titlebar = "Roboto bold 13", -- client titlebar font
	hotkeys = {
		main  = "Roboto 14",             -- hotkeys helper main font
		key   = "Iosevka Term Light 14", -- hotkeys helper key font (use monospace for align)
		title = "Roboto bold 16",        -- hotkeys helper group title font
	},
}

theme.cairo_fonts = {
	task        = { font = "Play", size = 16, face = 1 }, -- tag widget font
	appswitcher = { font = "Play", size = 20, face = 1 }, -- appswitcher widget font
	navigator   = {
		title = { font = "Play", size = 28, face = 1, slant = 0 }, -- window navigation title font
		main  = { font = "Play", size = 22, face = 1, slant = 0 }  -- window navigation  main font
	},
}

-- Shared icons
--------------------------------------------------------------------------------
theme.icon = {
	check    = theme.path .. "/common/check.svg",
	blank    = theme.path .. "/common/blank.svg",
	warning  = theme.path .. "/common/warning.svg",
	awesome  = theme.path .. "/common/awesome.svg",
}


-- Desktop config
-----------------------------------------------------------------------------------------------------------------------
theme.desktop = { common = {} }

theme.desktop.color = {
	main  = theme.color.main,
	icon  = theme.color.icon_desktop or "#606060",
	gray  = theme.color.gray_desktop or "#404040",
	wibox = theme.color.bg .. "00"
}

theme.desktop.textset = {
	font  = "Belligerent Madness 22",
	-- font  = "Idolwild 22",
	-- font  = "Palitoon 26",
	spacing = 10,
	color = theme.desktop.color
}


-- Service utils config
-----------------------------------------------------------------------------------------------------------------------
theme.service = {}

-- Window control mode appearance
--------------------------------------------------------------------------------
theme.service.navigator = {
	border_width = 0,
	gradstep     = 60,
	marksize     = { width = 160, height = 80, r = 20 },
	linegap      = 32,
	titlefont    = theme.cairo_fonts.navigator.title,
	font         = theme.cairo_fonts.navigator.main,
	color        = { border = theme.color.main, mark = theme.color.gray, text = theme.color.wibox,
	                 fbg1 = theme.color.main .. "40", fbg2 = theme.color.main .. "20",
	                 bg1  = theme.color.gray .. "40", bg2  = theme.color.gray .. "20" }
}

theme.service.navigator.keytip = {}
theme.service.navigator.keytip["fairv"] = { geometry = { width = 600, height = 460 }, exit = true }
theme.service.navigator.keytip["fairh"] = theme.service.navigator.keytip["fairv"]

theme.service.navigator.keytip["tile"] = { geometry = { width = 600, height = 660 }, exit = true }
theme.service.navigator.keytip["tileleft"]   = theme.service.navigator.keytip["tile"]
theme.service.navigator.keytip["tiletop"]    = theme.service.navigator.keytip["tile"]
theme.service.navigator.keytip["tilebottom"] = theme.service.navigator.keytip["tile"]


-- Desktop file parser
--------------------------------------------------------------------------------
theme.service.dfparser = {
	desktop_file_dirs = {
		'/usr/share/applications/',
		'/usr/local/share/applications/',
		'~/.local/share/applications',
	},
	icons = {
		df_icon       = theme.homedir .. "/.icons/ACYLS/scalable/mimetypes/application-x-executable.svg",
		theme         = theme.homedir .. "/.icons/ACYLS",
		custom_only   = true,
		scalable_only = true
	}
}


-- Menu config
-----------------------------------------------------------------------------------------------------------------------
theme.menu = {
	border_width = 4,
	screen_gap   = theme.useless_gap + theme.border_width,
	height       = 32,
	width        = 250,
	icon_margin  = { 4, 7, 7, 8 },
	ricon_margin = { 9, 9, 9, 9 },
	font         = theme.fonts.menu,
	keytip       = { geometry = { width = 400, height = 460 } },
	hide_timeout = 1,
	submenu_icon = theme.path .. "/common/submenu.svg"
}

theme.menu.color = {
	border       = theme.color.wibox,
	text         = theme.color.text,
	highlight    = theme.color.highlight,
	main         = theme.color.main,
	wibox        = theme.color.wibox,
	submenu_icon = theme.color.icon
}


-- Gauge style
-----------------------------------------------------------------------------------------------------------------------
theme.gauge = { tag = {}, task = {}}

-- Separator
------------------------------------------------------------
theme.gauge.separator = {
	marginv = { 2, 2, 4, 4 },
	marginh = { 6, 6, 3, 3 },
	color  = theme.color
}

-- Double icon indicator
--------------------------------------------------------------
theme.gauge.dubgicon = {
	icon1       = theme.path .. "/widget/down.svg",
	icon2       = theme.path .. "/widget/up.svg",
	is_vertical = true,
	igap        = -6,
	color       = theme.color
}

-- Monitor
--------------------------------------------------------------
theme.gauge.cirmon = {
	width        = 32,
	line_width   = 4,
	iradius      = 5,
	radius       = 11,
	color        = theme.color
}

-- Tag
------------------------------------------------------------
theme.gauge.tag.orange = {
	width        = 36,
	line_width   = theme.gauge.cirmon.line_width,
	iradius      = theme.gauge.cirmon.iradius,
	radius       = theme.gauge.cirmon.radius,
	hilight_min  = false,
	color        = theme.color
}

-- Task
------------------------------------------------------------
theme.gauge.task.blue = {
	width    = 80,
	show_min = true,
	font     = theme.cairo_fonts.task,
	point    = { width = 70, height = 3, gap = 27, dx = 5 },
	text_gap = 20,
	color    = theme.color
}

-- Dotcount
------------------------------------------------------------
theme.gauge.dotcount = {
	column_num   = { 3, 5 }, -- { min, max }
	row_num      = 3,
	dot_size     = 5,
	dot_gap_h    = 4,
	color        = theme.color
}

-- Volume indicator
------------------------------------------------------------
theme.gauge.audio = {}

theme.gauge.audio.blue = {
	width   = 75,
	dash    = { bar = { num = 5, width = 4 }, color = theme.color },
	dmargin = { 10, 0, 2, 2 },
	icon    = theme.path .. "/widget/headphones.svg",
	color = { icon = theme.color.icon, mute = theme.color.urgent },
}


-- Panel widgets
-----------------------------------------------------------------------------------------------------------------------
theme.widget = {}

-- individual margins for palnel widgets
------------------------------------------------------------
theme.widget.wrapper = {
	layoutbox   = { 12, 10, 6, 6 },
	textclock   = { 10, 10, 0, 0 },
	volume      = { 10, 10, 5, 5 },
	network     = { 4, 4, 5, 5 },
	keyboard    = { 10, 10, 4, 4 },
	taglist     = { 4, 4, 0, 0 },
	mail        = { 10, 10, 4, 4 },
	battery     = { 0, 5, 0, 0 },
	cpu         = { 5, 0, 0, 0 },
	tray        = { 10, 12, 7, 7 },
	tasklist    = { 6, 0, 0, 0 }, -- centering tasklist widget
}

-- Pulseaudio volume control
------------------------------------------------------------
theme.widget.pulse = {
	notify_icon = theme.path .. "/widget/audio.svg"
}

-- Brightness control
------------------------------------------------------------
theme.widget.brightness = {
	notify_icon = theme.path .. "/widget/brightness.svg"
}

-- Textclock
------------------------------------------------------------
theme.widget.textclock = {
	font  = theme.fonts.clock,
	color = { text = theme.color.icon }
}

-- Keyboard layout indicator
------------------------------------------------------------
theme.widget.keyboard = {
	icon         = theme.path .. "/widget/keyboard.svg",
	micon        = theme.icon,
	layout_color = { theme.color.icon, theme.color.main }
}

theme.widget.keyboard.menu = {
	width        = 180,
	color        = { right_icon = theme.color.icon },
	nohide       = true
}

-- Upgrades
------------------------------------------------------------
theme.widget.upgrades = {
	notify_icon = theme.path .. "/widget/upgrades.svg",
	color       = theme.color
}

-- Mail
------------------------------------------------------------
theme.widget.mail = {
	icon        = theme.path .. "/widget/mail.svg",
	notify_icon = theme.path .. "/widget/mail.svg",
	color       = theme.color,
}

-- Minitray
------------------------------------------------------------
theme.widget.minitray = {
	border_width = 0,
	geometry     = { height = 40 },
	screen_gap   = 2 * theme.useless_gap,
	color        = { wibox = theme.color.wibox, border = theme.color.wibox },
	set_position = function()
		return { x = mouse.screen.workarea.x + mouse.screen.workarea.width,
		         y = mouse.screen.workarea.y + mouse.screen.workarea.height }
	end,
}

-- Layoutbox
------------------------------------------------------------
theme.widget.layoutbox = {
	micon = theme.icon,
	color = theme.color
}

theme.widget.layoutbox.icon = {
	floating          = theme.path .. "/layouts/floating.svg",
	max               = theme.path .. "/layouts/max.svg",
	fullscreen        = theme.path .. "/layouts/fullscreen.svg",
	tilebottom        = theme.path .. "/layouts/tilebottom.svg",
	tileleft          = theme.path .. "/layouts/tileleft.svg",
	tile              = theme.path .. "/layouts/tile.svg",
	tiletop           = theme.path .. "/layouts/tiletop.svg",
	fairv             = theme.path .. "/layouts/fair.svg",
	grid              = theme.path .. "/layouts/grid.svg",
	usermap           = theme.path .. "/layouts/map.svg",
	unknown           = theme.path .. "/common/unknown.svg",
}

theme.widget.layoutbox.menu = {
	icon_margin  = { 8, 12, 9, 9 },
	width        = 260,
	auto_hotkey  = true,
	nohide       = false,
	color        = { right_icon = theme.color.icon, left_icon = theme.color.icon }
}

theme.widget.layoutbox.name_alias = {
	floating          = "Floating",
	fullscreen        = "Fullscreen",
	max               = "Maximized",
	grid              = "Grid",
	usermap           = "User Map",
	tile              = "Right Tile",
	fairv             = "Fair Tile",
	tileleft          = "Left Tile",
	tiletop           = "Top Tile",
	tilebottom        = "Bottom Tile",
}

-- Tasklist
------------------------------------------------------------
theme.widget.tasklist = {
	width       = 70,
	char_digit  = 5,
	task        = theme.gauge.task.blue
}

-- main
theme.widget.tasklist.winmenu = {
	micon          = theme.icon,
	titleline      = { font = theme.fonts.title, height = 25 },
	menu           = { width = 240, color = { right_icon = theme.color.icon }, ricon_margin = { 9, 9, 9, 9 } },
	state_iconsize = { width = 18, height = 18 },
	layout_icon    = theme.widget.layoutbox.icon,
	color          = theme.color
}

-- tasktip
theme.widget.tasklist.tasktip = {
	margin = { 8, 8, 4, 4 },
	color  = theme.color
}

-- tags submenu
theme.widget.tasklist.winmenu.tagmenu = {
	width       = 180,
	icon_margin = { 9, 9, 9, 9 },
	color       = { right_icon = theme.color.icon, left_icon = theme.color.icon },
}

-- menu
theme.widget.tasklist.winmenu.icon = {
	floating             = theme.path .. "/common/window_control/floating.svg",
	sticky               = theme.path .. "/common/window_control/pin.svg",
	ontop                = theme.path .. "/common/window_control/ontop.svg",
	below                = theme.path .. "/common/window_control/below.svg",
	close                = theme.path .. "/common/window_control/close.svg",
	minimize             = theme.path .. "/common/window_control/minimize.svg",
	maximize             = theme.path .. "/common/window_control/maximize.svg",
	maximized_horizontal = theme.path .. "/common/window_control/maxh.svg",
	maximized_vertical   = theme.path .. "/common/window_control/maxv.svg",
}

-- task aliases
theme.widget.tasklist.appnames = {}
theme.widget.tasklist.appnames["Exaile"              ] = "EXAILE"
theme.widget.tasklist.appnames["Smplayer"            ] = "SMPL"
theme.widget.tasklist.appnames["Firefox"             ] = "FIFOX"
theme.widget.tasklist.appnames["Gnome-terminal"      ] = "GTERM"
theme.widget.tasklist.appnames["Gnome-system-monitor"] = "SYMON"
theme.widget.tasklist.appnames["Gimp-2.8"            ] = "GIMP"
theme.widget.tasklist.appnames["Goldendict"          ] = "GDIC"
theme.widget.tasklist.appnames["Easytag"             ] = "ETAG"
theme.widget.tasklist.appnames["Mcomix"              ] = "COMIX"
theme.widget.tasklist.appnames["Claws-mail"          ] = "CMAIL"
theme.widget.tasklist.appnames["URxvt"               ] = "RXVT"
theme.widget.tasklist.appnames["VirtualBox"          ] = "VBOX"
theme.widget.tasklist.appnames["Keepassx"            ] = "KPASS"


-- Floating widgets
-----------------------------------------------------------------------------------------------------------------------
theme.float = {}

-- Application runner
------------------------------------------------------------
theme.float.apprunner = {
	itemnum       = 6,
	geometry      = { width = 620, height = 480 },
	border_margin = { 24, 24, 24, 24 },
	icon_margin   = { 8, 16, 0, 0 },
	title_height  = 48,
	prompt_height = 35,
	title_icon    = theme.path .. "/widget/search.svg",
	border_width  = 0,
	name_font     = theme.fonts.title,
	comment_font  = theme.fonts.main,
	color         = theme.color
}

-- Application switcher
------------------------------------------------------------
theme.float.appswitcher = {
	wibox_height   = 240,
	label_height   = 28,
	title_height   = 40,
	icon_size      = 96,
	border_margin  = { 10, 10, 0, 10 },
	preview_margin = { 15, 15, 15, 15 },
	preview_format = 16 / 10,
	title_font     = theme.fonts.title,
	border_width   = 0,
	update_timeout = 1 / 12,
	keytip         = { geometry = { width = 400, height = 380 }, exit = true },
	font           = theme.cairo_fonts.appswitcher,
	color          = theme.color
}

-- additional color
theme.float.appswitcher.color.preview_bg = theme.color.main .. "12"

-- hotkeys
theme.float.appswitcher.hotkeys = { "1",   "2",  "3",  "4",  "5",  "6",  "7",  "8",  "9",  "0",
                                    "F1",  "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10",
                                    "F11", "F12" }

-- Quick launcher
------------------------------------------------------------
theme.float.qlaunch = {
	geometry      = { width = 1400, height = 170 },
	border_margin = { 5, 5, 12, 15 },
	border_width  = 0,
	notify_icon   = theme.icon.warning,
	appline       = { iwidth = 140, im = { 5, 5, 0, 0 }, igap = { 0, 0, 5, 15 }, lheight = 26 },
	state         = { gap = 5, radius = 5, size = 10,  height = 14 },
	df_icon       = theme.homedir .. "/.icons/ACYLS/scalable/mimetypes/application-x-executable.svg",
	no_icon       = theme.homedir .. "/.icons/ACYLS/scalable/apps/question.svg",
	recoloring    = true,
	keytip        = { geometry = { width = 600, height = 340 } },
	label_font    = theme.fonts.qlaunch,
	color         = theme.color,
}

-- Hotkeys helper
------------------------------------------------------------
theme.float.hotkeys = {
	geometry      = { width = 1800, height = 900 },
	border_margin = { 20, 20, 8, 10 },
	border_width  = 0,
	is_align      = true,
	separator     = { marginh = { 0, 0, 3, 6 } },
	font          = theme.fonts.hotkeys.main,
	keyfont       = theme.fonts.hotkeys.key,
	titlefont     = theme.fonts.hotkeys.title,
	color         = theme.color
}

-- Tooltip
------------------------------------------------------------
theme.float.tooltip = {
	margin       = { 6, 6, 3, 3 },
	timeout      = 0,
	font         = theme.fonts.tooltip,
	border_width = 2,
	color        = theme.color
}

-- Floating prompt
------------------------------------------------------------
theme.float.prompt = {
	border_width = 0,
	color        = theme.color
}

-- Top processes
------------------------------------------------------------
theme.float.top = {
	geometry      = { width = 460, height = 400 },
	screen_gap    = 2 * theme.useless_gap,
	border_margin = { 20, 20, 10, 0 },
	button_margin = { 140, 140, 18, 18 },
	title_height  = 40,
	border_width  = 0,
	bottom_height = 70,
	title_font    = theme.fonts.title,
	color         = theme.color,
	set_position  = function()
		return { x = mouse.screen.workarea.x + mouse.screen.workarea.width,
		         y = mouse.screen.workarea.y + mouse.screen.workarea.height }
	end,
}

-- Key sequence tip
------------------------------------------------------------
theme.float.keychain = {
	geometry        = { width = 250, height = 50 },
	font            = theme.fonts.keychain,
	border_width    = 0,
	keytip          = { geometry = { width = 1200, height = 580 }, column = 2 },
	color           = theme.color,
}

-- Notify
------------------------------------------------------------
theme.float.notify = {
	geometry     = { width = 484, height = 106 },
	screen_gap   = 2 * theme.useless_gap,
	font         = theme.fonts.notify,
	border_width = 0,
	color        = theme.color,
	progressbar  = { color = theme.color },
	set_position = function()
		return { x = mouse.screen.workarea.x + mouse.screen.workarea.width, y = mouse.screen.workarea.y }
	end,
}

-- Titlebar
-----------------------------------------------------------------------------------------------------------------------
theme.titlebar = {
	size          = 8,
	position      = "top",
	font          = theme.fonts.titlebar,
	icon          = { size = 30, gap = 10 },
	border_margin = { 0, 0, 0, 4 },
	color         = theme.color,
}

-- Naughty config
-----------------------------------------------------------------------------------------------------------------------
theme.naughty = {}

theme.naughty.base = {
	timeout      = 10,
	margin       = 12,
	icon_size    = 80,
	font         = theme.fonts.main,
	bg           = theme.color.wibox,
	fg           = theme.color.text,
	height       = theme.float.notify.geometry.height,
	width        = theme.float.notify.geometry.width,
	border_width = 4,
	border_color = theme.color.wibox
}

theme.naughty.normal = {}
theme.naughty.critical = { timeout = 0, border_color = theme.color.main }
theme.naughty.low = { timeout = 5 }

-- Default awesome theme vars
-----------------------------------------------------------------------------------------------------------------------

-- colors
theme.bg_normal     = theme.color.wibox
theme.bg_focus      = theme.color.main
theme.bg_urgent     = theme.color.urgent
theme.bg_minimize   = theme.color.gray

theme.fg_normal     = theme.color.text
theme.fg_focus      = theme.color.highlight
theme.fg_urgent     = theme.color.highlight
theme.fg_minimize   = theme.color.highlight

theme.border_normal = theme.color.wibox
theme.border_focus  = theme.color.wibox
theme.border_marked = theme.color.main

-- font
theme.font = theme.fonts.main

-- End
-----------------------------------------------------------------------------------------------------------------------
return theme
