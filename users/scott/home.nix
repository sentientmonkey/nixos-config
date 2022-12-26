{ config, pkgs, ... }:

{
  home.username = "scott";
  home.homeDirectory = "/home/scott";

  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  #programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    initExtra = builtins.readFile ./zshrc;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty;
  };

  programs.git = {
    enable = true;
    userName  = "Scott Windsor";
    userEmail = "swindsor@gmail.com";
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
      down = "pull --rebase";
      up = "push -u";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  home.packages = [
    pkgs.direnv
    pkgs.fd
    pkgs.git
    pkgs.kitty
    pkgs.sd
    pkgs.starship
    pkgs.ripgrep
    pkgs.tree
    pkgs.vim
    pkgs.watch
  ];

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "vim";
  };
}
