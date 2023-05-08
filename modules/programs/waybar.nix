{ config, lib, pkgs, host, user, ... }:

{
  environment.systemPackages = with pkgs; [ waybar ];

  home-manager.users.${user} = {
    programs.waybar = {
      enable = true;
      style = ''
	* {
	    font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
	    font-size: 13px;
	    margin: -1px;
	}

	window#waybar {
	    background-color: #000000;
	    color: #ffffff;
	    transition-property: background-color;
	}

	button {
	    /* Avoid rounded borders under each button name */
	    border: none;
	    border-radius: 0;
	}

	#workspaces button {
	    padding: 0 5px;
	    background-color: transparent;
	    color: #ffffff;
	}

	#workspaces button:hover {
	    background: rgba(0, 0, 0, 0.2);
	}

	#workspaces button.active {
	    background-color: #64727D;
	    box-shadow: inset 0 -3px #ffffff;
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
	#mpd {
	    padding: 0 10px;
	    color: #ffffff;
	}

	#submap {
	  font-weight: bold;
	  background-color: #ff0000;
	}

	#window,
	#workspaces {
	    margin: 0 4px;
	}

	/* If workspaces is the leftmost module, omit left margin */
	/* .modules-left > widget:first-child > #workspaces {
	    margin-left: 0;
	} */

	/* If workspaces is the rightmost module, omit right margin */
	.modules-right > widget:last-child > #workspaces {
	    margin-right: 0;
	}

	#clock {
	    background-color: #000000;
	}

	#battery {
	    background-color: #000000;
	    color: #ffffff;
	}

	#battery.charging, #battery.plugged {
	    color: #26A65B;
	    background-color: #000000;
	}

	#battery.critical:not(.charging) {
	    background-color: #000000;
	    color: #f53c3c;
	}

	#cpu {
	    background-color: #000000;
	    color: #2ecc71;
	}

	#memory {
	    background-color: #000000;
	    color: #9b59b6;
	}

	#disk {
	    background-color: #000000;
	    color: #964B00;
	}

	#backlight {
	    background-color: #000000;
	    color: #90b1b1;
	}

	#network {
	    background-color: #000000;
	    color: #2980b9;
	}

	#network.disconnected {
	    background-color: #000000;
	    color: #f53c3c;
	}

	#pulseaudio {
	    color: #f1c40f;
	    background-color: #000000;
	}

	#pulseaudio.muted {
	    color: #90b1b1;
	    background-color: #000000;
	}

	#wireplumber {
	    color: #fff0f5;
	    background-color: #000000;
	}

	#wireplumber.muted {
	    color: #f53c3c;
	    background-color: #000000;
	}

	#temperature {
	    color: #f0932b;
	    background-color: #000000;
	}

	#temperature.critical {
	    color: #eb4d4b;
	    background-color: #000000;
	}

	#tray {
	    color: #2980b9;
	    background-color: #000000;
	}

	#tray > .passive {
	    -gtk-icon-effect: dim;
	}

	#tray > .needs-attention {
	    -gtk-icon-effect: highlight;
	    background-color: #eb4d4b;
	}

	#idle_inhibitor {
	    background-color: #2d3436;
	}

	#idle_inhibitor.activated {
	    background-color: #ecf0f1;
	    color: #2d3436;
	}

	#language {
	    background-color: #000000;
	    color: #ffffff;
	    padding: 0 5px;
	    margin: 0;
	    min-width: 16px;
	}

	#keyboard-state {
	    color: #97e1ad;
	    background-color: #000000;
	    padding: 0 0px;
	    margin: 0 5px;
	    min-width: 16px;
	}

	#keyboard-state > label {
	    padding: 0 5px;
	}

	#keyboard-state > label.locked {
	    background: rgba(0, 0, 0, 0.2);
	}

	#scratchpad {
	    background: rgba(0, 0, 0, 0.2);
	}

	#scratchpad.empty {
		background-color: transparent;
	}
      '';

      settings = with host; {
	Main = {
	  layer = "top";
	  position = "top";
	  spacing = 4;

	  modules-left = ["wlr/workspaces"];
	  modules-center = ["hyprland/submap"];
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

	  "cpu" = {
	    states = {
	      "warning" = 90;
	    };
	    format = " {usage}%";
	    tooltip = false;
	  };

	  "memory" = {
	    states = {
	      "warning" = 90;
	    };
	    format = " {}%";
	    tooltip = false;
	  };

	  "pulseaudio" = {
	    format = "{icon} {volume} {format_source}";
	    format-muted = " {format_source}";
	    format-bluetooth = " {volume}";
	    format-bluetooth-muted = " {volume}";
	    format-source = " {volume}";
	    format-source-muted = "";
	    format-icons = {
	      default = ["" "" ""];
	    };
	    tooltip = false;
	  };

	  "backlight" = {
	    format = "{icon} {percent}";
	    format-icons = ["" "" "" "" "" "" "" "" ""];
	  };

	  "network" = {
	    format = "  {essid}";
	    tooltip = false;
	  };

	  "battery" = {
	    states = {
	      "good" = 95;
	      "warning" = 20;
	      "critical" = 10;
	    };
	    format = "{icon}{capacity}%";
	    format-charging = " {capacity}%";
	    format-plugged = " {capacity}%";
	    format-icons = [" " " " " " " " " "];
	    tooltip = false;
	  };

	  "clock" = {
	    timezone = "Europe/Prague";
	    format = " {:%H:%M}";
	    format-alt = " {:%d.%m.%Y}";
	    tooltip = false;
	  };
	};
      };
    };
  };
}
