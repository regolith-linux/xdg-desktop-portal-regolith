[DBus (name = "org.freedesktop.impl.portal.Lockdown")]
public class Lockdown.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    [DBus (name = "disable-printing")]
    public bool disable_printing {  
        get { return false; }
        set { }
    }

    [DBus (name = "disable-save-to-disk")]
    public bool disable_save_to_disk {
        get { return false; }
        set { }
    }

    [DBus (name = "disable-application-handlers")]
    public bool disable_application_handlers {
        get { return false; }
        set { }
    }

    [DBus (name = "disable-location")]
    public bool disable_location {
        get { return false; }
        set { }
    }

    [DBus (name = "disable-camera")]
    public bool disable_camera {  
        get { return false; }
        set { }
    }

    [DBus (name = "disable-microphone")]
    public bool disable_microphone {   
        get { return false; }
        set { }
    }

    [DBus (name = "disable-sound-output")]
    public bool disable_sound_output {  
        get { return false; }
        set { }
    }
}