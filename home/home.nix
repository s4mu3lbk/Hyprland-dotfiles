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

    #User Apps
    celluloid
    discord
    vivaldi
    bibata-cursors
    lollypop
    betterdiscord-installer

    #utils
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
