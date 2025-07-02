{ config, pkgs, lib, ... }:
{
  security.polkit.enable = lib.mkForce true;
  boot.loader.systemd-boot.enable = lib.mkForce true;
  boot.loader.systemd-boot.configurationLimit = 8;
  boot.loader.efi.canTouchEfiVariables = lib.mkForce true;
  nix.gc = {
    automatic = lib.mkForce true;
    dates = "weekly";
    options = "--delete-older-than 8";
  };
  boot.bootspec.extensions = {
    "org.secureboot.osRelease" = config.environment.etc."os-release".source;
  };
  services.displayManager.sddm = {
    enable = lib.mkForce true;
    wayland.enable = lib.mkForce true;
  };
  services.picom.enable = lib.mkForce true;
  services.pipewire = {
    enable = lib.mkForce true;
    pulse.enable = lib.mkForce true;
  };
  services.libinput.enable = lib.mkForce true;
  services.openssh.enable = lib.mkForce true;
  programs.firefox.enable = lib.mkForce true;
  programs.ssh.startAgent = lib.mkForce true;
  nixpkgs.config.allowUnfree = lib.mkForce true;
} 
