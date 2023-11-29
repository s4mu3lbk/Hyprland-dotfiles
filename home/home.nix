{ hyprland, pkgs, ... }: {

  imports = [
    hyprland.homeManagerModules.default
    #./environment
    ./programs
    ./scripts
    ./themes
  ];

  home = {
    username = "samuelb";
    homeDirectory = "/home/samuelb";
  };

  home.packages = (with pkgs; [
    # vIM 
    ripgrep
    fd
    lazygit
    unzip
    gcc
    tree-sitter

    #User Apps
    celluloid
    discord
    vivaldi
    bibata-cursors
    lollypop
    betterdiscord-installer

    #utils
    flameshot
    fzf
    fasd
    vifm
    wlr-randr
    git
    gitflow
    gnumake
    catimg
    curl
    appimage-run
    xflux
    dunst
    pavucontrol

    #misc 
    telegram-desktop
    rofi
    httpie
    nitch
    wget
    grim
    slurp
    wl-clipboard
    pamixer
    mpc-cli
    tty-clock
    exa
    btop

  ]) ++ (with pkgs.gnome; [ nautilus zenity gnome-tweaks eog gedit ]);

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";
}
