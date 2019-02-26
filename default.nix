{ compiler ? "ghc844" }:

let pkgs = let dat = {
                 url = "https://github.com/NixOS/nixpkgs-channels";
                 ref = "nixos-18.09";
               };
           in import (builtins.fetchGit dat) { inherit config; };

    config = {
      packageOverrides = pkgs: rec {
        haskell = pkgs.haskell // {
          packages = pkgs.haskell.packages // {
            ghc-spago = pkgs.haskell.packages."${compiler}".override {
              overrides = self: super: with pkgs.haskell.lib; rec {
                dhall = dontCheck (self.callPackage ./deps/dhall.nix {});
                dhall-json = dontCheck (self.callPackage ./deps/dhall-json.nix {});
                async-pool = self.callPackage ./deps/async-pool.nix {};
                cborg-json = self.callPackage ./deps/cborg-json.nix {};
                megaparsec = self.callPackage ./deps/megaparsec.nix {};
                repline = self.callPackage ./deps/repline.nix {};
                serialise = self.callPackage ./deps/serialise.nix {};
                versions = self.callPackage ./deps/versions.nix {};
                Win32 = self.callPackage ./deps/Win32.nix {};
              };
            };
          };
        };
      };
    };

    ghc = pkgs.haskell.packages.ghc844;
    purescript = ghc.callPackage ./purescript-0.12.3.nix {};
    spago = pkgs.haskell.packages.ghc-spago.callPackage ./spago-0.6.4.0.nix {};
in
{
  inherit purescript spago;
}
