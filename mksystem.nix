{ inputs, nixpkgs }: 
hostname: { system, hardware, stateVersion, extraModules ? [] }: nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    ./hardware/${hardware}.nix
    ./system/configuration.nix
    inputs.home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      hom-manager.users.ryan = import ./home/ryan/home.nix;
    }
    { 
      networking.hostName = hostname;
      syste.stateVersion = stateVersion;
    }
  ] ++ extraModules;
}
