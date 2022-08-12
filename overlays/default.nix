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
