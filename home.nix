{ config, pkgs, userName, homeDirectory, ... }:

{
# Home Manager needs a bit of information about you and the paths it should
# manage.
  home.username = userName;
  home.homeDirectory = homeDirectory;

  xdg.configFile = {
    "hypr" = {
      source = ./../../dotfiles/hypr;
      recursive = true;
    };
    "alacritty" = {
      source = ./../../dotfiles/alacritty;
      recursive = true;
    };
    "kitty" = {
      source = ./../../dotfiles/kitty;
      recursive = true;
    };
    "fish" = {
      source = ./../../dotfiles/fish;
      recursive = true;
    };
    "fastfetch" = {
      source = ./../../dotfiles/fastfetch;
      recursive = true;
    };
    "nvim" = {
      source = ./../../dotfiles/nvim;
      recursive = true;
    };
    "rofi" = {
      source = ./../../dotfiles/rofi;
      recursive = true;
    };
    "waybar" = {
      source = ./../../dotfiles/waybar;
      recursive = true;
    };
    "wlogout" = {
      source = ./../../dotfiles/wlogout;
      recursive = true;
    };
    "qtile" = {
      source = ./../../dotfiles/qtile;
      recursive = true;
    };
    "picom" = {
      source = ./../../dotfiles/picom;
      recursive = true;
    };
    "mako" = {
      source = ./../../dotfiles/mako;
      recursive = true;
    };
  };

# Files for home directory
  home.file = {
#   ".bashrc".source = ./dotfiles/bashrc;
#   ".tmux.conf".source = ./dotfiles/tmux.conf;
    "starship.toml".source = ./../../dotfiles/starship.toml;
  };

# Files for ~/.local/share/
# xdg.dataFile = {
#   "app/datafile".source = ./data/datafile;
# };

  home.stateVersion = "25.05"; # Please read the comment before changing.

    home.packages = with pkgs; [
    hello
    ];

#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/ste/etc/profile.d/hm-session-vars.sh
#
  home.sessionVariables = {
# EDITOR = "emacs";
  };

# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
