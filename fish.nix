{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fish
    grc
    fishPlugins.grc
    fishPlugins.plugin-git
    fishPlugins.done
    fishPlugins.fish-you-should-use
    zoxide
    tree
  ];
  environment.variables = {
    _PR_SHELL = "fish";
  };
programs.zoxide.enable = true;
programs.zoxide.enableFishIntegration = true;
  programs.fish = {
    enable = true;
    shellInit = "pay-respects fish | source && zoxide init fish | source && set NO_PROXY $no_proxy";
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --impure";
      commit = "git commit -p";
      amend = "git commit -a --amend";
      sync = "git pull local main && git rebase --root --exec 'git commit --amend --no-edit --reset-author' && git push --force";
    };
  };
  users.extraUsers.nixos = {
    shell = pkgs.fish;
  };
}
