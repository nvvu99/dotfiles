import os

import subprocess
from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from keybindings import keys, mod, second_mod, terminal
from groups import groups
from topbar import topbar
from layouts import layouts
from floating_layout import float_app
from colors import colors

HOME = os.path.expanduser("~")

widget_defaults = dict(
    font="Fira Code Nerd Font",
    fontsize=13,
    padding=0,
    background=colors[0],
    foreground=colors[8],
)
extension_defaults = widget_defaults.copy()

keys.extend(
    [
        # Switch window focus to other pane(s) of stack
        Key(
            [mod],
            "Tab",
            lazy.layout.next(),
            desc="Switch window focus to other pane(s) of stack",
        ),
    ]
)

screens = [
    Screen(top=topbar),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod, "shift"],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod, "shift"],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click([], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"


@hook.subscribe.startup_once
def on_startup_once():
    startup_once_script = os.path.join(
        HOME, ".config", "qtile", "scripts", "startup-once"
    )
    subprocess.Popen([startup_once_script])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
