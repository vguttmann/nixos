{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    config-nix-nvim.url = github:vguttmann/config-nix.nvim;
    vscode-server.url = github:nix-community/nixos-vscode-server;
  };
  outputs = { self, nixpkgs, config-nix-nvim, vscode-server }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        vscode-server.nixosModules.default
        ({ config, pkgs, ... }: {
          services.vscode-server.enable = true;
        })
      ];
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        overlays = [
          config-nix-nvim.overlays.default
        ];
      };


    };
  };
}
