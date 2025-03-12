# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  flake-confs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nixosModules = {
    #minegrub.enable = true;
    university.enable = true;
    desktop-environment = {
      kde.enable = true;
      #hyprland.enable = true;
    };
    office = {
      enable = true;
      latex.enable = true;
    };
    firefox-setup.enable = true;
    media = {
      enable = true;
      modeling.enable = true;
      videoEditing.enable = true;
    };
    programming = {
      enable = true;
      game-development.enable = true;
      virtualization.enable = true;
      basic-languages.enable = true;
    };
    gaming.enable = true;
    social.enable = true;
    cli-packages.enable = true;
    ui-utils.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.nvidia.open = false;
  services.xserver.videoDrivers = [
    "nvidia" # https://github.com/NixOS/nixpkgs/issues/80936#issuecomment-1003784682
  ];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # make Wa do the Com
  services.xserver.wacom.enable = true;

  home-manager.users.${flake-confs.user.name} = {pkgs, ...}: {
    home.stateVersion = "23.11";
  };

  #  nixpkgs = {
  #    overlays = let
  #     #obsidiansettingssync-overlay = final: prev: {
  #     # obsidiansettingssync = prev.callPackage /home/carl/Documents/git/obsidian_settings_sync#/#packaging/derivation.nix {};
  #    #};
  #    astah-overlay = final: prev: {
  #      astah = prev.callPackage /home/carl/Documents/install-astah/astah.nix {};
  #    };
  #     #in [ obsidiansettingssync-overlay astah-overlay ];
  #     in [ astah-overlay ];
  #  };
  #  environment.systemPackages = with pkgs; [
  #    astah
  #  ];

  system.stateVersion = "23.11"; # Did you read the comment?
}
