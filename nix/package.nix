{
  perSystem = { pkgs, ... }: {
    packages.default = pkgs.stdenvNoCC.mkDerivation {
      name = "nix-israel-website";

      src = ../src;

      nativeBuildInputs = [
        pkgs.pandoc
      ];

      buildCommand = ''
        unpackPhase
        cd $sourceRoot

        pandoc \
          -c style.css \
          -H header.html \
          -V pagetitle='Nix Israel User Group' \
          -s index.md \
          -o index.html

        mkdir -p $out
        cp -v index.html *.css $out
      '';
    };
  };
}
