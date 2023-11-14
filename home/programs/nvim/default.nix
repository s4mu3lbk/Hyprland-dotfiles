{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    #extraConfig = lib.fileContents ./config/init.lua;
  };
}
