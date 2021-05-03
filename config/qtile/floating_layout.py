import re
from libqtile import layout, hook

float_rules = [
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {"wmclass": "confirm"},
    {"wmclass": "dialog"},
    {"wmclass": "download"},
    {"wmclass": "error"},
    {"wmclass": "file_progress"},
    {"wmclass": "notification"},
    {"wmclass": "splash"},
    {"wmclass": "toolbar"},
    {"wmclass": "confirmreset"},  # gitk
    {"wmclass": "makebranch"},  # gitk
    {"wmclass": "maketag"},  # gitk
    {"wname": "branchdialog"},  # gitk
    {"wname": "pinentry"},  # GPG key password entry
    {"wmclass": "guake"},
    {"wmclass": "Gnome-calculator"},
    {"wmclass": "Gcolor3"},
    {"wmclass": "Arandr"},
    {"wmclass": "feh"},
    {"role": "xfce4-terminal-dropdown"},
    {"wname": "Open File"},
    {"wmclass": "ssh-askpass"},
    {"wmclass": "virtualbox machine"},
    {"wmclass": "workrave"},
    {"wmclass": "stretchly"},
    {"wmclass": "MEGAsync"},
    {"wmclass": ".*(.py)$"},
    {"wmclass": ".*(.py)$"},
    {"wmclass": "xdman"},
    {"wmclass": "kmag"},
    {"wname": "Welcome to Android Studio"},
    {"wname": "Android Emulator"},
    {"wname": "Guake!"},
]


@hook.subscribe.client_new
def float_app(client):
    wmclass = client.window.get_wm_class()[0] or ""
    wname = client.window.get_name() or ""
    role = client.window.get_wm_window_role() or ""

    for rule in float_rules:
        wmclass_rule = rule.get("wmclass", "")
        wname_rule = rule.get("wname", "")
        role_rule = rule.get("role", "")
        if (
            re.match(wmclass_rule, wmclass, re.IGNORECASE) is not None
            and re.match(wname_rule, wname, re.IGNORECASE) is not None
            and re.match(role_rule, role, re.IGNORECASE) is not None
        ):
            try:
                client.enablefloating()
            except:
                pass
            break
