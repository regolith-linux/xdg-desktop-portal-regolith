[DBus (name = "org.freedesktop.impl.portal.Clipboard")]
public class Clipboard.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    [DBus (name = "RequestClipboard")]
    public async void request_clipboard(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options) throws DBusError, IOError {
        debug ("request_clipboard");
    }

    [DBus (name = "SetSelection")]
    public async void set_selection(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options) throws DBusError, IOError {
        debug ("set_selection");
    }

    [DBus (name = "SelectionWrite")]
    public async int selection_write(GLib.ObjectPath session_handle, uint serial) throws DBusError, IOError {
        debug ("selection_write");
        return 0;
    }

    [DBus (name = "SelectionWriteDone")]
    public async void selection_write_done(GLib.ObjectPath session_handle, uint serial, bool success) throws DBusError, IOError {
        debug ("selection_write_done");
    }

    [DBus (name = "SelectionRead")]
    public async int selection_read(GLib.ObjectPath session_handle, string mime_type) throws DBusError, IOError {
        debug ("selection_read");
        return 0;
    }

    [DBus (name = "SelectionOwnerChanged")]
    public signal void selection_owner_changed(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options);

    [DBus (name = "SelectionTransfer")]
    public signal void selection_transfer(GLib.ObjectPath session_handle, string mime_type, uint serial);

    [DBus (name = "version")]
    public uint version {  get { return 0; } }

}