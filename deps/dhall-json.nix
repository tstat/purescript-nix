{ mkDerivation, aeson, aeson-pretty, base, bytestring, dhall
, fetchgit, optparse-applicative, stdenv, tasty, tasty-hunit, text
, unordered-containers, vector, yaml
}:
mkDerivation {
  pname = "dhall-json";
  version = "1.2.6";
  src = fetchgit {
    url = "https://github.com/dhall-lang/dhall-haskell";
    sha256 = "1scs3g7xhk6nmyzdxq0p117lcxz45d9s7qk0zd1zj1i7swpdlqg1";
    rev = "04ec45803dff952a1c4d7850789eea47fe8881b0";
  };
  postUnpack = "sourceRoot+=/dhall-json; echo source root reset to $sourceRoot";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base dhall optparse-applicative text unordered-containers
  ];
  executableHaskellDepends = [
    aeson aeson-pretty base bytestring dhall optparse-applicative text
    vector yaml
  ];
  testHaskellDepends = [
    aeson base bytestring dhall tasty tasty-hunit text
  ];
  description = "Compile Dhall to JSON or YAML";
  license = stdenv.lib.licenses.bsd3;
}
