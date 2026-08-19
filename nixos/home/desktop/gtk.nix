{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "macOS";
      package = pkgs.apple-cursor;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    # Matugen writes ~/.config/generated/gtk-colors.css; GTK3 can @import it
    # without Home Manager ever owning that file's contents.
    gtk3.extraCss = ''
      @import url("${config.home.homeDirectory}/.config/gtk-3.0/colors.css");
    '';
gtk4.extraCss = ''
      @import url("${config.home.homeDirectory}/.config/gtk-4.0/colors.css");
    '';
  };

  # ---------------------------------------------------------------------
  # nwg-look can't persist a theme choice because Home Manager's gtk.enable
  # writes settings.ini as a symlink into the read-only Nix store — nwg-look
  # tries to write directly to that path and fails (silently, or by
  # replacing the symlink, which then gets clobbered on the next switch).
  #
  # This activation script runs after HM writes its files: it copies the
  # store version of settings.ini over the symlink, turning it into a real,
  # writable file. nwg-look can then edit it and have the change stick
  # in-session. Home Manager remains the source of truth — every
  # `home-manager switch` re-runs this and resets settings.ini back to
  # what's declared above (adw-gtk3-dark), so nwg-look edits are only
  # ever a temporary override, not a way to drift from this config.
  # ---------------------------------------------------------------------
  home.activation.makeGtkSettingsWritable = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    for f in "$HOME/.config/gtk-3.0/settings.ini" "$HOME/.config/gtk-4.0/settings.ini"; do
      if [ -L "$f" ]; then
        real_path=$(readlink -f "$f")
        rm -f "$f"
        cp "$real_path" "$f"
        chmod u+w "$f"
      fi
    done
  '';
}
