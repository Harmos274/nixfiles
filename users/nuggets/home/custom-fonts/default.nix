{ config, pkgs, lib, ... }:
let
  customFontPaths = {
    operatorMonoLig = ./OperatorMonoLig;
    sFMono = ./SFMono;
  };
in
{
  home.activation.installMyFonts = ''
    echo ":: Installing Operator Mono Lig..."
    cp ${customFontPaths.operatorMonoLig}/* $HOME/.local/share/fonts/
    echo ":: Installing San Fransisco Mono..."
    cp ${customFontPaths.sFMono}/* $HOME/.local/share/fonts/
    fc-cache
  '';
}
