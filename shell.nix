with import <nixpkgs> {};

stdenv.mkDerivation rec {
  pname = "piece-maker-shell";
  version = "0.1.0";
  buildInputs = with pkgs; [
    hivemind
    yarn
  ];
}
