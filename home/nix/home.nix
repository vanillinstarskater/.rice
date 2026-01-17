{...}: {
  # Basic home-manager stuff.
  home = {
    stateVersion = "25.05";
    username = "vanillin";
    homeDirectory = "/home/vanillin";
    enableNixpkgsReleaseCheck = false;
  };
  programs.home-manager.enable = true;
}
