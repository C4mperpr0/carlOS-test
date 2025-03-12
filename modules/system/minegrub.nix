{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.nixosModules.minegrub;
in {
  options = {
    nixosModules.minegrub = {
      enable = lib.mkEnableOption "enable programming minegrub";
    };
  };
  config = lib.mkIf cfg.enable {
    boot.loader.grub = {
      minegrub-theme = {
        enable = true;
        boot-options-count = 4;
      };
    };
  };
}
