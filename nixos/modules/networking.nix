{ config, pkgs, hostName ? "nix-ste", ... }:
{
  networking.hostName = hostName;
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
} 