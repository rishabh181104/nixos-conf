{ config, pkgs, lib, windowManager, ... }:
lib.mkIf (windowManager == "qtile") {
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    windowManager.qtile.enable = true;
    displayManager.sessionCommands = ''
      xrandr --output eDP-1 --mode "1920x1080" --rate "60.01"
      xrandr --output eDP-2 --mode "1920x1080" --rate "60.01"
      xrandr --output eDP-3 --mode "1920x1080" --rate "60.01"
      xrandr --output eDP-4 --mode "1920x1080" --rate "60.01"
      xrandr --output HDMI-1 --mode "1920x1080" --rate "60.01"
      xrandr --output HDMI-2 --mode "1920x1080" --rate "60.01"
      xrandr --output HDMI-3 --mode "1920x1080" --rate "60.01"
      xrandr --output HDMI-4 --mode "1920x1080" --rate "60.01"
      xwallpaper --zoom ~/Wallpapers/Pictures/Concept-Japanese\ house.png
      xset r rate 200 35 &
      '';
  };
  programs.hyprland.enable = false;
} 
