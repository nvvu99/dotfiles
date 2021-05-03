from libqtile import bar, widget
from libqtile.lazy import lazy

from colors import colors


def left_separator_solid(**config):
    return widget.TextBox(text="", fontsize=17, **config)


def left_separator(**config):
    return widget.TextBox(text="", fontsize=16, **config)


def right_separator_solid(**config):
    return widget.TextBox(text="", fontsize=17, **config)


def right_separator(**config):
    return widget.TextBox(text=" ", fontsize=16, **config)


topbar = bar.Bar(
    [
        # left topbar
        widget.TextBox(
            text="  ",
            font_size=26,
            foreground=colors[0],
            background=colors[1],
        ),
        left_separator_solid(
            foreground=colors[1],
            background=colors[16],
        ),
        left_separator_solid(
            foreground=colors[16],
            background=colors[2],
        ),
        widget.CurrentLayout(
            padding=4,
            foreground=colors[0],
            background=colors[2],
        ),
        left_separator_solid(
            foreground=colors[2],
            background=colors[8],
        ),
        widget.GroupBox(
            hide_unused=True,
            highlight_method="line",
            highlight_color=colors[8],
            this_current_screen_border=colors[7][0],
            spacing=3,
            disable_drag=True,
            foreground=colors[7],
            background=colors[8],
        ),
        left_separator_solid(
            foreground=colors[8],
            background=colors[17],
        ),
        widget.Prompt(
            font="Fira Code Bold",
            foreground=colors[7],
            background=colors[17],
        ),
        left_separator(
            foreground=colors[8],
            background=colors[17],
        ),
        widget.WindowName(
            font="Fira Code Bold",
            foreground=colors[7],
            background=colors[17],
        ),
        # right topbar
        right_separator(
            foreground=colors[7],
            background=colors[17],
        ),
        widget.CPU(
            # format="  {load_percent:0.0f}",
            format="  {load_percent:.0f}",
            update_interval=2.0,
            foreground=colors[7],
            background=colors[17],
        ),
        right_separator(
            foreground=colors[7],
            background=colors[17],
        ),
        widget.Memory(
            format="  {MemUsed}M",
            update_interval=2.0,
            foreground=colors[7],
            background=colors[17],
        ),
        right_separator(
            foreground=colors[7],
            background=colors[17],
        ),
        widget.Battery(
            format=" {percent:2.0%} ",
            notify_below=30,
            foreground=colors[7],
            background=colors[17],
        ),
        right_separator_solid(
            foreground=colors[8],
            background=colors[17],
        ),
        widget.TextBox(
            text="  ",
            foreground=colors[7],
            background=colors[8],
        ),
        widget.PulseVolume(
            foreground=colors[7],
            background=colors[8],
        ),
        right_separator(
            foreground=colors[7],
            background=colors[8],
        ),
        widget.Backlight(
            format=" {percent: 2.0%} ",
            backlight_name="intel_backlight",
            foreground=colors[7],
            background=colors[8],
        ),
        right_separator_solid(foreground=colors[4], background=colors[8]),
        widget.Clock(
            format="  %H:%M",
            foreground=colors[0],
            background=colors[4],
        ),
        right_separator(
            foreground=colors[0],
            background=colors[4],
        ),
        widget.Clock(
            format="  %a, %b %d ",
            foreground=colors[0],
            background=colors[4],
        ),
        # right_separator_solid(
        #     foreground=colors[13],
        #     background=colors[4],
        # ),
        right_separator_solid(
            foreground=colors[16],
            background=colors[4],
        ),
        right_separator_solid(
            foreground=colors[1],
            background=colors[16],
        ),
        widget.Systray(
            padding=4,
            foreground=colors[0],
            background=colors[1],
        ),
        # widget.QuickExit(
        #     default_text="  ",
        #     countdown_format=" {} ",
        #     foreground=colors[0],
        #     background=colors[1],
        # ),
    ],
    20,
)
