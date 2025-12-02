{ pkgs ? import <nixpkgs> {} }:

# Full test environment with TPM and PKCS11 support
# Use nix/shell-base.nix for builds only
# Use nix/shell-tpm.nix for TPM tests only
# Use nix/shell-pkcs11.nix for PKCS11 tests only

pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    openssl_3
    swtpm
    tpm2-tools
    tpm2-abrmd
    softhsm
    gnutls
    dbus
    tpm2-tss
    tpm2-openssl
  ];

  shellHook = ''
    export TPM2_OPENSSL="${pkgs.tpm2-openssl}"
    export TPM2_TSS="${pkgs.tpm2-tss}"
    export OPENSSL_MODULES="${pkgs.tpm2-openssl}/lib/ossl-modules"
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [ pkgs.tpm2-tss pkgs.tpm2-abrmd pkgs.tpm2-openssl ]}:''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  '';
}
