{ pkgs ? import <nixpkgs> {} }: {
  default = pkgs.mkShell {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    NIXPKGS_ALLOW_INSECURE = 1;
    nativeBuildInputs = with pkgs; [nix git neovim];
  };
}
