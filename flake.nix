{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system;};
    lib = pkgs.lib;
    buildInputs = with pkgs; [
      slint-lsp
      slint-viewer

      pkgs.stdenv.cc.cc.lib

      pkg-config
      openssl

      fontconfig
      freetype
      libGL
      egl-wayland
      wayland

      xorg.libX11
      xorg.libXcursor
      xorg.libXi
      libxkbcommon
      gtk3
    ];
  in {
    devShells.${system}.default = pkgs.mkShell {
      inherit buildInputs;
      nativeBuildInputs = buildInputs;
      LD_LIBRARY_PATH = lib.makeLibraryPath buildInputs;
    };
  };
}
