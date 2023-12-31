{ config, lib, pkgs, ... }:

{
  imports = [ ./hyprland-environment.nix ];

  home.packages = with pkgs; [
    waybar
    xwayland
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    swww
  ];

  #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''

          # Monitor
          monitor=,preferred,auto,1.5

          # Fix slow startup
          exec systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
          exec dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP 

          # Autostart

          exec-once = hyprctl setcursor Bibata-Modern-Classic 24
          exec-once = dunst

          source = /home/samuelb/.config/hypr/colors
          exec = pkill waybar & sleep 0.5 && waybar
          exec-once = swww init & sleep 0.5 && exec wallpaper_random
          # exec-once = swww img /home/samuelb/Imagens/wallpapers/konichiwa.png

          # Set en layout at startup

          # Input config
          input {
              kb_layout = us
              kb_variant = dvp
              kb_model =
              kb_options = ctrl:nocaps
              kb_rules =

              follow_mouse = 1

              touchpad {
                  natural_scroll = false
              }

              sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
          }

          general {

              gaps_in = 5
              gaps_out = 10
              border_size = 2
              col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
              col.inactive_border = rgba(595959aa)

              layout = dwindle
          }

          decoration {

              rounding = 5
              blur = true
              blur_size = 3
              blur_passes = 1
              blur_new_optimizations = true

              drop_shadow = true
              shadow_range = 4
              shadow_render_power = 3
              col.shadow = rgba(1a1a1aee)
          }

          animations {
              enabled = yes

              bezier = ease,0.4,0.02,0.21,1

              animation = windows, 1, 3.5, ease, slide
              animation = windowsOut, 1, 3.5, ease, slide
              animation = border, 1, 6, default
              animation = fade, 1, 3, ease
              animation = workspaces, 1, 3.5, ease
          }

          dwindle {
              pseudotile = yes
              preserve_split = yes
          }

          master {
              new_is_master = yes
          }

          gestures {
              workspace_swipe = true
      	workspace_swipe_fingers = 3
          }

          # Example windowrule v1
          # windowrule = float, ^(kitty)$
          # Example windowrule v2
          # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

          windowrule=float,^(kitty)$
          windowrule=float,^(pavucontrol)$
          windowrule=center,^(kitty)$
          windowrule=float,^(blueman-manager)$
          windowrule=size 600 500,^(kitty)$
          windowrule=size 934 525,^(mpv)$
          windowrule=float,^(mpv)$
          windowrule=center,^(mpv)$
          #windowrule=pin,^(firefox)$

          $mainMod = SUPER
          bind = $mainMod, G, fullscreen,


          #bind = $mainMod, RETURN, exec, cool-retro-term-zsh
          bind = $mainMod, RETURN, exec, alacritty
          bind = $mainMod, B, exec, vivaldi
          bind = $mainMod, Q, killactive,
          bind = $mainMod, M, exit,
          bind = $mainMod, N, exec, nautilus
          bind = $mainMod, F, fullscreen
          bind = $mainMod, V, togglefloating,
          bind = $mainMod, w, exec, wofi --show drun
          bind = $mainMod, R, exec, rofiWindow
          bind = $mainMod, P, pseudo, # dwindle
          bind = $mainMod, J, togglesplit, # dwindle

          # Switch Keyboard Layouts
          bind = $mainMod, SPACE, exec, hyprctl switchxkblayout teclado-gamer-husky-blizzard next

          bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
          bind = SHIFT, Print, exec, grim -g "$(slurp)"

          # Functional keybinds
          bind =,XF86AudioMicMute,exec,pamixer --default-source -t
          bind =,XF86MonBrightnessDown,exec,light -U 20
          bind =,XF86MonBrightnessUp,exec,light -A 20
          bind =,XF86AudioMute,exec,pamixer -t
          bind =,XF86AudioLowerVolume,exec,pamixer -d 10
          bind =,XF86AudioRaiseVolume,exec,pamixer -i 10
          bind =,XF86AudioPlay,exec,playerctl play-pause
          bind =,XF86AudioPause,exec,playerctl play-pause

          # to switch between windows in a floating workspace
          bind = SUPER,Tab,cyclenext,
          bind = SUPER,Tab,bringactivetotop,

          # Move focus with mainMod + arrow keys
          bind = $mainMod, left, movefocus, l
          bind = $mainMod, right, movefocus, r
          bind = $mainMod, up, movefocus, u
          bind = $mainMod, down, movefocus, d

          # Switch workspaces with mainMod + [0-9]
          bind = $mainMod, code:10, workspace, 1
          bind = $mainMod, code:11, workspace, 2
          bind = $mainMod, code:12, workspace, 3
          bind = $mainMod, code:13, workspace, 4
          bind = $mainMod, code:14, workspace, 5
          bind = $mainMod, code:15, workspace, 6
          bind = $mainMod, code:16, workspace, 7
          bind = $mainMod, code:17, workspace, 8
          bind = $mainMod, code:18, workspace, 9
          bind = $mainMod, code:19, workspace, 10

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          bind = $mainMod SHIFT, code:10, movetoworkspace, 1
          bind = $mainMod SHIFT, code:11, movetoworkspace, 2
          bind = $mainMod SHIFT, code:12, movetoworkspace, 3
          bind = $mainMod SHIFT, code:13, movetoworkspace, 4
          bind = $mainMod SHIFT, code:14, movetoworkspace, 5
          bind = $mainMod SHIFT, code:15, movetoworkspace, 6
          bind = $mainMod SHIFT, code:16, movetoworkspace, 7
          bind = $mainMod SHIFT, code:17, movetoworkspace, 8
          bind = $mainMod SHIFT, code:18, movetoworkspace, 9
          bind = $mainMod SHIFT, code:19, movetoworkspace, 10

          # Scroll through existing workspaces with mainMod + scroll
          bind = $mainMod, mouse_down, workspace, e+1
          bind = $mainMod, mouse_up, workspace, e-1

          # Move/resize windows with mainMod + LMB/RMB and dragging
          bindm = $mainMod, mouse:272, movewindow
          bindm = $mainMod, mouse:273, resizewindow
          bindm = ALT, mouse:272, resizewindow
    '';
  };

  home.file.".config/hypr/colors".text = ''
    $background = rgba(1d192bee)
    $foreground = rgba(c3dde7ee)

    $color0 = rgba(1d192bee)
    $color1 = rgba(465EA7ee)
    $color2 = rgba(5A89B6ee)
    $color3 = rgba(6296CAee)
    $color4 = rgba(73B3D4ee)
    $color5 = rgba(7BC7DDee)
    $color6 = rgba(9CB4E3ee)
    $color7 = rgba(c3dde7ee)
    $color8 = rgba(889aa1ee)
    $color9 = rgba(465EA7ee)
    $color10 = rgba(5A89B6ee)
    $color11 = rgba(6296CAee)
    $color12 = rgba(73B3D4ee)
    $color13 = rgba(7BC7DDee)
    $color14 = rgba(9CB4E3ee)
    $color15 = rgba(c3dde7ee)
  '';
}
