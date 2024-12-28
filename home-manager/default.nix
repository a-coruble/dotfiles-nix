{ self, inputs, pkgs, nixpkgs, nix-darwin, home-manager, ... }:

{
  home.stateVersion = "24.11";
  home.username = "arthurcoruble";
  home.homeDirectory = "/Users/arthurcoruble";
  home.packages = [
    pkgs.arc-browser
    pkgs.bat
    pkgs.btop
    pkgs.eza
    pkgs.fzf
    pkgs.gitui
    pkgs.nixpkgs-fmt
    pkgs.raycast
    pkgs.slack
    pkgs.starship
    pkgs.tableplus
    pkgs.volta
    pkgs.vscode
  ];

  home.sessionVariables = {
    BIN_PATHS =
      "$HOME/.volta/bin:$HOME/.cargo/bin:$HOME/.deno/bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin";
    VOLTA_HOME = "$HOME/.volta";
    PATH = "$HOME/.volta/bin:$HOME/Library/Android/sdk/emulator:$HOME/Library/Android/sdk/platform-tools:$PATH";
  };

  programs.home-manager.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd j"
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      switch = "darwin-rebuild switch --flake ~/.config/dotfiles-nix";
      gu = "gitui";
      l = "eza --all --git --long --icons=always";
      tree = "eza --all --git --long --icons=always --tree";
      cat = "bat";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Arthur Coruble";
    userEmail = "opensource@acoruble.dev";
    extraConfig = { init.defaultBranch = "main"; };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = pkgs.lib.concatStrings [
        "$username"
        "$hostname"
        "$localip"
        "$shlvl"
        "$singularity"
        "$kubernetes"
        "$directory"
        "$vcsh"
        "$fossil_branch"
        "$fossil_metrics"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$hg_branch"
        "$pijul_channel"
        "$docker_context"
        "$package"
        "$c"
        "$cmake"
        "$cobol"
        "$daml"
        "$dart"
        "$deno"
        "$dotnet"
        "$elixir"
        "$elm"
        "$erlang"
        "$fennel"
        "$gleam"
        "$golang"
        "$guix_shell"
        "$haskell"
        "$haxe"
        "$helm"
        "$java"
        "$julia"
        "$kotlin"
        "$gradle"
        "$lua"
        "$nim"
        "$nodejs"
        "$ocaml"
        "$opa"
        "$perl"
        "$php"
        "$pulumi"
        "$purescript"
        "$python"
        "$quarto"
        "$raku"
        "$rlang"
        "$red"
        "$ruby"
        "$rust"
        "$scala"
        "$solidity"
        "$swift"
        "$terraform"
        "$typst"
        "$vlang"
        "$vagrant"
        "$zig"
        "$buf"
        "$nix_shell"
        "$conda"
        "$meson"
        "$spack"
        "$memory_usage"
        "$aws"
        "$gcloud"
        "$openstack"
        "$azure"
        "$nats"
        "$direnv"
        "$env_var"
        "$crystal"
        "$custom"
        "$sudo"
        "$cmd_duration"
        "$battery"
        "$line_break"
        "$jobs"
        "$time"
        "$status"
        "$os"
        "$container"
        "$shell"
        "$character"
      ];
      aws.format = ''\[[$symbol($profile)(\($region\))(\[$duration\])]($style)\]'';
      bun.format = ''\[[$symbol($version)]($style)\]'';
      c.format = ''\[[$symbol($version(-$name))]($style)\]'';
      cmake.format = ''\[[$symbol($version)]($style)\]'';
      cmd_duration.format = ''\[[⏱ $duration]($style)\]'';
      cobol.format = ''\[[$symbol($version)]($style)\]'';
      conda.format = ''\[[$symbol$environment]($style)\]'';
      crystal.format = ''\[[$symbol($version)]($style)\]'';
      daml.format = ''\[[$symbol($version)]($style)\]'';
      dart.format = ''\[[$symbol($version)]($style)\]'';
      deno.format = ''\[[$symbol($version)]($style)\]'';
      docker_context.format = ''\[[$symbol$context]($style)\]'';
      dotnet.format = ''\[[$symbol($version)(🎯 $tfm)]($style)\]'';
      elixir.format = ''\[[$symbol($version \(OTP $otp_version\))]($style)\]'';
      elm.format = ''\[[$symbol($version)]($style)\]'';
      erlang.format = ''\[[$symbol($version)]($style)\]'';
      fennel.format = ''\[[$symbol($version)]($style)\]'';
      fossil_branch.format = ''\[[$symbol$branch]($style)\]'';
      gcloud.format = ''\[[$symbol$account(@$domain)(\($region\))]($style)\]'';
      git_branch.format = ''\[[$symbol$branch]($style)\]'';
      git_status.format = ''([\[$all_status$ahead_behind\]]($style))'';
      golang.format = ''\[[$symbol($version)]($style)\]'';
      gradle.format = ''\[[$symbol($version)]($style)\]'';
      guix_shell.format = ''\[[$symbol]($style)\]'';
      haskell.format = ''\[[$symbol($version)]($style)\]'';
      haxe.format = ''\[[$symbol($version)]($style)\]'';
      helm.format = ''\[[$symbol($version)]($style)\]'';
      hg_branch.format = ''\[[$symbol$branch]($style)\]'';
      java.format = ''\[[$symbol($version)]($style)\]'';
      julia.format = ''\[[$symbol($version)]($style)\]'';
      kotlin.format = ''\[[$symbol($version)]($style)\]'';
      kubernetes.format = ''\[[$symbol$context( \($namespace\))]($style)\]'';
      lua.format = ''\[[$symbol($version)]($style)\]'';
      memory_usage.format = ''\[$symbol[$ram( | $swap)]($style)\]'';
      meson.format = ''\[[$symbol$project]($style)\]'';
      nim.format = ''\[[$symbol($version)]($style)\]'';
      nix_shell.format = ''\[[$symbol$state( \($name\))]($style)\]'';
      nodejs.format = ''\[[$symbol($version)]($style)\]'';
      ocaml.format = ''\[[$symbol($version)(\($switch_indicator$switch_name\))]($style)\]'';
      opa.format = ''\[[$symbol($version)]($style)\]'';
      openstack.format = ''\[[$symbol$cloud(\($project\))]($style)\]'';
      os.format = ''\[[$symbol]($style)\]'';
      package.format = ''\[[$symbol$version]($style)\]'';
      perl.format = ''\[[$symbol($version)]($style)\]'';
      php.format = ''\[[$symbol($version)]($style)\]'';
      pijul_channel.format = ''\[[$symbol$channel]($style)\]'';
      pulumi.format = ''\[[$symbol$stack]($style)\]'';
      purescript.format = ''\[[$symbol($version)]($style)\]'';
      python.format = ''\[[''${symbol}''${pyenv_prefix}(''${version})(\($virtualenv\))]($style)\]'';
      raku.format = ''\[[$symbol($version-$vm_version)]($style)\]'';
      red.format = ''\[[$symbol($version)]($style)\]'';
      ruby.format = ''\[[$symbol($version)]($style)\]'';
      rust.format = ''\[[$symbol($version)]($style)\]'';
      scala.format = ''\[[$symbol($version)]($style)\]'';
      spack.format = ''\[[$symbol$environment]($style)\]'';
      sudo.format = ''\[[as $symbol]($style)\]'';
      swift.format = ''\[[$symbol($version)]($style)\]'';
      terraform.format = ''\[[$symbol$workspace]($style)\]'';
      time.format = ''\[[$time]($style)\]'';
      username.format = ''\[[$user]($style)\]'';
      vagrant.format = ''\[[$symbol($version)]($style)\]'';
      vlang.format = ''\[[$symbol($version)]($style)\]'';
      zig.format = ''\[[$symbol($version)]($style)\]'';
      solidity.format = ''\[[$symbol($version)]($style)\]'';
      battery.format = ''\[[$symbol$percentage]($style)\]'';
      battery.display = [
        {
          threshold = 10;
          style = "bold red";
        }
        {
          threshold = 50;
          style = "bold yellow";

        }
        {
          threshold = 100;
          style = "bold green";

        }
      ]; # 'bold yellow' style when capacity is between 10% and 30%
    };
  };
}
