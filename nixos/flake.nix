{
  description = "Leo's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
       chillpill-shell = {
      url = "github:LUCKYS1NGHH/chillpill-shell";
       };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    
  };
  outputs = inputs: import ./flake/outputs.nix inputs;
}
