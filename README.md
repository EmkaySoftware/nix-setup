## Repository setup

### Machine

A machine is a physical machine, each machine defines it's own configuration.  
Typically it contains configuration that is machine specific or is unlikely to change by user configuration.  
This may include, but not limited to:
- Boot configuration; kernel and boot parameters.
- Network configuration
- Hardware specific configuration, i.e. GPU drivers.
- Audio configuration

### Users 

Users define certain set of configuration specifically for the user, such as the language, time and which modules are active for them.

### Module

A module is the concrete installation of a certain software or a combination of, split into a NixOS side and/or a home-manager side (`modules/<name>/nixos/` and `modules/<name>/home/`), since the two run as separate configuration trees. A module only needs to provide the side(s) it's relevant for — a system service like `greetd` is nixos-only, a per-user tool can be home-only, and something like `hyprland` provides both, with the two sides coordinating on the same underlying package where needed.

Each user lists which modules apply to them in `active-modules.nix`, e.g.:

```nix
[ "hyprland" "greetd" "git" ]
```

`modules/lib.nix` resolves that list into the matching `modules/<name>/<nixos|home>/default.nix` files for whichever side (nixos or home) is being built, silently skipping a module that has no side of that type. This list is the single source of truth for what's active — there's no separate "enabled" flag to keep in sync.

Personal values for an active module — like a git username/email, or hyprland keybinds/monitor layout — live in a same-named file directly under the user's `home/` directory (e.g. `users/absta/home/git.nix`), and are only pulled in when that module's name is in `active-modules.nix`.

## Diagram

```
+-----------------+
|     Machine     |
+-----------------+
         |
         | 1..*
         v
+-----------------+
|      User       |
+-----------------+
         |
         | active-modules.nix (list of names)
         v
+-----------------+
|     Module      |
+-----------------+
```
