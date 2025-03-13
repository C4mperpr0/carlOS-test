{
  inputs,
  flake-confs,
  self,
}: let
  system = flake-confs.system;
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };
  lib = inputs.nixpkgs.lib;
  commonModules = [
    ../modules/system
  ];
in {
  # universal laptop config
  laptop =
    #lib.nixosSystem {
    #inherit system;
    #specialArgs = {
    #inherit self inputs flake-confs pkgs pkgs-unstable;
    #buildName = "laptop";
    #};
    #modules =
    commonModules
    ++ [
      ./laptop
    ];
  #};
  #;
}
