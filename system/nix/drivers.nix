{config, ...}: {
  # Sets up Nvidia drivers.
  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };

  # Sets up Razer drivers.
  hardware.openrazer.enable = true;
}
