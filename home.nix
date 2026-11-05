{ pkgs, ... }:

{
  home.username = "dovyd";
  home.homeDirectory = "/home/dovyd";
  

  home.stateVersion = "26.05";

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
    configType = "hyprlang";
  };

  programs.waybar = {
    enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    
    monitor = ".preferred.auto.1";

    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
    
      "col.active_border" = "rgba(89b4faff)";
      "col.inactive_border" = "rgba(45475aff)";

      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      
      blur = {
        enabled = true;
        size = 5;
        passes = 2;
      };
  
      shadow.enabled = true;
    };

    animations = {
      enabled = true;
    };

    input = {
      kb_layout = "us";
      follow_mouse = 1;
      sensitivity = 0;
    };
    
    bind = [
      "$mod, RETURN, exec, kitty --config NONE -o linux_display_server=x11"
      "$mod, Q, killactive"
      "$mod, M, exit"
      "$mod, SPACE, exec, rofi -show drun"
      "$mod, V, togglefloating"
      "$mod, F, fullscreen"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    exec-once = [
      "waybar"
      "mako"
    ];
  };

  home.packages = with pkgs; [
    kitty
    waybar
    rofi
    mako
    thunar
    hyprlock
    hypridle
    grim
    slurp
    wl-clipboard


    git
    wget
    curl
    fastfetch
    btop
  ];

  programs.home-manager.enable = true;
}
