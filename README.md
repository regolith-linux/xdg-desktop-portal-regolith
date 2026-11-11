# Regolith XDG Desktop Portals

This portal backend was forked from [the Elementary OS backend](https://github.com/elementary/portals).

## Status

The portal backend is retired and is no longer built by default. Regolith routes every portal interface to the GTK, wlroots or GNOME backends through the configuration files in `data/`, packaged as `xdg-desktop-portal-regolith-x11-config` and `xdg-desktop-portal-regolith-wayland-config`. The `xdg-desktop-portal-regolith` package is now an empty transitional package that removes the old backend on upgrade.

The backend's sources (forked from elementary) are kept and can still be built with `-Dportal_backend=true`.

## Screen sharing in the Wayland session

In sessions whose `XDG_CURRENT_DESKTOP` lists `Regolith-Wayland`, xdg-desktop-portal-wlr reads `/etc/xdg/xdg-desktop-portal-wlr/Regolith-Wayland` and asks `regolith-share-picker` what to share. The picker uses slurp: click a window to share that window, or click elsewhere on a monitor to share the whole monitor. Only the parts of windows actually on screen can be clicked, so hidden tabs, other workspaces and the scratchpad are skipped, and the window drawn on top wins. When the application accepts only monitors, every click shares the monitor under it; when it accepts only windows, clicks outside a window are ignored. Escape cancels. A configuration of your own in `~/.config/xdg-desktop-portal-wlr/` still takes precedence.

## Building, Testing, and Installation

You'll need the following dependencies:
* gtk4
* meson
* valac

Run `meson` (add `-Dportal_backend=true` for the backend) to configure the build environment and then `ninja test` to build and run tests

    meson build --prefix=/usr
    cd build
    ninja test

To install, use `ninja install`, then execute with `/usr/libexec/xdg-desktop-portal-regolith -r`

    sudo ninja install
    /usr/libexec/xdg-desktop-portal-regolith -r
