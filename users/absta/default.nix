{ lib, ... }:
let
  modLib = import ../../modules/lib.nix { inherit lib; };
  active = import ./active-modules.nix;
in {
  imports = [
    ./user.nix
    ./nix.nix
    ./region.nix
  ] ++ modLib.mkModules "nixos" active;
}
