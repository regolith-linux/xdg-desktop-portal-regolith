[DBus (name = "org.freedesktop.impl.portal.Settings")]
public class Settings.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    [DBus (name = "ReadAll")]
    public async GLib.HashTable<string, GLib.HashTable<string, GLib.Variant>> read_all(string[] namespaces) throws DBusError, IOError {
        debug ("Settings.ReadAll");
        return new HashTable<string, GLib.HashTable<string, GLib.Variant>> (str_hash, str_equal);
    }

    [DBus (name = "Read")]
    public async GLib.Variant read(string namespace_, string key) throws DBusError, IOError {
        debug ("Settings.Read");
        throw new IOError.INVALID_ARGUMENT("Requested key could not be found.");
    }

    [DBus (name = "SettingChanged")]
    public signal void setting_changed(string namespace_, string key, GLib.Variant value);

    [DBus (name = "version")]
    public uint version {  get { return 0; } }

}