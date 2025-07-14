{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    rustc
    cargo
    clang
    llvmPackages.libclang
    pkg-config
    cmake
    openssl
    protobuf
    zlib
    libusb1
    rocksdb
  ];

  LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
  BINDGEN_EXTRA_CLANG_ARGS = "-I${pkgs.llvmPackages.libclang.lib}/lib/clang/${pkgs.llvmPackages.libclang.version}/include";

  shellHook = ''
    if [ -f "$PWD/sui/target/release/sui" ]; then
      alias sui="$PWD/sui/target/release/sui"
    fi
  '';
}
