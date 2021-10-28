// Inherit the parent event
event_inherited();
flash = 1;
spd = 3;
bounce = 0;
collectRadius = 30;
magnetRadius = 120;
lifetime = 0;
interactionTime = 60;

itemPickup = new item();

collectableParticle = part_type_create();
part_type_shape(collectableParticle, pt_shape_spark);
part_type_size(collectableParticle, 0.1, 0.2, 0, 0.5);
part_type_color3(collectableParticle, c_yellow, WHITE, c_yellow);
part_type_alpha3(collectableParticle, 0.5, 0.2, 0);
part_type_speed(collectableParticle, 2, 3, 0, 1);
part_type_direction(collectableParticle, 70, 110, 0, 5);
part_type_blend(collectableParticle, true);
part_type_life(collectableParticle, 30, 50);