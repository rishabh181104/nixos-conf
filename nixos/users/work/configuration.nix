{ config, lib, pkgs, inputs, windowManager ? "hyprland", userName ? "work", userPackages ? [ pkgs.fish pkgs.git pkgs.tree ], hostName ? "work-machine", theme ? { image = null; base16Scheme = null; }, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/networking.nix
    ../../modules/users.nix
    ../../modules/shell.nix
    ../../modules/hardware-opts.nix
    ../../modules/hyprland.nix
    ../../modules/qtile.nix
    ../../modules/theming.nix
    ../../modules/packages.nix
    ../../modules/services.nix
    ../../modules/fonts.nix
    ../../modules/nvidia.nix
    ../../modules/devtools.nix
    ../../modules/power.nix
    ../../modules/automount.nix
    ../../modules/firewall.nix
  ];

  # Machine-specific settings:
  time.timeZone = "UTC";
  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

