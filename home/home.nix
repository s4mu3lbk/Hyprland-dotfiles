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
    #discord
    #librewolf
    cool-retro-term
    bibata-cursors
    #vscode
    lollypop
    #lutris
    openrgb
    #betterdiscord-installer
    

    #utils
    vifm
    #ranger
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
    eza
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
