{ config, pkgs, lib, ... }:
let
  fontPaths = [ ./OperatorMonoLig ./SFMono ];

  installFonts = paths: lib.mkMerge
    ((map
      ({ name, path }: { home.file.".local/share/fonts/${name}".source = "${path}/${name}"; })
      (builtins.concatMap
        (path: map
          (file: { name = file; path = path; })
          (builtins.attrNames (builtins.readDir path)))
        paths)) ++ [{ home.activation.cacheFonts = ''fc-cache''; }]);
in
installFonts fontPaths
