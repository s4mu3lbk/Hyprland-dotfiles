{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
            * {
              font-family: "JetBrainsMono Nerd Font";
              font-size: 12pt;
              font-weight: bold;
              border-radius: 0px;
              transition-property: background-color;
              transition-duration: 0.5s;
            }
            @keyframes blink_red {
              to {
                background-color: rgb(242, 143, 173);
                color: rgb(26, 24, 38);
              }
            }
            .warning, .critical, .urgent {
              animation-name: blink_red;
              animation-duration: 1s;
              animation-timing-function: linear;
              animation-iteration-count: infinite;
              animation-direction: alternate;
            }
            window#waybar {
              background-color: transparent;
            }
            window > box {
              margin-left: 0px;
              margin-right: 0px;
              margin-top: 0px;
              background-color: #1e1e2a;
              padding: 1px;
              padding-left:8px;
              border: 2px none #33ccff;
            }
      #workspaces {
              padding-left: 0px;
              padding-right: 4px;
            }
      #workspaces button {
              padding-top: 5px;
              padding-bottom: 5px;
              padding-left: 6px;
              padding-right: 6px;
            }
      #workspaces button.active {
              background-color: rgb(181, 232, 224);
              color: rgb(26, 24, 38);
            }
      #workspaces button.urgent {
              color: rgb(26, 24, 38);
            }
      #workspaces button:hover {
              background-color: rgb(248, 189, 150);
              color: rgb(26, 24, 38);
            }
            tooltip {
              background: rgb(48, 45, 65);
            }
            tooltip label {
              color: rgb(217, 224, 238);
            }

      #mode, #memory, #temperature,#cpu,#mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery {
              padding-left: 10px;
              padding-right: 10px;
            }
            /* #mode { */
            /* 	margin-left: 10px; */
            /* 	background-color: rgb(248, 189, 150); */
            /*     color: rgb(26, 24, 38); */
            /* } */
      #network {
              color: #ABE9B3;
            }
      #network.disconnected {
              color: rgb(255, 255, 255);
            }
      #tray {
              padding-right: 8px;
              padding-left: 10px;
            }
    '';
    settings = [{
      "layer" = "top";
      "position" = "top";
      modules-center = [ ];
      modules-right = [
        "pulseaudio"
        "backlight"
        "memory"
        "cpu"
        "network"
        "battery"
        "custom/powermenu"
        "tray"
      ];
      "pulseaudio" = {
        "scroll-step" = 1;
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = { "default" = [ "" "" "" ]; };
        "on-click" = "pamixer -t";
        "tooltip" = false;
      };
      "memory" = {
        "interval" = 1;
        "format" = "󰻠 {percentage}%";
        "states" = { "warning" = 85; };
      };
      "cpu" = {
        "interval" = 1;
        "format" = "󰍛 {usage}%";
      };
      "mpd" = {
        "max-length" = 25;
        "format" = "<span foreground='#bb9af7'></span> {title}";
        "format-paused" = " {title}";
        "format-stopped" = "<span foreground='#bb9af7'></span>";
        "format-disconnected" = "";
        "on-click" = "mpc --quiet toggle";
        "on-click-right" = "mpc update; mpc ls | mpc add";
        "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp ";
        "on-scroll-up" = "mpc --quiet prev";
        "on-scroll-down" = "mpc --quiet next";
        "smooth-scrolling-threshold" = 5;
        "tooltip-format" =
          "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
      };
      "network" = {
        "format-disconnected" = "󰯡 Disconnected";
        "format-ethernet" = "󰒢 Connected!";
        "format-linked" = "󰖪 {essid} (No IP)";
        "format-wifi" = "󰖩 {essid}";
        "interval" = 1;
        "tooltip" = false;
      };
      "tray" = {
        "icon-size" = 15;
        "spacing" = 5;
      };
    }];
  };
}
