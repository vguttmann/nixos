{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fish
  ];
  environment.variables = {
    _PR_SHELL = "fish";
  };
  programs.fish = {
    enable = true;
    shellInit = "pay-respects fish | source";
  };
  users.extraUsers.nixos = {
    shell = pkgs.fish;
  };
}


