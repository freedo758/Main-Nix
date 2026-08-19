{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    

    # Editors & terminal
    neovim
    kitty
    # File management
    yazi
    gnome-disk-utility
  # Audio / network
    pavucontrol
    networkmanagerapplet
    iwgtk

 ];
}
