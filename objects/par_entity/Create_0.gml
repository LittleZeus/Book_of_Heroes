
z = 0;
flash = 0;
flashShader = sha_WhiteFlash;
uFlash = shader_get_uniform(flashShader, "flash");
lifted = 0;
thrown = false;
entityDropList = -1;
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
blend = -1;
