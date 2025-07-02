{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
# Add your packages here, split into logical groups if needed
    hyprland hypridle hyprland-qt-support hyprland-qtutils hyprlock hyprpicker pyprland xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-hyprland waybar wlogout wlroots_0_19 swww rose-pine-hyprcursor libsForQt5.xwaylandvideobridge xwayland-run mako pavucontrol flat-remix-gtk papirus-icon-theme jamesdsp qt6.qtbase qt6.qtsvg qt6.qtvirtualkeyboard qt6.qtmultimedia imagemagick nwg-look
      google-chrome discord code-cursor nodejs-slim brave
      sbctl niv mokutil openssl linuxHeaders mkinitcpio-nfs-utils linuxKernel.kernels.linux_zen efibootmgr
      stirling-pdf thunderbird libreoffice-fresh ntfs3g exfat exfatprogs gvfs mtpfs libmtp
      whatsie
      blueman bluez bluez-tools
      fish starship
      networkmanager networkmanagerapplet
      grim grimblast slurp
      vim neovim wget fzf gnumake unzip shellcheck
      alacritty foot kitty btop bat bc brightnessctl ripgrep keychain wl-clipboard xclip gnome-keyring fastfetch lazygit git psmisc
      python313Packages.qtile-extras xwallpaper pcmanfm xfce.thunar vlc mupdf rofi-wayland
      python3Full go pipx python313Packages.pip python313Packages.virtualenv typescript-language-server vscode-langservers-extracted pyright sqls prettier lua-language-server stylua llvmPackages_20.libcxxClang astyle jdt-language-server python313Packages.debugpy vimPlugins.vim-ipython rPackages.autoimport python313Packages.black postgresql gdb shfmt cargo rustc rust-analyzer rustfmt
      vulkan-loader vulkan-tools
  ];
} 
