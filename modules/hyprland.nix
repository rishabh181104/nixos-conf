{ config, pkgs, lib, windowManager, ... }:
lib.mkIf (windowManager == "hyprland") {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.xserver.enable = false;
} 
