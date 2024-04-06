/* Refer to the provided link for the response codes.

https://flatpak.github.io/xdg-desktop-portal/docs/doc-org.freedesktop.portal.Request.html#org-freedesktop-portal-request

0: Success; the request is executed.
1: The user cancelled the interaction.
2: The user interaction concluded in an alternate manner.*/

[DBus (name = "org.freedesktop.impl.portal.Wallpaper")]
public class Wallpaper.Portal : Object {
    private DBusConnection connection;
    private const string BACKGROUND_SCHEMA = "org.gnome.desktop.background";
    private const string LOCKSCREEN_SCHEMA = "org.gnome.desktop.screensaver";
    private const string WALLPAPER_FILE = "regolith.wallpaper.file";
    private const string WALLPAPER_LOCKSCREEN_FILE = "regolith.lockscreen.wallpaper.file";

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    void reload_session() {        
        try{
            stdout.printf("Reloading session\n");
            Process.spawn_command_line_async("regolith-look refresh");
        }
        catch(Error e){
            stderr.printf("Error reloading session: %s\n", e.message);
        }
    }


    public void show_preview_image(string uri, string parent_window, string set_on) throws GLib.Error {

        var window = new Gtk.Window();
        window.title = "Image Preview";
        window.set_default_size(400, 400);
        var image = new Gtk.Image.from_file(uri);
        image.set_size_request(400, 400);
        var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        box.append(image);
        var buttonBox = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
        box.append(buttonBox);


        var cancelButton = new Gtk.Button.with_label("Cancel");

        var proceedButton = new Gtk.Button.with_label("Proceed");

        cancelButton.clicked.connect(() => {
            window.close();
        });

        proceedButton.clicked.connect( () => {
            if (set_on != "") {
                try {
                    if (set_on == "background" || set_on == "both") {
                        set_background_wallpaper(uri);
                    }
                    if (set_on == "lockscreen" || set_on == "both") {
                        set_lockscreen_wallpaper(uri);
                    }
                    window.close();
                } catch (GLib.Error e) {
                    stderr.printf("Error setting wallpaper: %s\n", e.message);
                }
            }
            else {
                stderr.printf("Error: Invalid option to set wallpaper\n");
            }
        });

        buttonBox.append(cancelButton);
        buttonBox.append(proceedButton);




        window.set_child(box);
        window.show();

    }

    public void update_xresources_wallpaper(string wallpaper_url, string key) throws Error {
        string xresources_file_path = Path.build_filename(Environment.get_home_dir(), ".config", "regolith3", "Xresources");

        File directory = File.new_for_path(Path.get_dirname(xresources_file_path));
        if (!directory.query_exists()) {
            try {
                directory.make_directory_with_parents();
                stdout.printf("Directory created: %s\n", directory.get_path());
            } catch (Error e) {
                stderr.printf("Error creating directory: %s\n", e.message);
                return;
            }
        }

        File file = File.new_for_path(xresources_file_path);

        if (!file.query_exists()) {
            stdout.printf("Xresources file does not exist: %s\n", xresources_file_path);
            // Create the file if it doesn't exist
            try {
                GLib.FileOutputStream? fs = file.create(FileCreateFlags.NONE);
                if (fs != null)
                    fs.close(null);
                stdout.printf("Xresources file created: %s\n", xresources_file_path);
            } catch (Error e) {
                stderr.printf("Error creating file: %s\n", e.message);
                return;
            }
        } else {
            stdout.printf("Xresources file exists: %s\n", xresources_file_path);
        }

        try {
            // Read existing contents
            uint8[] contents;
            string etag_out;

            bool loading_operation = file.load_contents(null, out contents, out etag_out);

            if(!loading_operation) {
                stderr.printf("Error loading Xresources file contents\n");
                return;
            }

            
            if (contents != null) {
                string contentsString = (string)contents;

                string line = key + ": " + wallpaper_url + "\n";

                if (contentsString.contains(key)) {

                    int index = contentsString.index_of(key);
                    int newlineIndex = contentsString.index_of("\n", index);

                    string old_line = contentsString.substring(index, newlineIndex - index + 1);

                    stdout.printf("old_line: %s", old_line);


                    contentsString = contentsString.replace( old_line, line);
                } else {
                    contentsString += line;
                }

                uint8[] modifiedContents = (uint8[])contentsString.data;

                file.replace_contents(modifiedContents, null, false, FileCreateFlags.NONE, null);
            }
        } catch (Error e) {
            stderr.printf("Error updating Xresources file: %s\n", e.message);
            return;
        }
        
    }
    

    private void set_gsettings(string schema, string key, string uri,string key_wallpaper) throws Error {
       
        var settings = new GLib.Settings(schema);
        settings.set_string(key, uri);
        settings.apply();

        update_xresources_wallpaper( uri, key_wallpaper);
      
        
    }

    public void set_background_wallpaper(string uri) throws Error {
        set_gsettings(BACKGROUND_SCHEMA, "picture-uri", uri , WALLPAPER_FILE);
        reload_session();
    }
    
    public void set_lockscreen_wallpaper(string uri) throws Error {
        set_gsettings(LOCKSCREEN_SCHEMA, "picture-uri", uri , WALLPAPER_LOCKSCREEN_FILE);
        reload_session();
    }
    

    [DBus (name = "SetWallpaperURI")]
    public async uint set_wallpaper_uri(GLib.ObjectPath handle, string app_id, string parent_window, string uri, GLib.HashTable<string, GLib.Variant> options, out uint response) throws DBusError, IOError {
        debug("set_wallpaper_uri");


        string get_uri="";

        try {
            get_uri = Uri.parse(uri, UriFlags.NONE).get_path();
        } catch (GLib.UriError e) {
            stderr.printf("Error parsing URI: %s\n", e.message);
            return 2;
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

        uint response_code = 0;

        if (show_preview) {
            try{
                show_preview_image(get_uri, parent_window, set_on);
            } catch (GLib.Error e) {
                stderr.printf("Error showing preview: %s\n", e.message);
                return response=1;
            }
        }
        else{
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
        }

        return response=response_code;
    }
}
