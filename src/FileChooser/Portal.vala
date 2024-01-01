[DBus (name = "org.freedesktop.impl.portal.FileChooser")]
public class FileChooser.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    [DBus (name = "OpenFile")]
    public async void open_file(GLib.ObjectPath handle, string app_id, string parent_window, string title, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("open_file");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "SaveFile")]
    public async void save_file(GLib.ObjectPath handle, string app_id, string parent_window, string title, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("save_file");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "SaveFiles")]
    public async void save_files(GLib.ObjectPath handle, string app_id, string parent_window, string title, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("save_files");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }
}