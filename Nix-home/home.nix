{ config, pkgs, ... }:

{
 home.username = "tupa";
 home.homeDirectory = "/home/tupa";

 home.stateVersion = "24.05"; # Please read the comment before changing.

 # nixpkgs.config.allowUnfree = true;

 home.packages = [
    # Terminal
    pkgs.btop
    pkgs.fd
    pkgs.lsd
    pkgs.ncdu
    pkgs.neofetch
    pkgs.ranger
    pkgs.tldr
    pkgs.yt-dlp

    # visual packages.
    pkgs.discord
  ];

 nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
   "discord"
 ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
