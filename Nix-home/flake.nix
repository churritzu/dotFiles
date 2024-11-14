{
  description = "Home Manager configuration of tupa";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nix-stable, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-stable = nix-stable.legacyPackages.${system};
    in {

      nixConfigurations = {
        "tupa" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs; };


          nixpkgs.config.allowUnfree = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
            "discord"
          ];



          # modules = [ ./system.nix ];
        };
      };
        
      # Home Manager configuration
      homeConfigurations = {
        "tupa" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            # Specify your home configuration modules here, for example,
            # the path to your home.nix.
            modules = [ ./home.nix ];
            # Optionally use extraSpecialArgs
            # to pass through arguments to home.nix
      };
    };
  };
}
