{...}: {
  # Sets up user and system identity.
  networking.hostName = "foxbox";
  users.users.vanillin = {
    isNormalUser = true;
    description = "Vanillin Starskater";
    extraGroups = [
      "networkmanager"
      "wheel"
      "plugdev"
      "openrazer"
    ];
  };
}
