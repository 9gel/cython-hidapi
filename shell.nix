{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [ libusb1 libudev-zero python39 usbutils hidapi gdb ];

  shellHook = ''
    export PIP_CACHE_DIR="$PWD/.cache"
    python -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
  '';
}
