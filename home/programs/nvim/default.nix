{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    #extraConfig = lib.fileContents ./config/init.lua;
    extraConfig = ''
      set number relativenumber
      set shiftwidth 2
      set tabstop 2
    '';
  };
}
