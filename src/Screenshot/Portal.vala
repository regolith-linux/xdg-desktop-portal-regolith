[DBus (name = "org.freedesktop.impl.portal.Screenshot")]
public class Screenshot.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    [DBus (name = "Screenshot")]
    public async void screenshot(GLib.ObjectPath handle, string app_id, string parent_window, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("screenshot");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;        
    }

    [DBus (name = "PickColor")]
    public async void pick_color(GLib.ObjectPath handle, string app_id, string parent_window, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("pick_color");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "version")]
    public uint version {  get { return 0; } }
}