{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        # terminal
        starship
        # visual packages.
    ];
}
