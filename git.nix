{pkgs, ...}: {
  programs.git = {
    enable = true;
    config = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      pull.rebase = true;
      safe.directory = "/etc/nixos";
    }; # config closed
  };
}
