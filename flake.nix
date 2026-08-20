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
    mkConfiguration = machineName: username: system: nixpkgs.lib.nixosSystem {
      inherit system; 

      specialArgs = {
        inherit inputs system machineName username;
      };

      modules = [
        ./machines/${machineName}
        ./users/${username}
      ];
    };
  in {
    nixosConfigurations = {
      workstation = mkConfiguration "northwind" "absta" "x86_64-linux";
    };
  };
}