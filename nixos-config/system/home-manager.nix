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
  copilot = pkgs.vimUtils.buildVimPlugin {
    name = "copilot";
    src = pkgs.fetchFromGitHub {
      owner = "github";
      repo = "copilot.vim";
      rev = "v1.24.0";
      sha256 = "0jd62dx6qzj60az36qc8rsj6aiqfc1jg7c4fgxl5rhjcws6b3wpj";
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
        pkgs.nodePackages.typescript-language-server
        pkgs.nodePackages.pyright
        pkgs.vscode-langservers-extracted
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


        -- keymaps

        vim.g.mapleader = ","
        vim.keymap.set("n", "<leader>n", vim.cmd.Ex)
        vim.keymap.set("i", "jk", "<esc>", {noremap=true})
        vim.keymap.set("i", "jj", "<esc>", {noremap=true})

        -- move command in visual mode
        vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
        vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

        vim.keymap.set("n", "J", "mzJ`z")
        vim.keymap.set("n", "<C-d>", "<C-d>zz")
        vim.keymap.set("n", "<C-u>", "<C-u>zz")
        vim.keymap.set("n", "n", "nzzzv")
        vim.keymap.set("n", "N", "Nzzzv")

        -- greatest remap ever
        vim.keymap.set("x", "<leader>p", [["_dP]])

        -- next greatest remap ever : asbjornHaland
        -- copies to system clipboard
        vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
        vim.keymap.set("n", "<leader>Y", [["+Y]])

        vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

        vim.keymap.set("n", "Q", "<nop>")
        vim.keymap.set("n", "q:", "<nop>")

        -- quickfix commands
        vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
        vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
        vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
        vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

        vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

        vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/vverma/packer.lua<CR>");

        vim.keymap.set("n", "<leader><leader>", function()
            vim.cmd("so")
        end)

        if vim.api.nvim_win_get_option(0, "diff") then
            vim.keymap.set("n", "qq", ":qa<cr>", {noremap=true})
        end


        '';
        plugins = with pkgs.vimPlugins; [
          { 
            plugin = telescope; 
            type = "lua";
            config = ''
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- Find the .git directory or file in the current directory or its ancestors
local git_dir = vim.fn.finddir('.git', '.;')

-- If the .git directory or file is found, the current directory is a Git repository
if git_dir ~= ''' then
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
else
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
end
vim.keymap.set('n', '<C-h>', ':Telescope live_grep default_text=<C-r><C-w><CR>', {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

'';
          }
          { plugin = plenary; }
          { 
            plugin = nvim-treesitter.withAllGrammars; 
            type = "lua";
            config = ''

require'nvim-treesitter.configs'.setup {
  indent = { 
      enable = true
  },

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

'';
          }
          { 
            plugin = seoul256-vim; 
            type = "lua";
            config = "vim.cmd('colorscheme seoul256')";
          }
          { 
            plugin = jellybeans-nvim; 
            type = "lua";
            config = ''
if vim.api.nvim_win_get_option(0, "diff") then
  vim.cmd('colorscheme jellybeans-nvim')
end
'';
          }
          { 
            plugin = undotree; 
            type = "lua";
            config = '' vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) '';
          }
          { 
            plugin = vim-fugitive; 
            type = "lua";
            config = ''vim.keymap.set("n", "<leader>gs", vim.cmd.Git);'';
          }
          { plugin = copilot; }
          { plugin = nvim-web-devicons; }
          { 
            plugin = nvim-tree-lua; 
            type = "lua";
            config = ''
require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    update_focused_file = {
        enable = true,
        update_root = true
    },
})

vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
'';
          }
          { plugin = vim-commentary; }
          { plugin = trouble-nvim; }
          { plugin = vim-nix; }
          { 
            plugin = vim-prettier;
            runtime = {
              "ftplugin/javascript.lua".text = ''
                vim.opt_local.tabstop = 2
                vim.opt_local.softtabstop = 2
                vim.opt_local.shiftwidth = 2
              '';
              "ftplugin/typescript.lua".text = ''
                vim.opt_local.tabstop = 2
                vim.opt_local.softtabstop = 2
                vim.opt_local.shiftwidth = 2
              '';
              "ftplugin/typescriptreact.lua".text = ''
                vim.opt_local.tabstop = 2
                vim.opt_local.softtabstop = 2
                vim.opt_local.shiftwidth = 2
              '';
            };
          }

          # lsp plugins
          { plugin = nvim-lspconfig; }
          { plugin = mason-nvim; }
          { plugin = mason-lspconfig-nvim; }
          { plugin = nvim-cmp; }
          { plugin = cmp-nvim-lsp; }
          {
            plugin = lsp-zero-nvim;
            type="lua";
            config = ''
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp_zero.setup_servers({'tsserver', 'eslint', 'pyright'})

lsp_zero.setup()
lsp_zero.setup_nvim_cmp({})


-- Completions
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}


cmp.setup({
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['Tab'] = nil,
    ['<S-Tab>'] = nil,
  }),
})

'';
          }
        ];

      };

      # needs ftplugin migrated to the runtime folder
    };
  }
