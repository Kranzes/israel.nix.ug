{
  inputs = {
    flake-parts = { url = "github:hercules-ci/flake-parts"; inputs.nixpkgs-lib.follows = "nixpkgs"; };
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    hercules-ci-effects = { url = "github:kranzes/hercules-ci-effects/netlify"; inputs.nixpkgs.follows = "nixpkgs"; };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        ./nix/package.nix
        ./nix/deployment.nix
        inputs.hercules-ci-effects.flakeModule
      ];
    };
}
