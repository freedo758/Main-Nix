{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Media & creative
    blender
    davinci-resolve
    ffmpeg
    gimp
    obs-studio
    #    handbrake
    vlc
    moviebox-tui

    # Better Yazi previews
    ffmpegthumbnailer
    imagemagick
    poppler-utils

    # File management
    yazi

    # File Editor
    vscode
  ];
}
