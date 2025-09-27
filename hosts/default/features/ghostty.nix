{ pkgs, config, ... }:

{
  programs.ghostty = {
    enable = true;
    theme = "Firewatch";
    settings = {
      font-size = 16;
      font-family = "JetBrainsMono Nerd Font";
      
      unfocused-split-opacity = 0.96;

      # Disables ligatures
      font-feature = ["-liga" "-dlig" "-calt"];

    };
  };
}
