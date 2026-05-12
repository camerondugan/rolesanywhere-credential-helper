{ pkgs ? import (builtins.fetchTarball {
    # nixpkgs with Go 1.26.2
    url = "https://github.com/NixOS/nixpkgs/archive/01fbdeef22b76df85ea168fbfe1bfd9e63681b30.tar.gz";
  }) {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    openssl_3
  ];
}
