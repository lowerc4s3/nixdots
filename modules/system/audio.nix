{
  flake.modules.nixos.audio = {
    # Realtime priority (needed for pipewire)
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = false; # Not sure if I need this
    };
  };
}
