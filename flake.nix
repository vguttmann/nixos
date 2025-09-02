{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    nixvim.url = github:jkulzer/nvim-nix;
    config-nix-nvim.url = github:vguttmann/config-nix.nvim;
  };
  outputs = { self, nixpkgs, nixvim, config-nix-nvim }: {
    # replace 'joes-desktop' with your hostname here.
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        overlays = [
          config-nix-nvim.overlays.default
          (final: prev: {
            neovim = nixvim.packages.x86_64-linux.default;
          })
        ];
      };


    };
  };
}
