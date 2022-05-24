{ config, pkgs, lib, ... }:
let
  fontPaths = [ ./OperatorMonoLig ./SFMono ./ComicCodeLig ];
in
lib.mkMerge ((map
  ({ name, path }: { home.file.".local/share/fonts/${name}".source = "${path}/${name}"; })
  (builtins.concatMap
    (path: map
      (file: { name = file; path = path; })
      (builtins.attrNames (builtins.readDir path)))
    fontPaths)) ++ [{ home.activation.cacheFonts = ''fc-cache''; }])
