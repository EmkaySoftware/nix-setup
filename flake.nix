{
  description = "NixOS configurations for my systems.";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: 
  let  
    mkSystem = name: system: nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs system name;
      };

      modules = [
        ./hosts/${name}
      ];
    };
  in {
    nixosConfigurations = {
      elorune = mkSystem "elorune" "x86_64-linux";
    };
  };
}
