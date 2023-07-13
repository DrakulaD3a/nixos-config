{ config, lib, pkgs, host, user, ... }:

{
  environment.systemPackages = with pkgs; [ waybar ];

  home-manager.users.${user} = {
    programs.waybar = {
      enable = true;
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

        style = ''
          * {
              font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
              font-size: 13px;
              color: #c0caf5;
            }

            window#waybar {
              background-color: transparent;
              border-bottom: 3px solid transparent;
              transition-property: background-color;
              transition-duration: 0.5s;
            }

            window#waybar.hidden {
              opacity: 0.2;
            }

            button {
              box-shadow: inset 0 -3px transparent;
              border: none;
              border-radius: 0;
            }

            button:hover {
              box-shadow: inset 0 -3px #c0caf5;
            }

            #workspaces button {
              padding: 5px;
              background-color: transparent;
            }

            #workspaces button:hover {
              background: rgba(0, 0, 0, 0.2);
            }

            #workspaces button.active {
              box-shadow: inset 0 -3px #c0caf5;
            }

            #workspaces button.urgent {
              background-color: #eb4d4b;
            }

            #mode {
              background-color: #64727D;
              border-bottom: 3px solid #ffffff;
            }

            #language,
            #submap,
            #clock,
            #battery,
            #cpu,
            #memory,
            #disk,
            #temperature,
            #backlight,
            #network,
            #pulseaudio,
            #wireplumber,
            #custom-media,
            #tray,
            #mode,
            #idle_inhibitor,
            #scratchpad,
            #mpd,
            #window,
            #workspaces {
              margin-top: 0.1rem;
              background-color: #1a1b26;
              padding: 0 0.5rem;
              border-radius: 0.75rem
            }

            #tray {
              margin-right: 0.5rem;
            }

            #submap {
              font-weight: bold;
              background-color: #eb4d4b;
            }

            .modules-left > widget:first-child > #workspaces {
              margin-left: 0.9rem;
            }

            .modules-right {
              margin-right: 0.9rem;
            }

            .modules-right > widget:last-child > #workspaces {
              margin-right: 0.9rem;
            }
        '';
      };
    };
  };
}
