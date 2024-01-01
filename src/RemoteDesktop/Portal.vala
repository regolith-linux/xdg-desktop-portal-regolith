[DBus (name = "org.freedesktop.impl.portal.RemoteDesktop")]
public class RemoteDesktop.Portal : Object {
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

    [DBus (name = "SelectDevices")]
    public async void select_devices(GLib.ObjectPath handle, GLib.ObjectPath session_handle, string app_id, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("select_devices");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "Start")]
    public async void start(GLib.ObjectPath handle, GLib.ObjectPath session_handle, string app_id, string parent_window, GLib.HashTable<string, GLib.Variant> options, out uint response, out GLib.HashTable<string, GLib.Variant> results) throws DBusError, IOError {
        debug ("start");
        results = new HashTable<string, GLib.Variant> (str_hash, str_equal);
        response = 0;
    }

    [DBus (name = "NotifyPointerMotion")]
    public async void notify_pointer_motion(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options, double dx, double dy) throws DBusError, IOError {
        debug ("notify_pointer_motion");
    }

    [DBus (name = "NotifyPointerMotionAbsolute")]
    public async void notify_pointer_motion_absolute(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options, uint stream, double x, double y) throws DBusError, IOError {
        debug ("notify_pointer_motion_absolute");
    }

    [DBus (name = "NotifyPointerButton")]
    public async void notify_pointer_button(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options, int button, uint state) throws DBusError, IOError {
        debug ("notify_pointer_button");
    }

    [DBus (name = "NotifyPointerAxis")]
    public async void notify_pointer_axis(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options, double dx, double dy) throws DBusError, IOError {
        debug ("notify_pointer_axis");
    }

    [DBus (name = "NotifyPointerAxisDiscrete")]
    public async void notify_pointer_axis_discrete(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options, uint axis, int steps) throws DBusError, IOError {
        debug ("notify_pointer_axis_discrete");
    }

    [DBus (name = "NotifyKeyboardKeycode")]
    public async void notify_keyboard_keycode(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options, int keycode, uint state) throws DBusError, IOError {
        debug ("notify_keyboard_keycode");
    }

    [DBus (name = "NotifyKeyboardKeysym")]
    public async void notify_keyboard_keysym(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options, int keysym, uint state) throws DBusError, IOError {
        debug ("notify_keyboard_keysym");
    }

    [DBus (name = "NotifyTouchDown")]
    public async void notify_touch_down(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options, uint stream, uint slot, double x, double y) throws DBusError, IOError {
        debug ("notify_touch_down");
    }

    [DBus (name = "NotifyTouchMotion")]
    public async void notify_touch_motion(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options, uint stream, uint slot, double x, double y) throws DBusError, IOError {
        debug ("notify_touch_motion");
    }

    [DBus (name = "NotifyTouchUp")]
    public async void notify_touch_up(GLib.ObjectPath session_handle, GLib.HashTable<string, GLib.Variant> options, uint slot) throws DBusError, IOError {
        debug ("notify_touch_up");
    }

    [DBus (name = "ConnectToEIS")]
    public async int connect_to_e_i_s(GLib.ObjectPath session_handle, string app_id, GLib.HashTable<string, GLib.Variant> options) throws DBusError, IOError {
        return 0;
    }

    [DBus (name = "AvailableDeviceTypes")]
    public uint available_device_types {  get { return 0; } }

    [DBus (name = "version")]
    public uint version {  get { return 0; } }
}