switch:
	sudo nix run nix-darwin -- switch --flake ~/dotfiles/darwin-nix-config

home-switch:
	home-manager switch --impure --flake ~/dotfiles/darwin-nix-config#$$USER -b backup

