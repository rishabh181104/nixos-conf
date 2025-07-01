{ config, lib, pkgs, inputs, windowManager ? "hyprland", userName ? "ste", userPackages ? [ pkgs.fish pkgs.tree ], hostName ? "nix-ste", theme ? { image = null; base16Scheme = null; }, ... }:
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
  time.timeZone = "Asia/Kolkata";
  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

