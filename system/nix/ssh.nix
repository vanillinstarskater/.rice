{...}: {
  # Sets up openssh daemon.
  networking.firewall.allowedTCPPorts = [16606];
  services.openssh = {
    enable = true;
    ports = [16606];
    settings = {
      PasswordAuthentication = false;
    };
  };
}
