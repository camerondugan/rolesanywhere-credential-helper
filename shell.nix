{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    swtpm
    tpm2-tools
    tpm2-abrmd
    tpm2-openssl
    softhsm
    gnutls
    dbus
  ];

  shellHook = ''
    export OPENSSL_MODULES=${pkgs.tpm2-openssl}/lib/ossl-modules
    export PATH=${pkgs.tpm2-openssl}/bin:$PATH
    export LD_LIBRARY_PATH=${pkgs.tpm2-tss}/lib:''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
  '';
}
