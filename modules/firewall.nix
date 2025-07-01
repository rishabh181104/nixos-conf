{ config, pkgs, ... }:
{
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [];
  networking.firewall.allowedUDPPorts = [];
  # Add allowed ports as needed
} 