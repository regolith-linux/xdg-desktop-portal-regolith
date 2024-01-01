[DBus (name = "org.freedesktop.impl.portal.InputCapture")]
public class InputCapture.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    [DBus (name = "CreateSession")]
    public async void create_session(GLib.ObjectPath handle, GLib.ObjectPath session_handle, string app_id, string parent_window, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("create_session");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "GetZones")]
    public async void get_zones(GLib.ObjectPath handle, GLib.ObjectPath session_handle, string app_id, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("get_zones");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "SetPointerBarriers")]
    public async void set_pointer_barriers(GLib.ObjectPath handle, GLib.ObjectPath session_handle, string app_id, GLib.HashTable<string, GLib.Variant> options, GLib.HashTable<string, GLib.Variant>[] barriers, uint zone_set, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("set_pointer_barriers");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "Enable")]
    public async void enable(GLib.ObjectPath session_handle, string app_id, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("enable");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "Disable")]
    public async void disable(GLib.ObjectPath session_handle, string app_id, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("disable");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "Release")]
    public async void release(GLib.ObjectPath session_handle, string app_id, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("release");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "ConnectToEIS")]
    public async int connect_to_e_i_s(GLib.ObjectPath session_handle, string app_id, GLib.HashTable<string, GLib.Variant> options) throws DBusError, IOError {
        debug ("connect_to_e_i_s");
        return 0;
    }

    [DBus (name = "Disabled")]
    public signal void disabled(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options);

    [DBus (name = "Activated")]
    public signal void activated(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options);

    [DBus (name = "Deactivated")]
    public signal void deactivated(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options);

    [DBus (name = "ZonesChanged")]
    public signal void zones_changed(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options);

    [DBus (name = "SupportedCapabilities")]
    public uint supported_capabilities {  get { return 0; } }

    [DBus (name = "version")]
    public uint version {  get { return 0; } }
}