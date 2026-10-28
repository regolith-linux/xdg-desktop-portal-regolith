project('xdg-desktop-portal-regolith', version: '7.1.1', meson_version: '>=0.58')

prefix = get_option('prefix')
datadir = prefix / get_option('datadir')
libexecdir = prefix / get_option('libexecdir')
localedir = prefix / get_option('localedir')

# The portal backend is retired: Regolith routes every interface to the
# GTK, wlroots or GNOME backends through the portals.conf files in data/.
# The backend's sources are kept and can still be built with -Dportal_backend=true.
build_backend = get_option('portal_backend')

if build_backend
    add_languages('c', 'vala', native: false)

    systemd_dep = dependency('systemd')

    glib_dep = dependency('glib-2.0')
    gobject_dep = dependency('gobject-2.0')
    gio_dep = dependency('gio-2.0')

    gtk_deps = [
        dependency('gtk4')
    ]

    if meson.get_compiler('vala').version().version_compare('>=0.56.1')
        gtk_deps += [
            dependency('gtk4-x11'),
            dependency('gtk4-wayland')
        ]
    endif

    x11_dep = dependency('x11')

    add_project_arguments(
        '--vapidir', meson.current_source_dir() / 'vapi',
        language: 'vala'
    )

    add_project_arguments(
        '-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()),
        language: 'c'
    )

    conf_data = configuration_data()
    conf_data.set('LIBEXECDIR', libexecdir)
    conf_data.set_quoted('GETTEXT_PACKAGE', meson.project_name())
    conf_data.set_quoted('LOCALEDIR', localedir)
    conf_data.set_quoted('VERSION', meson.project_version())
endif

subdir('data')

if build_backend
    subdir('src')
endif
