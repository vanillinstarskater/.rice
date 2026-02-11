{...}: {
  imports = [
    /etc/nixos/hardware-configuration.nix

    ./nix/bluetooth.nix
    ./nix/boot.nix
    ./nix/drivers.nix
    ./nix/identity.nix
    ./nix/locale.nix
    ./nix/networking.nix
    ./nix/nix.nix
    ./nix/packages.nix
    ./nix/pipewire.nix
    ./nix/ssh.nix
  ];
}
