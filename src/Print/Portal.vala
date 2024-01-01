[DBus (name = "org.freedesktop.impl.portal.Print")]
public class Print.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    [DBus (name = "Print")]
    public async void print(GLib.ObjectPath handle, string app_id, string parent_window, string title, int fd, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("print");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "PreparePrint")]
    public async void prepare_print(GLib.ObjectPath handle, string app_id, string parent_window, string title, GLib.HashTable<string, GLib.Variant> settings, GLib.HashTable<string, GLib.Variant> page_setup, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("prepare_print");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }
}