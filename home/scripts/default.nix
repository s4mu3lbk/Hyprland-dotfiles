{ config, lib, pkgs, ... }:

let
  rofi1 = pkgs.writeShellScriptBin "rofi1" ''
    ~/.config/rofi/launchers/type-1/launcher.sh
  '';
  rofi2 = pkgs.writeShellScriptBin "rofi2" ''
    ~/.config/rofi/launchers/type-2/launcher.sh
  '';
  rofiWindow = pkgs.writeShellScriptBin "rofiWindow" ''
    #!/usr/bin/env bash
    ## Run
    rofi \
        -show drun \
        -theme "$HOME/.config/rofi/theme.rasi"
  '';
in { home.packages = with pkgs; [ rofi1 rofi2 rofiWindow ]; }
