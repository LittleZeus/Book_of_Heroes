
// Inherit the parent event
event_inherited();

parent = -1;
lifetime = 0;
maxLifetime = -1;

hitByAttack = ds_list_create();
ds_list_clear(hitByAttack);

hitbox = sprite_index;

offsetY = 0;
offsetX = 0;

projectileParticle = part_type_create();

image_alpha = 0.8;
blend = bm_add;
