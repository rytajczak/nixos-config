{ pkgs, ... }: {
  imports = [
    ./desktop/plasma
    ./programs
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
    permittedInsecurePackages = [
      # megasync
      "freeimage-unstable-2021-11-01"
    ];
  };

  home = {
    username = "ryan";
    homeDirectory = "/home/ryan";
    stateVersion = "23.11";
  };

  home.packages = with pkgs; [
    # CLI Tools
    sl
    cachix
    devenv

    # Tools 
    vscode
    jetbrains.idea-ultimate
    jetbrains.rider
    jetbrains.goland
    jetbrains.datagrip
    mongodb-compass
    insomnia
    postman
    obsidian
    obs-studio

    # Communication
    discord
    vesktop
    teams-for-linux

    # Misc
    megasync
    tidal-hifi
  ];

  programs = {
    git.enable = true;
    neovim.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
