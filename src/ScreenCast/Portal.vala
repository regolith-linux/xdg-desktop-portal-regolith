[DBus (name = "org.freedesktop.impl.portal.ScreenCast")]
public class ScreenCast.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    [DBus (name = "CreateSession")]
    public async void create_session(GLib.ObjectPath handle, GLib.ObjectPath session_handle, string app_id, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("create_session");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "SelectSources")]
    public async void select_sources(GLib.ObjectPath handle, GLib.ObjectPath session_handle, string app_id, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("select_sources");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "Start")]
    public async void start(GLib.ObjectPath handle, GLib.ObjectPath session_handle, string app_id, string parent_window, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("start");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "AvailableSourceTypes")]
    public uint available_source_types {  get { return 0; } }

    [DBus (name = "AvailableCursorModes")]
    public uint available_cursor_modes {  get { return 0; } }

    [DBus (name = "version")]
    public uint version {  get { return 0; } }
}