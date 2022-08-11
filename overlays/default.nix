final: prev:
{
  # Fix lags and crashed from Discord
  unlaggy-discord-canary = prev.discord-canary.overrideAttrs (_: {
    commandLineArgs =
      "--ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy";
  });

  jetbrains = prev.jetbrains // {
    webstorm = prev.jetbrains.webstorm.overrideDerivation
      (_: rec {
        name = "webstorm-${version}";
        version = "222.3345.94";

        src = prev.fetchurl
          {
            url = "https://download.jetbrains.com/webstorm/WebStorm-${version}.tar.gz";
            sha256 = "sha256-cxGjXv926GPvdrjgldPxNGnGUQVSfZF0xS/wna6jHnk=";
          };
      });
  };



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
      rev = "ecb85ab6ba0aab0531fff32786dfc51feea19370";
      sha256 = "sha256-wkKDVVL2/rUGokxs4kqCE+ZzxljBqYDZvBuQGVGXYJM=";
    })
    {
      ghcVersions = [ "9.0.2" ];
    };
}
