{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./vmware-guest.nix
    ];

  networking.hostName = "nixos-vm"; # Define your hostname.
  networking.networkmanager.enable = true;
  # Disable the firewall since we're in a VM and we want to make it
  # easy to visit stuff in here. We only use NAT networking anyways.
  networking.firewall.enable = false;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;

  # Interface is this on M1
  networking.interfaces.ens160.useDHCP = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # VMware, Parallels both only support this being 0 otherwise you see
  # "error switching console mode" on boot.
  boot.loader.systemd-boot.consoleMode = "0";

  # Setup qemu so we can run x86_64 binaries
  boot.binfmt.emulatedSystems = ["x86_64-linux"];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;
  services.openssh.settings.PermitRootLogin = "yes";
  users.users.root.initialPassword = "root";

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
        fcitx5-chinese-addons
      ];
    };
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Don't require password for sudo
  security.sudo.wheelNeedsPassword = false;

  # Virtualization settings
  virtualisation.docker.enable = true;

  # Lots of stuff that uses aarch64 that claims doesn't work, but actually works.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  nix = {
    # use unstable nix so we can access flakes
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  environment.variables = {
    # Set the default editor.
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  environment.shellAliases = {
    vim = "nvim";
    vi = "nvim";
    sudo = "sudo ";
  };

  environment.systemPackages = with pkgs; [
    gnumake
    killall
    niv
    rxvt_unicode
    xclip
    git
    tmux
    wget
    neovim
    llm
    silver-searcher

    # This is needed for the vmware user tools clipboard to work.
    # You can test if you don't need this by deleting this and seeing
    # if the clipboard sill works.
    gtkmm3
  ];


  # Disable the default module and import our override. We have
  # customizations to make this work on aarch64.
  disabledModules = [ "virtualisation/vmware-guest.nix" ];

  # This works through our custom module imported above
  virtualisation.vmware.guest.enable = true;

  # Share our host filesystem
  fileSystems."/Users" = {
    fsType = "fuse./run/current-system/sw/bin/vmhgfs-fuse";
    device = ".host:/";
    options = [
      "uid=1000"
      "gid=100"
      "nofail"
      "allow_other"
      "auto_unmount"
      "defaults"
    ];
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    xkbOptions = "caps:escape";

    autoRepeatDelay = 300;
    autoRepeatInterval = 50;
  };


  ## OS user config

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  users.users.vaibhav = {
    isNormalUser = true;
    home = "/home/vaibhav";
    hashedPassword = "$y$j9T$ajets3mVmRq4n/So8GYCD1$g3SoYHjEbwrJ2XXTOGRTDGKZhbPb7ANo6Oesskz5UwD";
    extraGroups = [ "docker" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII6/a5fVBGiYd4LfP4POWHUPIq5LeibpJO41Obxx9gOS vaibhav@betteromics.com"
    ];
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
 
		

}

