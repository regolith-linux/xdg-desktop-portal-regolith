# Regolith XDG Desktop Portals

This portal backend was forked from [the Elementary OS backend](https://github.com/elementary/portals).

## Status

The portal backend is retired and is no longer built by default. Regolith routes every portal interface to the GTK, wlroots or GNOME backends through the configuration files in `data/`, packaged as `xdg-desktop-portal-regolith-x11-config` and `xdg-desktop-portal-regolith-wayland-config`. The `xdg-desktop-portal-regolith` package is now an empty transitional package that removes the old backend on upgrade.

The backend's sources (forked from elementary) are kept and can still be built with `-Dportal_backend=true`.

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
