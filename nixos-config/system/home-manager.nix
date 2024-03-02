{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
  telescope = pkgs.vimUtils.buildVimPlugin {
    name = "telescope";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "0.1.5";
      sha256 = "1n28aiq1k12rvk2l1vr0wrdxb5016xz1bw8fqsc4zf15cg4nk50z";
    };
  };
  plenary = pkgs.vimUtils.buildVimPlugin {
    name = "plenary";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "0.1.4";
      sha256 = "1sn7vpsbwpyndsjyxb4af8fvz4sfhlbavvw6jjsv3h18sdvkh7nd";
    };
  };
in
  {
    imports = [
      (import "${home-manager}/nixos")
    ];

    home-manager.users.vaibhav = {
      /* The home.stateVersion option does not have a default and must be set */
      home.stateVersion = "18.09";
      /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */

      home.packages = with pkgs; [
        git
        tmux
        unzip
        zip
        htop
        bat
        fzf
        jq
        httpie
        tldr
        ncdu
        ffmpeg
        imagemagick
        pandoc
      ];


      programs.git = {
        enable = true;
        userName = "Vaibhav Verma";
        userEmail = "vaibhav@betteromics.com";
      };

      programs.bash = {
        enable = true;
      };

      programs.neovim = {
        enable = true;
        vimAlias = true;
        viAlias = true;
        defaultEditor = true;
        extraLuaConfig = ''
        vim.opt.guicursor = ""
        vim.opt.nu = true
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.expandtab = true
        vim.opt.smartindent = true

        vim.opt.swapfile = false
        vim.opt.backup = false
        vim.opt.undofile = true

        vim.opt.hlsearch = false
        vim.opt.incsearch = true
        vim.opt.ignorecase = true
        vim.opt.smartcase = true
        vim.opt.termguicolors = true

        vim.opt.updatetime = 50
        vim.opt.colorcolumn = "80"

        vim.opt.wildmenu = true
        vim.opt.wildmode = "longest:list"

        vim.opt.mouse = "r"

        -- disable netrw in favor of nvim-tree
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        '';
        plugins = with pkgs.vimPlugins; [
          { plugin = vim-airline; }
          { plugin = telescope; }
          { plugin = plenary; }
          { plugin = vim-nix; }
        ];
      };
    };
  }
