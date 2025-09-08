# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    ./git.nix
    ./fish.nix
    ./k8s.nix
  ];

  environment.systemPackages = with pkgs; [
    nvim-pkg
    tmux
    python3
    fzf
    pay-respects
    nix-index
    cacert
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";
  programs.fish.enable = true;
  networking.proxy.httpProxy = "http://localhost:3128/";
  networking.proxy.httpsProxy = "http://localhost:3128/";
  networking.proxy.noProxy = ".muc, .dca, .w1, .w2, .w3, .w4, .w6, .w7, .w8, .w9, .w10.com, .w10, .w12, .w30, .w34, .w35, .w50, .nlde, .rlan, .sub, .uswl, .vdc, .bmw.co.at, .bank, .bkk, .bba, .zi, .zh, .gdc, .bmw.corp, .intranet, .swinp.net, .bkk.lokal, .miramas.sub, .intbmw.corp, .bmwgroup.net, .3000ip.rservices.com, .session.rservices.com, .portal.magnasteyr.com, .cp.thomsonreuters.net, .commerce.reuters.com, .customers.reuters.com, .sfam.americas.bmw.corp, .webmail.magnasteyr.com, .webmail01.magnasteyr.com, .webmail02.magnasteyr.com, webmail.bmw-motorsport.corp, .extranet.thomsonreuters.biz, autodiscover.bmw-motorsport.corp, .dlinezrh.radianz.net, .markets.reuters.com, .radianz.factiva.com, .rapid.reuters.com, .spe-ch-md9.net, .williams.co.uk, .dbah0000.local, bealocalhost.de, *.amadeusvista.com, *1a.amadeus.net, *.amadeuscruise.com, *.amadeusferry.com, *1a.amadeusprintservices.com, *1a.de.amadeusprintservices.com, *.amadeusvista.de, .destino.servers.ip.start.de, irisplus.ecom.age.amadeus.net, portevo.servers.ip.start.de, vpn-service.de.amadeus.com, vpn-service.extranet.de.amadeus.com, *.group-net.*, *.cloud.bmw, *.adas.intel.com, *sj.intel.com, *.advantagedp.org, *.minervadp.org, *addpchina.com, *aws.orionadp.com		, 10.*, 52.239.141.196, 53.8.83.207, 53.8.83.41, 62.157.104.*, 62.180.104.*, 77.246.0.227, 80.190.134.82, 81.252.108.163, 103.4.170.*, 103.4.171.*, 106.184.19.182, 106.184.19.183, 114.66.80.*, 114.66.81.100, 114.66.81.101, 114.66.81.104, 121.134.27.3, 121.134.28.4, 122.56.19.149, 122.200.123.100, 122.200.123.101, 122.200.123.104, 125.22.57.132, 134.191.209.*, 134.191.210.*, 134.191.211.*, 134.191.212.*, 134.191.197.*, 134.191.198.*, 134.191.199.*, 134.191.230.*, 135.160.62.*, 136.140.137.*, 141.36.86.2, 141.77.*, 157.147.*, 157.148.*, 160.46.*, 160.47.*, 160.48.*, 160.49.*, 160.50.*, 160.51.*, 160.52.*, 169.254.*, 170.34.*, 171.17.241.*, 172.16.*, 172.17.*, 172.18.*, 172.19.*, 172.20.*, 172.21.*, 172.22.*, 172.23.*, 172.24.*, 172.25.*, 172.26.*, 172.27.*, 172.28.*, 172.29.*, 172.30.*, 172.31.*, 176.74.12.21, 192.109.62.*, 192.109.63.*, 192.109.70.*, 192.109.183.*, 192.109.187.132, 192.109.187.133, 192.109.189.*, 192.109.190.*, 192.168.*, 193.23.35.*, 193.23.38.*, 193.23.40.101, 193.23.41.*, 193.23.43.0, 193.23.45.3, 193.169.13.*, 193.187.196.*, 193.187.198.*, 193.187.200.180, 193.187.202.*, 194.31.198.*, 194.55.179.105, 194.76.166.*, 194.151.168.222, 194.156.170.*, 194.172.113.*, 194.223.*, 194.229.209.*, 195.145.81.*, 195.149.243.*, 165.207.248.*, 196.4.168.54, 202.255.238.*, 202.255.239.*, 203.6.143.162, 203.231.146.*, 203.146.122.85, 217.7.106.*, 194.206.111.*, 81.80.201.*, 193.53.107.150, 207.248.117.36, 207.248.117.37, 58.82.152.213, 192.78.160.*, 192.78.161.*, 192.78.162.*, 192.78.163.*, 192.78.164.*, 192.78.165.*, 192.78.166.*, 192.78.167.*, 192.78.168.*, 192.78.169.*, 192.78.170.*, 192.78.171.*, 192.78.172.*, 192.78.173.*, 192.78.174.*, 192.78.175.*, 192.78.192.*, 192.78.193.*, 192.78.194.*, 192.78.195.*, 192.78.196.*, 192.78.197.*, 192.78.198.*, 192.78.199.*, 192.78.200.*, 192.78.201.*, 192.78.202.*, 192.78.203.*, 192.78.204.*, 192.78.205.*, 192.78.206.*, 192.78.207.*, 185.221.48.*, 162.14.176.1, 162.14.176.2, 162.14.176.3, 162.14.176.4, 162.14.176.5, 162.14.176.6, 162.14.176.7, 162.14.176.8, 162.14.176.9, 162.14.176.10, 162.14.176.11, 162.14.176.12, 162.14.176.13, 162.14.176.14, 162.14.176.15, gcx-campus.eu, portal.gcx-campus.eu, mdm.bmwgroup.com, mdm-int.bmwgroup.com, sync-test.bmwgroup.com, sync.bmwgroup.com, sync-int.bmwgroup.com, uctemeapool21.bgmtest.info, uctemeapool33.bgmtest.info, 1a.bahn.de.amadeus.com, ucjoin.bgmtest.info, academy.bmw.criticaltechworks.com, ctw-build-002.bmw.criticaltechworks.com, atoms.criticaltechworks.com, ctwpulsar.criticaltechworks.com, dslauncher.3ds.com, *.sddc-54-93-52-254.vmwarevmc.com, *.workspace.bmw, vpc-*.eu-central-1.es.amazonaws.com, vpc-*.eu-west-1.es.amazonaws.com, vpc-*.us-east-1.es.amazonaws.com, deviceonboarding.gcx-campus.eu, staging-deviceonboarding.gcx-campus.eu, seww06kbforward2storage.blob.core.windows.net, tseww34kbforward2storage.blob.core.windows.net, local.signotecwebsocket.de, wbc-live-eip-cdn.edge-cdn.net, wbc-live-1-eip-cdn.edge-cdn.net, streaming-prod.edge-cdn.net, streaming-prod-1.edge-cdn.net, vod-eip.video-cdn.net, *.refinitiv.net, *.refinitiv.biz, *.bmwmail-int.com, *.appserviceenvironment.net, *.bmwbrill.cn, extranet.bmwnet.nl, etxbmwvih.infineon.com, vihllzebu01.vih.infineon.com, wbc-live-eip-bkp-cdn.edge-cdn.net, wbc-live-eip-bkp-2-cdn.edge-cdn.net, wbc-main-03-eip.edge-cdn.net, wbc-bkp-03-eip.edge-cdn.net, streaming-prod-4.edge-cdn.net, ingest-main-03.edge-cdn.net, ingest-bkp-03.edge-cdn.net, bmw-test.privilegecloud.cyberark.cloud, bmw-int.privilegecloud.cyberark.cloud, bmw.privilegecloud.cyberark.cloud, *.vpce.eu-central-1.aws.elastic-cloud.com, lspro-streaming-1-eip-primary.movingimage.com, lspro-streaming-1-eip-backup.movingimage.com, *.vpce.eu-west-1.aws.elastic-cloud.com, *.vpce.us-east-1.aws.elastic-cloud.com, eu162.epm.cyberark.com, eu.epm.cyberark.com, *.privatelink.snowflakecomputing.com, *.privatelink.snowflake.app, *private-bmw*.grafana.azure.com, *private-bmw*.azurewebsites.net, *privatelink.vaultcore.azure.net, *privatelink.azuredatabricks.net			, *.sso.bmwgroup.com, private-bmw-*.adb.*.oraclecloudapps.com, private-bmw-*.adb.*.oraclecloud.com, *privatebmw*.vault.azure.net, *privatebmw*.core.windows.net, *.privatelink.openai.azure.com, *.privatelink.cognitiveservices.azure.com, *.privatelink.azurewebsites.net, *.aws.orionadp.cn, *privatebmw*.azconfig.io, *.private.spotlight.cn, taurus-sp.fasas.telekom.de, 127.0.0.1, localhost";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  security.pki.certificates = [ 
    (builtins.readFile /etc/nixos/certs/GlobalSign_OU_R6_SHA384.crt)
    (builtins.readFile /etc/nixos/certs/GlobalSign_OU_R3_SHA256.crt)
    (builtins.readFile /etc/nixos/certs/BMW_Group_4096_Root.crt)
    (builtins.readFile /etc/nixos/certs/AmazonRootCA2.crt)
    (builtins.readFile /etc/nixos/certs/DigiCertGlobalRootCA.crt)
    (builtins.readFile /etc/nixos/certs/AmazonRootCA4.crt)
    (builtins.readFile /etc/nixos/certs/GlobalSign_OU-ECC_R5.crt)
    (builtins.readFile /etc/nixos/certs/D-TRUST_Root_Class_3_CA_2_2009.crt)
    (builtins.readFile /etc/nixos/certs/BMW_Group_Root_CA_V2.crt)
    (builtins.readFile /etc/nixos/certs/Starfield_Services_Root_Certificate_Authority_G2.crt)
    (builtins.readFile /etc/nixos/certs/DigiCertGlobalRootG2.crt)
    (builtins.readFile /etc/nixos/certs/GlobalSign_Root_R46_SHA384.crt)
    (builtins.readFile /etc/nixos/certs/ISRGRootX1.crt)
    (builtins.readFile /etc/nixos/certs/AmazonRootCA1.crt)
    (builtins.readFile /etc/nixos/certs/DigiCertTrustedRootG4.crt)
    (builtins.readFile /etc/nixos/certs/ISRGRootX2.crt)
    (builtins.readFile /etc/nixos/certs/SwissSign_Gold_CA_G2.crt)
    (builtins.readFile /etc/nixos/certs/GlobalSign_Root_E46_SHA384.crt)
    (builtins.readFile /etc/nixos/certs/BMW_Group_Root_CA_V3.crt)
    (builtins.readFile /etc/nixos/certs/QuoVadis_Root_CA_2_G3.crt)
    (builtins.readFile /etc/nixos/certs/SFSRootCAG2.crt)
    (builtins.readFile /etc/nixos/certs/G2-RootCA4.orig.crt)
    (builtins.readFile /etc/nixos/certs/AmazonRootCA3.crt)
    (builtins.readFile /etc/nixos/certs/D-TRUST_Root_Class_3_CA_2_EV_2009.crt)
  ];
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
