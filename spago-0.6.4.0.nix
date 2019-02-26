{ mkDerivation, aeson, aeson-pretty, async-pool, base, bytestring
, containers, dhall, dhall-json, fetchgit, file-embed, filepath
, github, hpack, network-uri, prettyprinter, process, stdenv
, template-haskell, text, turtle
}:
mkDerivation {
  pname = "spago";
  version = "0.6.4.0";
  src = fetchgit {
    url = "https://github.com/spacchetti/spago.git";
    sha256 = "0g7xyv259x1riry282lwbb9rkc72j56939inlmigib93v3xqcj4l";
    rev = "6947bf1e9721b4e8a5e87ba8a546a7e9c83153e9";
  };
  isLibrary = false;
  isExecutable = true;
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [
    aeson aeson-pretty async-pool base bytestring containers dhall
    dhall-json file-embed filepath github network-uri prettyprinter
    process template-haskell text turtle
  ];
  preConfigure = "hpack";
  homepage = "https://github.com/spacchetti/spago#readme";
  license = stdenv.lib.licenses.bsd3;
}
