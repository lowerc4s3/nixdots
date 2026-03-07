{
  flake.modules.nixos.sys-ntfs = {
    boot.supportedFilesystems = ["ntfs"];
  };
}
