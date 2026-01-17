{pkgs, ...}: {
  # Sets up a cursor.
  #
  # I honestly perfer the default adwaita cursor.
  # Hyprland picks it up in Arch if GTK is installed, not in NixOS bc it's better isolated from it.
  # So this one has to do, so I'm not stuck with a Hyprland logo as my cursor.
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
}
