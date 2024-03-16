[DBus (name = "org.freedesktop.impl.portal.Wallpaper")]
public class Wallpaper.Portal : Object {
    private DBusConnection connection;
    private const string BACKGROUND_SCHEMA = "org.gnome.desktop.background";
    private const string LOCKSCREEN_SCHEMA = "org.gnome.desktop.screensaver";

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }


    public void show_preview_image(string uri, string parent_window) throws GLib.Error {
       
        var window = new Gtk.Window();
        window.title = "Image Preview";
        window.set_default_size(400, 400);
        var image = new Gtk.Image.from_file(uri);
        image.set_size_request(400, 400);
        var box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
        box.append(image);
        window.set_child(box);
        window.show();
        
    }


    private void set_gsettings(string schema, string key, string value) throws Error {
       
        var settings = new GLib.Settings(schema);
        settings.set_string(key, value);
        settings.apply();
      
        
    }

    public void set_background_wallpaper(string uri) throws Error {
        set_gsettings(BACKGROUND_SCHEMA, "picture-uri", uri);
    }
    
    public void set_lockscreen_wallpaper(string uri) throws Error {
        set_gsettings(LOCKSCREEN_SCHEMA, "picture-uri", uri);
    }
    

    [DBus (name = "SetWallpaperURI")]
    public async uint set_wallpaper_uri(GLib.ObjectPath handle, string app_id, string parent_window, string uri, GLib.HashTable<string, GLib.Variant> options, out uint response) throws DBusError, IOError {
        debug("set_wallpaper_uri");


        string get_uri="";

        try {
            get_uri = Uri.parse(uri, UriFlags.NONE).get_path();
        } catch (GLib.UriError e) {
            stderr.printf("Error parsing URI: %s\n", e.message);
        }

        bool show_preview = false;
        string set_on = "";
        if (options != null) {
            GLib.Variant? showPreviewVariant = options.lookup("show-preview");
            if (showPreviewVariant != null && showPreviewVariant.get_boolean()) {
                show_preview = true;
            }

            GLib.Variant? setOnVariant = options.lookup("set-on");
            if (setOnVariant != null) {
                set_on = setOnVariant.get_string();
            }
        }

        debug("show-preview: %s", show_preview ? "true" : "false");
        debug("set-on: %s", set_on);

        if (show_preview) {
            try{
                show_preview_image(get_uri,parent_window);
            } catch (GLib.Error e) {
                stderr.printf("Error showing preview: %s\n", e.message);
                return response=1;
            }
        }

        uint response_code = 0;

        if (set_on == "background") {
            try {
                set_background_wallpaper(get_uri);
                response_code = 0;
            } catch (GLib.Error e) {
                response_code = 1;
            }
        } else if (set_on == "lockscreen") {
            try {
                set_lockscreen_wallpaper(get_uri);
                response_code = 0;
            } catch (GLib.Error e) {
                response_code = 1;
            }
        } else if (set_on == "both") {
            try {
                set_background_wallpaper(get_uri);
                set_lockscreen_wallpaper(get_uri);
                response_code = 0;
            } catch (GLib.Error e) {
                response_code = 1;
            }
        } else {
            response_code = 2;
        }

        return response=response_code;
    }
}