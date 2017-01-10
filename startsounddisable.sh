echo -e '[com.canonical.unity-greeter]\nplay-ready-sound = false' \
    | sudo tee -a /usr/share/glib-2.0/schemas/50_unity-greeter.gschema.override
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
