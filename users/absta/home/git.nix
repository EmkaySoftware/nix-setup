{ config, lib, ... }: 
{
  config = lib.mkIf config.profiles.git.active {
    assertions = [
      {
	assertion = true;
	message = "Hello from the git feature!";
      }
    ];

     programs.git = {
      settings.user = {
	name = "EmkaySoftware";
	email = "dunno@email.com";
      };
    };
  };
}
