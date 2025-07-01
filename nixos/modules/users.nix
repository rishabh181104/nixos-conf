{ config, pkgs, userName ? "ste", userPackages ? [ pkgs.fish pkgs.tree ], ... }:
{
  users.users.${userName} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = userPackages;
  };
  users.defaultUserShell = pkgs.fish;
} 