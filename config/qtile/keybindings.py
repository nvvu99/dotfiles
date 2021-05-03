from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.widget import backlight

mod = "mod1"
second_mod = "mod4"
terminal = "kitty"

keys = [
    # Switch between windows in current stack pane
    Key(
        [second_mod],
        "j",
        lazy.layout.down(),
        desc="Move focus down in stack pane",
    ),
    Key(
        [second_mod],
        "k",
        lazy.layout.up(),
        desc="Move focus up in stack pane",
    ),
    Key(
        [second_mod],
        "h",
        lazy.layout.left(),
        desc="Move focus left in stack pane",
    ),
    Key(
        [second_mod],
        "l",
        lazy.layout.right(),
        desc="Move focus right in stack pane",
    ),
    # Move windows up or down in current stack
    Key(
        [second_mod, "control"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down in current stack ",
    ),
    Key(
        [second_mod, "control"],
        "k",
        lazy.layout.shuffle_up(),
        desc="Move window up in current stack ",
    ),
    Key(
        [second_mod, "control"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window left in current stack ",
    ),
    Key(
        [second_mod, "control"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window right in current stack ",
    ),
    # RESIZE UP, DOWN, LEFT, RIGHT
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
    ),
    Key(
        [mod, "control"],
        "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
    ),
    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
    ),
    Key(
        [mod, "control"],
        "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
    ),
    Key(
        [mod, "control"],
        "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
    ),
    Key(
        [mod, "control"],
        "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
    ),
    # Swap panes of split stack
    Key(
        [mod, "shift"],
        "space",
        lazy.layout.rotate(),
        desc="Swap panes of split stack",
    ),
    Key(
        [mod, "shift"],
        "f",
        lazy.window.toggle_floating(),
        desc="Toggle floating",
    ),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    # Key([mod, "control"], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # Key([mod], "Tab", lazy.screen.next_group()),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key(
        [mod],
        "c",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget",
    ),
    # Sound
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("amixer -c 0 sset Master 1- unmute"),
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("amixer -c 0 sset Master 1+ unmute"),
    ),
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),
    Key([mod], "F1", lazy.spawn("systemctl suspend"), desc="Suspend system"),
    Key([mod], "F2", lazy.spawn("firefox"), desc="Open Firefox"),
    Key([mod], "F3", lazy.spawn("dolphin"), desc="Open Dolphin"),
    Key(
        [mod],
        "F4",
        lazy.spawn(f"{terminal} --class vifm -e vifm"),
        desc="Open Vifm",
    ),
    # Key([], "F12", lazy.spawn("xfce4-terminal --drop-down --hide-menubar")),
    Key([mod], "f", lazy.spawn("rofi -show drun"), desc="Open Rofi"),
    Key(
        [mod, "shift"],
        "x",
        lazy.spawn("betterlockscreen -l blur"),
        desc="Lock screen",
    ),
    Key(
        ["shift"],
        "Print",
        lazy.spawn("spectacle -f"),
        desc="Capture the entire screen",
    ),
    Key(
        [mod],
        "Print",
        lazy.spawn("spectacle -a"),
        desc="Capture the active window",
    ),
    Key(
        [second_mod],
        "Print",
        lazy.spawn("spectacle -r"),
        desc="Capture a region of the screen",
    ),
]
