[DBus (name = "org.freedesktop.impl.portal.DynamicLauncher")]
public class DynamicLauncher.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    [DBus (name = "PrepareInstall")]
    public async void prepare_install(GLib.ObjectPath handle, string app_id, string parent_window, string name, GLib.Variant icon_v, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("prepare_install");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "RequestInstallToken")]
    public async uint request_install_token(string app_id, GLib.HashTable<string, GLib.Variant> options) throws DBusError, IOError {
        debug ("request_install_token");
        return 0;
    }

    [DBus (name = "SupportedLauncherTypes")]
    public uint supported_launcher_types {  get { return 0; } }

    [DBus (name = "version")]
    public uint version {  get { return 0; } }

}