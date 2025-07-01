{ config, pkgs, ... }:
{
  hardware.enableRedistributableFirmware = true;
  services.udev.packages = with pkgs; [ libmtp ];
} 
