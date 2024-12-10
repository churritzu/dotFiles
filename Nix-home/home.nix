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
    pkgs.git
    pkgs.lsd
    pkgs.ncdu
    pkgs.neofetch
    #pkgs.ranger
    pkgs.starship
    pkgs.tldr
    pkgs.yt-dlp
    pkgs.kanata
    pkgs.lazygit
    pkgs.zoxide
    pkgs.fzf
    pkgs.entr
    pkgs.just
    pkgs.taskwarrior3
    pkgs.pet

    # visual packages.
    pkgs.discord
    pkgs.dbeaver-bin
  ];

 nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
   "discord"
 ];

  home.file."./.wezterm.lua".source = ../wezterm.lua;
  home.file."./.gitconfig".source = ../gitconfig;
  home.file."./.taskrc".source = ../taskrc;
  home.file."./.tmux.conf".source = ../tmux.conf;
  home.file."./.vimrc".source = ../vimrc;
  home.file."./.bashrc".source = ../bashrc;
  home.file."./.bash_profile".source = ../bash_profile;
  home.file."./.config/starship/starship.toml".source = ../starship/starship.toml;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
