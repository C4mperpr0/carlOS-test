{...}: {
  imports = [
    ./basic-configuration.nix
    ./university.nix
    #./minegrub.nix  
    ./office.nix
    ./stylix.nix
    ./firefox-setup.nix
    ./media.nix
    ./social.nix
    ./cli-packages.nix
    ./gaming.nix
    ./programming.nix
    ./ui-utils.nix
    ./desktop-environment.nix
    ./hyprland
    ./git.nix
  ];
}
