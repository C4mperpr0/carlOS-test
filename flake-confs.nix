{
  user = {
    name = "carl";
    description = "Carl";
  };
  hostname = "nixos";
  system = "x86_64-linux";
  desktop-environment = {
    hyprland = {
      hypridle = {
        display-dimm-after = 240;
        display-off-after = 270;
        lock-after = 300;
        sleep-after = 315;
      };
    };
  };
}
