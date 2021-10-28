// Inherit the parent event
event_inherited();

speed = 4;

part_type_shape(projectileParticle, pt_shape_ring);
part_type_size(projectileParticle, 0.6, 0.8, 0, 0.1);
part_type_color3(projectileParticle, WHITE, WHITE, DARKBLUE);
part_type_alpha3(projectileParticle, 0.4, 0.1, 0);
part_type_speed(projectileParticle, 0.5, 1.5, -0.10, 0);
part_type_direction(projectileParticle, 0, 359, 0, 5);
part_type_blend(projectileParticle, true);
part_type_life(projectileParticle, 10, 15);
