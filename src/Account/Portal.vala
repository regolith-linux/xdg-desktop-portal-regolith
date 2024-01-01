[DBus (name = "org.freedesktop.impl.portal.Account")]
public class Account.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    [DBus (name = "GetUserInformation")]
    public async void get_user_information(GLib.ObjectPath handle, string app_id, string window, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("get_user_information");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }
}