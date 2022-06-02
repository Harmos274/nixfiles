final: prev:
{
  # Fix lags and crashed from Discord
  unlaggy-discord-canary = prev.discord-canary.overrideAttrs (_: {
    commandLineArgs =
      "--ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy";
  });


  # Add packages for purescript with nix
  # easy-ps = prev.callPackage import
  #   (prev.pkgs.fetchFromGitHub {
  #     owner = "justinwoo";
  #     repo = "easy-purescript-nix";
  #     rev = "cbcb53725c430de4e69f652d69c1677e17c6bcec";
  #     sha256 = "1r9lx4xhr42znmwb2x2pzah920klbjbjcivp2f0pnka7djvd2adq";
  #   })
  #   { pkgs = prev.pkgs; };

  # Add haskell-language-server
  easy-hls = prev.callPackage
    (prev.pkgs.fetchFromGitHub {
      owner = "jkachmar";
      repo = "easy-hls-nix";
      rev = "20451bf65497fe9f8a972671e9925bd41e7ee15e";
      sha256 = "Yd99o51HlzSYIKIMrYfdcumDyQ3Fz0S+r7G5PcCtXOM=";
    })
    { };
}
