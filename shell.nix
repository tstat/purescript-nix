let pkgs = import <nixpkgs> {};
    ps   = import ./default.nix {};
in with pkgs.haskell.lib;
  pkgs.stdenv.mkDerivation
  {
    name = "purescript-env";
    buildInputs = [
    (justStaticExecutables ps.purescript)
    (justStaticExecutables ps.spago)
    ];
  }
