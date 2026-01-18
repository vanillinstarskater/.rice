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
    pkgs.discord
    pkgs.feh
    pkgs.fnott
    pkgs.gcc
    pkgs.ghostty
    pkgs.hyprpolkitagent
    pkgs.keepassxc
    pkgs.krita
    pkgs.openrazer-daemon
    pkgs.pavucontrol
    pkgs.polychromatic
    pkgs.python3
    pkgs.ripgrep
    pkgs.spotify
    pkgs.swaybg
    pkgs.unzip
    pkgs.vivaldi
    pkgs.wofi
  ];
}
