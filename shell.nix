let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs {
    config = {};
    overlays = [];
  };
in
  pkgs.mkShellNoCC {
    packages = with pkgs; [
      python312
      pipx
      python312Packages.werkzeug
      python312Packages.cachelib
      python312Packages.flask
    ];
    shellHook = ''env PORT=5000 python lispy.py'';
  }
