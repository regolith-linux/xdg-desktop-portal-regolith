/*
 * SPDX-FileCopyrightText: 2021-2023 elementary, Inc. (https://elementary.io)
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

[DBus (name = "org.freedesktop.impl.portal.Access")]
public class Access.Portal : Object {
    private DBusConnection connection;

    public Portal (DBusConnection connection) {
        this.connection = connection;
    }

    public async void access_dialog (
        ObjectPath handle,
        string app_id,
        string parent_window,
        string title,
        string sub_title,
        string body,
        HashTable<string, Variant> options,
        out uint32 response,
        out HashTable<string, Variant> results
    ) throws DBusError, IOError {
        results = new HashTable<string, Variant> (str_hash, str_equal);
        response = 0;
    }
}
