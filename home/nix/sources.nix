{...}: {
  # Routes non-nix config files to their locations in .config.
  xdg.configFile = {
    "fnott/fnott.ini".source = ../normal/fnott/fnott.ini;
    "ghostty/config".source = ../normal/ghostty/config;
    "git/config".source = ../normal/git/config;
    "hypr/hyprland.conf".source = ../normal/hyprland/hyprland.conf;
    "nvim/init.lua".source = ../normal/neovim/init.lua;
    "waybar/config.jsonc".source = ../normal/waybar/config.jsonc;
    "waybar/style.css".source = ../normal/waybar/style.css;
    "wofi/config".source = ../normal/wofi/config;
    "wofi/style.css".source = ../normal/wofi/style.css;
  };
}
