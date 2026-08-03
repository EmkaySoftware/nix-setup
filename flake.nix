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
    mkConfiguration = name: usernames: system: nixpkgs.lib.nixosSystem {
      inherit system; 

      specialArgs = {
        inherit inputs system usernames name;
      };

      modules = [
        ./machines/${name}
      ] 
      ++ map (username: ./users/${username}) usernames;
    };
  in {
    nixosConfigurations = {
      workstation = mkConfiguration "northwind" [ "emkay" "test" ] "x86_64-linux";
    };
  };
}