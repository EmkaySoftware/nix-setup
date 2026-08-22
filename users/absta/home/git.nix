{ config, lib, ... }: 
{
  config = lib.mkIf config.profiles.git.active {
    programs.git = {
      settings.user = {
	name = "EmkaySoftware";
	email = "dunno@email.com";
      };
    };
  };
}
