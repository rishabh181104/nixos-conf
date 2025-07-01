{ config, pkgs, theme, ... }:
{
  programs.stylix.enable = true;
  # Example: set a default theme (customize as needed)
  stylix.image = theme.image;
  stylix.base16Scheme = theme.base16Scheme;
} 