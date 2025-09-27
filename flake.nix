{
  description = "NixOS config flake";

  inputs = {
    # Core nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Themeing & colors
    stylix.url = "github:danth/stylix/release-24.11";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, stylix, nix-colors, ... }: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      # Pass inputs down so modules (like home.nix) can use them
      specialArgs = { inherit inputs nix-colors; };

      modules = [
        ./hosts/default/configuration.nix

        # Home Manager & Stylix modules
        home-manager.nixosModules.default
        stylix.nixosModules.stylix

        # Home Manager user config
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.sp4c3m4n = import ./home.nix;
        }
      ];
    };
  };
}
