{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        # terminal
        hello
        # visual packages.
    ];
}
