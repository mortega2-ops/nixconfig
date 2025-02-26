{ pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    initExtraFirst =
      #"wal -R" + "\n" +
      "clear";

    initExtra = "neofetch";

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

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
          name = "powerlevel10k-config";
          src = ./zsh-config;
          file = "p10k.zsh";
      }
    ];

    # zplug = {
    #   enable = true;
    #   plugins = [
    #     { name = "zsh-users/zsh-autosuggestions"; }
    #     { name = "marlonrichert/zsh-autocomplete"; }
    #     { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
    #   ];
    # };

    oh-my-zsh = {
      enable = false;
      plugins = [
        "git"
        "colored-man-pages"
      ];
    };
  };
}