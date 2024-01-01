[DBus (name = "org.freedesktop.impl.portal.Wallpaper")]
public class Wallpaper.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    [DBus (name = "SetWallpaperURI")]
	public async uint set_wallpaper_u_r_i(GLib.ObjectPath handle, string app_id, string parent_window, string uri, GLib.HashTable<string, GLib.Variant> options) throws DBusError, IOError {
        debug ("set_wallpaper_u_r_i");
        return 0;
    }
}