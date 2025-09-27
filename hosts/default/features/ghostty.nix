{ pkgs, config, ... }:

{

  programs.ghostty = {
    enable = true;
    theme = "GruvboxDark";
  };
}