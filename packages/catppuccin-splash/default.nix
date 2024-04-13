{ stdenv
, imagemagick

, flavour ? "macchiato"

, ...
}:

let
  palette = import ../palette.nix;
in
stdenv.mkDerivation {
  pname = "catppuccin-splash";
  version = "1.0.0";

  dontUnpack = true;

  buildInputs = [ imagemagick ];

  installPhase = ''
    convert -size 1000x1000 xc:'${builtins.toString palette.${flavour}.base}' PNG:$out
  '';
}