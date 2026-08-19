{ ... }:


{
  programs.git = {
    enable = true;
    settings.user.name = "Freedo758";
    settings.user.email = "alfredleofaus@gmail.com";
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
programs.ssh = {
  settings.enable = true;
 
 matchBlocks = {
    "github.com" = {
      hostname = "github.com";
      user = "git";
      identityFile = "~/.ssh/id_ed25519";
    };
  };
};

}
