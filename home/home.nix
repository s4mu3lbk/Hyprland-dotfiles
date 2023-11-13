{ hyprland, pkgs, ...}: {

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
    cool-retro-term
    bibata-cursors
    lollypop
    openrgb
    betterdiscord-installer
    

    #utils
    fzf
    grc
    fasd
    vifm
    wlr-randr
    git
    rustup
    gnumake
    catimg
    curl
    appimage-run
    xflux
    dunst
    pavucontrol

    #misc 
    cava
    neovim
    neovide
    nano
    rofi
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

  ]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    eog
    gedit
  ]);

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";
}
