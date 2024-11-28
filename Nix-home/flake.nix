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
      pkgs-stable = nix-stable.legacyPackages.${system};
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {

        # OPCIONES: 
        ## Executed by `nix build .#<name>`
        # packages."<system>"."<name>" = derivation;
        ## Executed by `nix build .`
        # packages."<system>".default = derivation;

        packages.x86_64-linux.default = pkgs.mkShell {
            name = "terminal";
            buildInputs = [
              # pkgs.ranger
              # pkgs.neofetch
              pkgs.btop
            ];
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

# export NIX_TMPDIR=/tmp/nix-tmp
