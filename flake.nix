{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    nixvim.url = github:jkulzer/nvim-nix;
  };
  outputs = { self, nixpkgs, nixvim }: {
    # replace 'joes-desktop' with your hostname here.
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
      system = "x86_64-linux";


      pkgs = import nixpkgs {
        overlays = [
          (final: prev: {
            neovim = nixvim.packages.x86_64-linux.default;
          })
        ];
      };


    };
  };
}
