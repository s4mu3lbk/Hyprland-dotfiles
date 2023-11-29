{ config, lib, pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    keyMode = "vi";
    prefix = "C-a";
    terminal = "tmux-256color";
    escapeTime = 100;

    extraConfig = ''
      set-option -sa terminal-features ',tmux-256color:RGB'
    '';
  };
}
