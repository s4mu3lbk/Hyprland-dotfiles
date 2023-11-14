{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = lib.fileContents ./init.lua;
  };
}
