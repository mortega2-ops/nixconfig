{ pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    initExtraFirst =
      #"wal -R" + "\n" +
      "clear";

    initExtra =
      "source ~/.p10k.zsh" + "\n" +
      "neofetch" + "\n" +
      "export TERM=xterm" + "\n" +
      "export EDITOR=nvim" + "\n" +
      "bindkey '^[[A' menu-complete"
    ;

    shellAliases = {
      nix-edit = "code /etc/nixos";

      update = "sudo nixos-rebuild switch";
      flake-update = "nix flake update /etc/nixos";

      upgrade-desktop = "sudo nixos-rebuild switch --upgrade --flake /etx/nixos#default";
    };

    enableCompletion = false;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    historySubstringSearch = {
      enable = true;
      searchUpKey = [ "\\eOA" ];
      searchDownKey = [ "\\eOB" ];
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "marlonrichert/zsh-autocomplete"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };

    oh-my-zsh = {
      enable = false;
      plugins = [
        "git"
        "colored-man-pages"
      ];
    };
  };
}