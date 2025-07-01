{ config, pkgs, ... }:
{
  security.polkit.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 8;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 8";
  };
  boot.bootspec.extensions = {
    "org.secureboot.osRelease" = config.environment.etc."os-release".source;
  };
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.picom.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.libinput.enable = true;
  services.openssh.enable = true;
  programs.firefox.enable = true;
  programs.ssh.startAgent = true;
} 