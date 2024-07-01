{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [ libusb1 libudev-zero python39 usbutils hidapi gdb ];

  shellHook = ''
    export PIP_CACHE_DIR="$PWD/.cache"

    # With nix you can do `python setup.py install --with-system-hidapi`
    export C_INCLUDE_PATH="${pkgs.hidapi.outPath}/include/hidapi"

    python -m venv venv
    source venv/bin/activate
  '';
}
