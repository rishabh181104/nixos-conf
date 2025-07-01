{ config, pkgs, userName, userPackages, ... }:
{
  users.users.${userName} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = userPackages;
  };
  users.defaultUserShell = pkgs.fish;
} 