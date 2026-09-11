# Prototype: builds import lists for modules/<name>/<type>/default.nix.
#
# Each directory under modules/ can hold up to two variants of a feature:
#   modules/<name>/nixos/default.nix  -- system-level config
#   modules/<name>/home/default.nix   -- home-manager-level config
# Not every module needs both (e.g. greetd is nixos-only).
#
# Usage from a profile file:
#
#   { lib, ... }:
#   let
#     modules = import ../modules/lib.nix { inherit lib; };
#   in {
#     imports = modules.mkModules "nixos" [ "hyprland" "greetd" ];
#   }
#
# Passing `null` instead of a name list imports every module that has
# the requested type:
#
#   imports = modules.mkModules "home" null;

{ lib }:
let
  root = ./.;

  moduleNames = lib.attrNames (
    lib.filterAttrs (_: kind: kind == "directory") (builtins.readDir root)
  );

  modulePath = type: name: root + "/${name}/${type}/default.nix";

  hasType = type: name: builtins.pathExists (modulePath type name);
in
{
  # mkModules : ("nixos" | "home") -> (list of string | null) -> list of path
  #
  # Silently skips a named module that has no variant of the requested
  # type, rather than erroring, so a profile can list a module by name
  # once and let each side (nixos/home) pick up only what applies to it.
  mkModules = type: names:
    let
      candidates = if names == null then moduleNames else names;
      available = lib.filter (hasType type) candidates;
    in
      map (modulePath type) available;
}
