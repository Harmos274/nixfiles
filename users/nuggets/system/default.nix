{ pkgs, ... }: {

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nuggets = {
    isNormalUser = true;
    home = "/home/nuggets";
    description = "Nuggets";
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];
  };

}
