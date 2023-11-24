# Regolith XDG Desktop Portals

This portal backend was forked from [the Elementary OS backend](https://github.com/elementary/portals).

## Status

This project is experimental and in active development.  The source has been adapted from another desktop environment, and his still being refactored.

## Building, Testing, and Installation

You'll need the following dependencies:
* gtk4
* meson
* valac

Run `meson` to configure the build environment and then `ninja test` to build and run tests

    meson build --prefix=/usr
    cd build
    ninja test

To install, use `ninja install`, then execute with `/usr/libexec/xdg-desktop-portal-regolith -r`

    sudo ninja install
    /usr/libexec/xdg-desktop-portal-regolith -r
