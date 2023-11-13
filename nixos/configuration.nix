{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../hosts/desktop
    ];

  # Bootloader.
  boot.kernelParams = [ "i915.force_probe=a7a0" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Addis_Ababa";

  services.xserver = {
    enable = true;

    # X11 keymap
    layout = "us";
    xkbVariant = "dvp";
  };

  services.blueman.enable = true;

  #NvidiaConfig
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware= {
    opengl.enable = true;
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;

    opengl.extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];

    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    pulseaudio.enable = false;
  };

  # Configure console keymap
  console.keyMap = "dvorak-programmer";

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # add /.local to $PATH
  environment.variables={
   NIXOS_OZONE_WL = "1";
   PATH = [
     "\${HOME}/.local/bin"
     "\${HOME}/.config/rofi/scripts"
   ];
   NIXPKGS_ALLOW_UNFREE = "1";
  };
  
  users.users.samuelb = {
    isNormalUser = true;
    description = "Samuel";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      neofetch
      lolcat
   ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Garbage colector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.autoUpgrade = {
   enable = true;
   channel = "https://nixos.org/channels/nixos-23.05";
  };
 
  system.stateVersion = "23.05";
  
  #Flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
 };
}
