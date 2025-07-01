{ config, pkgs, theme, ... }:
{
  programs.stylix.enable = true;
# Example: set a default theme (customize as needed)
  stylix.targets = {
    alacritty.enable = true;
    kitty.enable = true;
    foot.enable = true;
    waybar.enable = true;
    gtk.enable = true;
    bat.enable = true;
    btop.enable = true;
    dunst.enable = true;
    rofi.enable = true;
    zathura.enable = true;
    qt.enable = true;
  };

  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "Meslo" ]; }; # Meslo LG S from Nerd Fonts
        name = "MesloLGS Nerd Font Mono";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix.image = theme.image;
  stylix.base16Scheme = theme.base16Scheme;
} 
