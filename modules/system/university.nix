{
  lib,
  pkgs,
  pkgs-unstable,
  flake-confs,
  config,
  ...
}: let
  cfg = config.nixosModules.university;
in {
  options = {
    nixosModules.university = {
      enable = lib.mkEnableOption "enable university programs";
    };
  };
  config = lib.mkIf cfg.enable {
    virtualisation.docker.enable = true;
    users.users.${flake-confs.user.name} = {
      extraGroups = ["docker"];
    };
    environment.systemPackages = with pkgs; [
      docker
      vscode
      jdk
      poetry
      jupyter
      #qgis
      gradle
      #jetbrains.idea-ultimate
      dbeaver-bin

      # pokedex programmieren 2
      pkgs-unstable.flutter327
      android-tools
    ];
  };
}
