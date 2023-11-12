{ config, pkgs, ... }:

{
  home = {
    sessionVariables = {
    EDITOR = "lvim";
    BROWSER = "vivaldi";
    TERMINAL = "alacritty";
    LIBVA_DRIVER_NAME= "i915"; # hardware acceleration
    __GL_VRR_ALLOWED="1";
    WLR_DRM_DEVICES="/dev/dri/card0";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    };
  };
}
