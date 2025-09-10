{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kubectl
    argocd
    kubernetes-helm
    sops
    age
  ];
}
