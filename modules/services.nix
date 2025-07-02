{ config, pkgs, lib, ... }:
{
  security.polkit.enable = lib.mkDefault true;
  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.systemd-boot.configurationLimit = 8;
  boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = "weekly";
    options = "--delete-older-than 8";
  };
  boot.initrd.availableKernelModules = lib.mkDefault [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = lib.mkDefault [ ];
  boot.kernelModules = lib.mkDefault [ "kvm-intel" "iwlwifi" ];
  boot.extraModulePackages = [ ];


# Enables DHCP on each ethernet and wireless interface. In case of scripted networking
# (the default) this is the recommended approach. When using systemd-networkd it's
# still possible to use this option, but it's recommended to use it in conjunction
# with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
# networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
# networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  services.displayManager.sddm = {
    enable = lib.mkForce true;
    wayland.enable = lib.Force true;
  };

  services.picom.enable = lib.mkDefault true;
  services.pipewire = {
    enable = lib.mkDefault true;
    pulse.enable = lib.mkDefault true;
  };

  services.libinput.enable = lib.mkDefault true;
  services.openssh.enable = lib.mkDefault true;
  programs.firefox.enable = lib.mkDefault true;
  programs.ssh.startAgent = lib.mkDefault true;
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  boot.bootspec.extensions = {
    "org.secureboot.osRelease" = config.environment.etc."os-release".source;
  };
} 
