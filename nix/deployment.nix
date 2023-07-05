{
  hercules-ci.netlify-deploy."israel-nix-ug" = {
    content = { config, ... }: config.packages.default;
    productionDeployment = { branch, ... }: (branch == "master");
    secretName = "netlify";
    siteId = "8d1c128d-8268-4bfc-83d8-06773bfd6e0c";
  };
}
