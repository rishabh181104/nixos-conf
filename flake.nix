{
  description = "My NixOS configuration with Zen Browser, Google Chrome, and Secure Boot via Lanzaboote";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, zen-browser, home-manager, stylix, ... }@inputs:
    let
    lib = nixpkgs.lib;
  system = "x86_64-linux";
  currentHost = "nix-ste"; # Change this to "work" to switch profiles/hosts
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
  windowManager = hosts.${currentHost}.windowManager or "hyprland";
  hosts = {
    nix-ste = {
      user = "default";
      config = ./profiles/default/configuration.nix;
      home = ./profiles/default/home.nix;
      hostName = "nix-ste";
      userName = "ste";
      userPackages = [ pkgs.fish pkgs.tree ];
      theme = {
        image = "/home/ste/dotfiles/themes/catppuccin-mocha/catppuccin-mocha.png";
        base16Scheme = "/home/ste/dotfiles/themes/catppuccin-mocha/catppuccin-mocha.yaml";
      };
      windowManager = "hyprland";
    };
    work = {
      user = "work";
      config = ./profiles/work/configuration.nix;
      home = ./profiles/work/home.nix;
      hostName = "work-machine";
      userName = "work";
      userPackages = [ pkgs.fish pkgs.git pkgs.tree ];
      theme = {
        image = "/home/work/dotfiles/themes/solarized-dark/solarized-dark.png";
        base16Scheme = "/home/work/dotfiles/themes/solarized-dark/solarized-dark.yaml";
      };
      windowManager = "hyprland";
    };
# Add more hosts here, e.g.:
# laptop = { user = "alice"; config = ./users/alice/configuration.nix; home = ./users/alice/home.nix; hostName = "laptop"; userName = "alice"; userPackages = [ pkgs.fish pkgs.git ]; theme = { image = ...; base16Scheme = ...; }; };
  };
  in
  {
    nixosConfigurations = {
      ${currentHost} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          windowManager = hosts.${currentHost}.windowManager;
          userName = hosts.${currentHost}.userName;
          userPackages = hosts.${currentHost}.userPackages;
          hostName = hosts.${currentHost}.hostName;
          theme = hosts.${currentHost}.theme;
        };
        modules = [ hosts.${currentHost}.config 
          stylix.nixosModules.stylix
        ];
      };
    };
    homeConfigurations = {
      ${hosts.${currentHost}.user} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ hosts.${currentHost}.home ];
        extraSpecialArgs = {
          userName = hosts.${currentHost}.userName;
          homeDirectory = "/home/" + hosts.${currentHost}.userName;
        };
      };
    };
  };
}
