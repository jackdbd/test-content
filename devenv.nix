{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  enterShell = ''
    echo "Pulling from origin..."
    git pull origin main
  '';

  env = {
    CONTENTS_API_GITHUB_TOKEN = builtins.readFile /run/secrets/github-tokens/crud_contents_api;
  };

  packages = with pkgs; [
    git
    git-lfs
  ];

  scripts = {
    versions.exec = ''
      echo "=== Versions ==="
      git --version
      git-lfs --version
      echo "=== === ==="
    '';
  };
}
