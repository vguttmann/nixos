{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kubectl
    argocd
    helm
  ];
}
