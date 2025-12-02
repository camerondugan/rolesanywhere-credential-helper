{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    swtpm
    tpm2-tools
    tpm2-abrmd
    softhsm
    gnutls
    dbus
    tpm2-tss
    openssl
    tpm2-openssl
  ];

  shellHook = ''
    export OPENSSL_MODULES="${pkgs.tpm2-openssl}/lib/ossl-modules"
    export LD_LIBRARY_PATH="${pkgs.tpm2-tss}/lib:''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  '';
}
