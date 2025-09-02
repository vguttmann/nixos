{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zoxide
  ];
  programs.zoxide.enableFishIntegration = true;
}


