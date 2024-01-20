install_data(
    'regolith.portal',
    install_dir: datadir / 'xdg-desktop-portal' / 'portals'
)

install_data(
    ['regolith-x11-portals.conf', 'regolith-wayland-portals.conf'],
    install_dir: datadir / 'xdg-desktop-portal'
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
