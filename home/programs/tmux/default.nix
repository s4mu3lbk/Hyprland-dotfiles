{ config, lib, pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    keyMode = "vi";
    prefix = "C-a";
    #term = "xterm-256color";
  };
}
