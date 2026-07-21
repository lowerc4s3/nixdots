vim.lsp.config("nixd", {
  settings = {
    nixd = {
      formatting = {
        command = {"alejandra"},
      },
      options = {
        nixos = {
          expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.lithium.options",
        },
        ["home-manager"] = {
          expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.lithium.options.home-manager.users.type.getSubOptions []",
        },
        ["flake-parts"] = {
          expr =  "(builtins.getFlake (builtins.toString ./.)).debug.options",
        },
      },
    },
  },
})

vim.lsp.enable("nixd")

-- vim: sw=2
