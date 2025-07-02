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
  boot.initrd.availableKernelModules = lib.mkForce [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = lib.mkForce [ ];
  boot.kernelModules = lib.mkForce [ "kvm-intel" "iwlwifi" ];
  boot.extraModulePackages = [ ];


# Enables DHCP on each ethernet and wireless interface. In case of scripted networking
# (the default) this is the recommended approach. When using systemd-networkd it's
# still possible to use this option, but it's recommended to use it in conjunction
# with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkForce true;
# networking.interfaces.enp0s31f6.useDHCP = lib.mkForce true;
# networking.interfaces.wlp0s20f3.useDHCP = lib.mkForce true;

  nixpkgs.hostPlatform = lib.mkForce "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkForce config.hardware.enableRedistributableFirmware;
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

  boot.bootspec.extensions = {
    "org.secureboot.osRelease" = config.environment.etc."os-release".source;
  };
} 
