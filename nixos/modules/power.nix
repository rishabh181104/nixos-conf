{ config, pkgs, ... }:
{
  services.tlp.enable = true;
  powerManagement.enable = true;
  # Add more power management options as needed
} 