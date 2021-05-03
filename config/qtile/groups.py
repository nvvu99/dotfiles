import os
import re
from libqtile import hook
from libqtile.config import Group, Key, Match
from keybindings import keys, mod
from libqtile.lazy import lazy

group_names = "a", "s", "d", "g", "w", "e", "r"
group_configs = [
    {
        "label": " A:",
        "layout": "max",
    },
    {
        "label": " S:",
        "layout": "max",
    },
    {
        "label": " D:",
        "layout": "max",
    },
    {
        "label": " G:",
        "layout": "monadtall",
    },
    {
        "label": " W:",
        "layout": "max",
    },
    {
        "label": " E:",
        "layout": "max",
    },
    {
        "label": " R:",
        "layout": "floating",
    },
]
groups = [
    Group(name=group_name, **kwargs)
    for group_name, kwargs in zip(group_names, group_configs)
]

for group in groups:
    name = group.name
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                name,
                lazy.group[name].toscreen(),
                desc="Switch to group {}".format(name),
            ),
            Key([mod], "Tab", lazy.screen.next_group()),
            Key([mod, "shift"], "Tab", lazy.screen.prev_group()),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                name,
                lazy.window.togroup(name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(name),
            ),
        ]
    )

# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME
# BEGIN


group_rules = {
    group_names[0]: [
        "atom",
        "subl3",
        "geany",
        "brackets",
        "code-oss",
        "code",
        "nvim$",
        "neovide",
        "eclipse",
    ],
    group_names[1]: [
        "navigator",
        "firefox",
        "vivaldi-stable",
        "vivaldi-snapshot",
        "chromium",
        "google-chrome",
        "brave",
        "brave-browser",
        "microsoft-edge-beta",
    ],
    group_names[2]: [
        "thunar",
        "nemo",
        "caja",
        "nautilus",
        "org.gnome.nautilus",
        "pcmanfm",
        "pcmanfm-qt",
        "dolphin",
        "vifm",
    ],
    group_names[3]: [
        "kitty",
    ],
    group_names[4]: [
        "guake",
        # "virtualbox manager",
        # "virtualbox machine",
        # "vmplayer",
        # "virt-manager",
    ],
    group_names[5]: [
        "evolution",
        "geary",
        "mail",
        "thunderbird",
    ],
}


@hook.subscribe.client_new
def assign_app_group(client):
    wm_class = client.window.get_wm_class()[0]
    assigned_group = group_for_client(wm_class)
    if assigned_group is not None:
        client.togroup(group_for_client(wm_class), switch_group=True)


def group_for_client(wm_class):
    for group_name, rules in group_rules.items():
        for rule in rules:
            if re.match(rule, wm_class, re.IGNORECASE) is not None:
                return group_name

    return None


# END
# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME
