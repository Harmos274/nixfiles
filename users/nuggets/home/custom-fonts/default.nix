{ config, pkgs, lib, ... }: {
  home.activation.installMyFonts = ''
    echo ":: Installing Operator Mono Lig..."
    cp $HOME/nixfiles/custom-fonts/OperatorMonoLig/* $HOME/.local/share/fonts/
    echo ":: Installing San Fransisco Mono..."
    cp $HOME/nixfiles/custom-fonts/SFMono/* $HOME/.local/share/fonts/
    fc-cache
  '';
}
