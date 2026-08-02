vim.lsp.config("nixd", {
  settings = {
    nixd = {
      formatting = {
        command = {"nixfmt"},
      },
      options = {
        nixos = {
          expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.lithium.options",
        },
        ["home-manager"] = {
          expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.lithium.options.home-manager.users.type.getSubOptions []",
        },
      },
    },
  },
})

vim.lsp.enable("nixd")

-- vim: sw=2
