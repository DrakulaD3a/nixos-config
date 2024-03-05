{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "swaylock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate && swaylock";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "poweroff";
        action = "systemctl poweroff";
        text = "Poweroff";
        keybind = "p";
      }
      {
        label = "suspend";
        action = "systemctl suspend && swaylock";
        text = "Suspend";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
    style = ''
      * {
        background-image: none;
      }

      window {
        background-color: rgba(12, 12, 12, 0.6);
      }

      button {
        border-style: solid;
        border-width: 2px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        color: #fff;
      }

      button:focus,
      button:active,
      button:hover {
        outline-style: none;
        background-color: #000;
      }

      #lock {
        background-image: image(
          url("/usr/share/wlogout/icons/lock.png"),
          url("/usr/local/share/wlogout/icons/lock.png")
        );
      }

      #logout {
        background-image: image(
          url("/usr/share/wlogout/icons/logout.png"),
          url("/usr/local/share/wlogout/icons/logout.png")
        );
      }

      #suspend {
        background-image: image(
          url("/usr/share/wlogout/icons/suspend.png"),
          url("/usr/local/share/wlogout/icons/suspend.png")
        );
      }

      #hibernate {
        background-image: image(
          url("/usr/share/wlogout/icons/hibernate.png"),
          url("/usr/local/share/wlogout/icons/hibernate.png")
        );
      }

      #poweroff {
        background-image: image(
          url("/usr/share/wlogout/icons/shutdown.png"),
          url("/usr/local/share/wlogout/icons/shutdown.png")
        );
      }

      #reboot {
        background-image: image(
          url("/usr/share/wlogout/icons/reboot.png"),
          url("/usr/local/share/wlogout/icons/reboot.png")
        );
      }
    '';
  };
}
