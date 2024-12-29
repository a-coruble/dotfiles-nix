{ self, inputs, pkgs, nixpkgs, nix-darwin, home-manager, ... }:

{
  services.nix-daemon.enable = true;

  nix.extraOptions = ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';
  nix.linux-builder.enable = true;

  system.defaults = {
    controlcenter.BatteryShowPercentage = true;
    screensaver.askForPassword = true;
    screensaver.askForPasswordDelay = 0;
    menuExtraClock.Show24Hour = true;
    dock = {
      autohide = true;
      mru-spaces = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
    };
    trackpad = {
      # tap to click
      Clicking = true;
      # tap-tap-drag to drag
      Dragging = true;
      # two-finger-tap right click
      TrackpadRightClick = true;
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.vim
      pkgs.iterm2
    ];

  homebrew = {
    enable = true;
    casks = [
      "ableton-live-lite"
      "figma"
      "ghostty"
      "notion"
      "shottr"
    ];
  };

  security.pam.enableSudoTouchIdAuth = true;

  users.users.arthurcoruble.home = "/Users/arthurcoruble";
  users.users.arthurcoruble.name = "arthurcoruble";

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;
  programs.zsh.enableFzfCompletion = true;
  programs.zsh.enableFzfHistory = true;
  programs.zsh.enableSyntaxHighlighting = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  fonts.packages = [
    pkgs.nerd-fonts.fira-code
  ];
}
