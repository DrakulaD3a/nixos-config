{ config, lib, pkgs, host, user, proj_root, ... }:

{
  environment.systemPackages = with pkgs; [ waybar ];

  home-manager.users.${user} = {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      settings.mainBar = {
        spacing = 4;
        modules-left = [ "wlr/workspaces" ];
        modules-center = [ "hyprland/submap" ];
        modules-right = [
          "hyprland/language"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "backlight"
          "battery"
          "clock"
        ];

        "wlr/workspaces" = {
          on-click = "activate";
          sort-by-number = true;
          format = "{icon}";
          format-icons = {
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
        };

        "hyprland/submap" = {
          format = "{}";
          max-length = 30;
          tooltip = false;
        };

        "hyprland/language" = {
          format = " {}";
          format-en = "en";
          format-cs = "cz";
        };

        pulseaudio = {
          format = "{icon} {volume} {format_source}";
          format-muted = " {format_source}";
          format-bluetooth = " {volume}";
          format-bluetooth-muted = " {volume}";
          format-source = " {volume}";
          format-source-muted = "";
          format-icons = {
            default = [ "" "" "" ];
          };
          tooltip = false;
        };

        network = {
          format = "  {essid}";
          tooltip = false;
        };

        cpu = {
          states = {
            "warning" = 90;
          };
          format = " {usage}%";
          tooltip = false;
        };

        memory = {
          states = {
            "warning" = 90;
          };
          format = " {}%";
          tooltip = false;
        };

        backlight = {
          format = "{icon} {percent}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        battery = {
          states = {
            "good" = 95;
            "warning" = 20;
            "critical" = 10;
          };
          format = "{icon}{capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = [ " " " " " " " " " " ];
          tooltip = false;
        };

        clock = {
          timezone = "Europe/Prague";
          format = " {:%H:%M}";
          format-alt = " {:%d.%m.%Y}";
          tooltip = false;
        };

        style = builtins.readFile "${proj_root.config.path}/waybar/style.css";
      };
    };
  };
}
