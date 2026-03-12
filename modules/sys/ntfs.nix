{
  flake.aspects.sys-ntfs = {
    nixos = {
      boot.supportedFilesystems = ["ntfs"];
    };
  };
}
