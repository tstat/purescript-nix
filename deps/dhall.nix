{ mkDerivation, aeson, aeson-pretty, ansi-terminal, base
, bytestring, case-insensitive, cborg, cborg-json, containers
, contravariant, criterion, cryptonite, deepseq, Diff, directory
, doctest, dotgen, exceptions, fetchgit, filepath, haskeline
, http-client, http-client-tls, http-types, lens-family-core
, megaparsec, memory, mockery, mtl, optparse-applicative, parsers
, prettyprinter, prettyprinter-ansi-terminal, QuickCheck
, quickcheck-instances, repline, scientific, serialise, stdenv
, tasty, tasty-hunit, tasty-quickcheck, template-haskell, text
, transformers, unordered-containers, uri-encode, vector
}:
mkDerivation {
  pname = "dhall";
  version = "1.20.1";
  src = fetchgit {
    url = "https://github.com/dhall-lang/dhall-haskell";
    sha256 = "1scs3g7xhk6nmyzdxq0p117lcxz45d9s7qk0zd1zj1i7swpdlqg1";
    rev = "04ec45803dff952a1c4d7850789eea47fe8881b0";
  };
  postUnpack = "sourceRoot+=/dhall; echo source root reset to $sourceRoot";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson aeson-pretty ansi-terminal base bytestring case-insensitive
    cborg cborg-json containers contravariant cryptonite Diff directory
    dotgen exceptions filepath haskeline http-client http-client-tls
    http-types lens-family-core megaparsec memory mtl
    optparse-applicative parsers prettyprinter
    prettyprinter-ansi-terminal repline scientific serialise
    template-haskell text transformers unordered-containers uri-encode
    vector
  ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [
    base containers deepseq directory doctest filepath mockery
    prettyprinter QuickCheck quickcheck-instances serialise tasty
    tasty-hunit tasty-quickcheck text transformers vector
  ];
  benchmarkHaskellDepends = [
    base bytestring containers criterion directory serialise text
  ];
  description = "A configuration language guaranteed to terminate";
  license = stdenv.lib.licenses.bsd3;
}
