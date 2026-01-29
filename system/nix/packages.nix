{pkgs, ...}: {
  # Sets up system-wide packages.
  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];

  programs = {
    git.enable = true;
    hyprland.enable = true;
    neovim.enable = true;
    nix-ld.enable = true;
    steam.enable = true;
    waybar.enable = true;
  };
  environment.systemPackages = [
    pkgs.alacritty
    pkgs.blender
    pkgs.discord
    pkgs.feh
    pkgs.fnott
    pkgs.gcc
    pkgs.grim
    pkgs.hyprpolkitagent
    pkgs.keepassxc
    pkgs.krita
    (
      pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          obs-pipewire-audio-capture
          wlrobs
        ];
      }
    )
    pkgs.openrazer-daemon
    pkgs.pavucontrol
    pkgs.polychromatic
    pkgs.python3
    pkgs.ripgrep
    pkgs.slurp
    pkgs.spotify
    pkgs.swaybg
    pkgs.unzip
    pkgs.vivaldi
    pkgs.vlc
    pkgs.wofi
  ];
}
