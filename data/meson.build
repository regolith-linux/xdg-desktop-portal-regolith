install_data(
    ['regolith-portals.conf', 'regolith-wayland-portals.conf'],
    install_dir: datadir / 'xdg-desktop-portal'
)

# xdg-desktop-portal-wlr looks for a configuration file named after each
# entry of XDG_CURRENT_DESKTOP.
install_data(
    'regolith-wayland-wlr.conf',
    rename: 'Regolith-Wayland',
    install_dir: sysconfdir / 'xdg' / 'xdg-desktop-portal-wlr'
)

if build_backend
    install_data(
        'regolith.portal',
        install_dir: datadir / 'xdg-desktop-portal' / 'portals'
    )

    configure_file(
        input: 'org.freedesktop.impl.portal.desktop.regolith.service.in',
        output: '@BASENAME@',
        configuration: conf_data,
        install: true,
        install_dir: datadir / 'dbus-1' / 'services'
    )

    systemduserunitdir = get_option('systemduserunitdir')
    if systemduserunitdir == ''
        systemduserunitdir = systemd_dep.get_variable('systemduserunitdir', pkgconfig_define: [ 'prefix', prefix ])
    endif

    configure_file(
        input: meson.project_name() + '.service.in',
        output: '@BASENAME@',
        configuration: conf_data,
        install: true,
        install_dir: systemduserunitdir
    )
endif
