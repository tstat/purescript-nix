{ mkDerivation, base, bytestring, case-insensitive, containers
, criterion, deepseq, hspec, hspec-expectations, mtl
, parser-combinators, QuickCheck, scientific, stdenv, text
, transformers, weigh
}:
mkDerivation {
  pname = "megaparsec";
  version = "7.0.3";
  sha256 = "80d28ceb220381de73af017217f20e9e60ab569160a177450ad78776bad1cffe";
  libraryHaskellDepends = [
    base bytestring case-insensitive containers deepseq mtl
    parser-combinators scientific text transformers
  ];
  testHaskellDepends = [
    base bytestring case-insensitive containers hspec
    hspec-expectations mtl parser-combinators QuickCheck scientific
    text transformers
  ];
  benchmarkHaskellDepends = [
    base containers criterion deepseq text weigh
  ];
  homepage = "https://github.com/mrkkrp/megaparsec";
  description = "Monadic parser combinators";
  license = stdenv.lib.licenses.bsd2;
}
